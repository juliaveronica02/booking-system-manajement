const Models = require("../models");
const User = Models.admin;
const Logging = Models.logging;
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const privateKey = "null";
const saltRounds = 12;
const validateRegister = require("../middleware/register-validation")
const validateLogin = require("../middleware/login-validation"); 

module.exports = {
    register: (req, res, next) => {
        const {errors, isValid} = validateRegister(req.body)
        if (!isValid) {
            return res.status(400).json(errors)
        }
        User.findOne({where: {email: req.body.email}}).then((user)=> {
            if (user) {
                return res.status(401).json({email: "Email already exists!"})
            } else {
                const newUser = new User({
                    username: req.body.username,
                    email: req.body.email,
                    fullname: req.body.fullname,
                    password: req.body.password,
                    passwordConfirm: req.body.passwordConfirm
                })
                bcrypt.genSalt(saltRounds, function(err, salt){
                    bcrypt.hash(newUser.password, salt, function(err, hash){
                        if(err) throw err;
                        newUser.password = hash;
                        newUser
                        .save()
                        .then((result)=> {
                            if(req.body.password !== req.body.passwordConfirm) {
                                res.json("password not match!")
                            } else {
                                req.body.password == req.body.passwordConfirm
                                res.json(result)
                            }
                        })
                        .catch((err)=> {
                            throw err;
                        })
                    })
                })
            }
        })
    },
    login: (req,res, next) => {
        const {errors, isValid} = validateLogin(req.body)
        if(!isValid) {
            return res.status(400).json(errors)
        }
        const {email, password, phone} = req.body
        let conditions = !!email ? {where: {email: email}} : {where: {phone: phone}}
        if(email) {
            conditions = {where: {email: email}}
        } else if (phone) {
            conditions = {where: {phone:phone}}
        }
        User.findOne({...conditions}).then((user) => {
            if(!user) {
                return res.status(404).json({emailOrPhoneNotFound: "Email or phone not found!"})
            }
            bcrypt.compare(password, user.password).then((response)=> {
                const {id} = user
                if(response) {
                    const token = jwt.sign({
                        email,
                        role: "admin",
                    }, privateKey, {expiresIn: 60*60})
                    res.status(200).send({
                        message: "Admin session",
                        role: "admin",
                        id,
                        email,
                        token
                    })
                    return Logging.create({
                        idUser: id,
                        email,
                        role: "admin",
                        token,
                    }).then((newLog)=> {
                        Logging.build(newLog)
                    })
                } else {
                    res.status(417).send({message: "Wrong password!"})
                }
            })
        })
    },
    getData: (req, res) => {
        User.findAll({})
        .then(admins =>
            res.status(200).send({
              admins
            })
          )
          .catch(err => res.status(500).send(err));
    }
}
const Models = require("../models")
const Car = Models.car

module.exports = {
    create: (req, res) => {
        Car.create({
            type: req.body.type,
            brand: req.body.brand,
            color: req.body.color,
            productionYear: req.body.productionYear,
            cost: req.body.cost,
            quantity: req.body.quantity
        })
        .then((result) => res.json(result))
        .catch((err) => {
            throw err;
        });
    },
    getData: (req, res) => {
        Car.findAll({})
          .then((result) => res.json(result))
          .catch((err) => res.json(err));
    },
}
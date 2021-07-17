var express = require('express');
var router = express.Router();

const userController = require("../controllers/user");
const adminController = require("../controllers/admin");
const auth = require("../middleware/authentication")
const car = require("../controllers/car")

router.get("/show", auth.validateUser, userController.getData)
router.post("/register", userController.register)
router.post("/login", userController.login)
router.get("/show-admin", auth.validateAdmin, adminController.getData)
router.post("/register2", adminController.register)
router.post("/login2", adminController.login)
router.get("/show-car", car.getData)
router.post("/create-car", car.create)
router.delete("/delete-car/:carId", car.deleteById)

module.exports = router;
const jwt = require("jsonwebtoken");
const privateKey = "null";

module.exports.validateUser = (req, res, next) => {
    jwt.verify(req.headers["access-token"], privateKey, (err, decoded) => {
        if (err && err.expiredAt) {
          res.status(401).json({
            ...err,
            status: "error",
            message: "The token is expired. Try to login as user again.",
          });
        } else if (!err && decoded && decoded.role == "user") {
          req.tokenId = decoded.id; // pass token data (id) to any controller that need it.
          next();
        } else {
          res.status(401).json({
            ...err,
            status: "error",
            message: "Unauthenticated as an user.",
          });
        }
      });
};

module.exports.validateAdmin = (req, res, next) => {
  jwt.verify(req.headers["access-token"], privateKey, (err, decoded) => {
    if (err && err.expiredAt) {
      res.status(401).json({
        ...err,
        status: "error",
        message: "The token is expired. Try to login as admin again.",
      });
    } else if (!err && decoded && decoded.role == "admin") {
      req.tokenId = decoded.id; // pass token data (id) to any controller that need it.
      next();
    } else {
      res.status(401).json({
        ...err,
        status: "error",
        message: "Unauthenticated as an admin.",
      });
    }
  });
};
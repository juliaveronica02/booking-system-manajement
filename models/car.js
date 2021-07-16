'use strict';
const { v4: uuidv4 } = require('uuid');

module.exports = (sequelize, DataTypes) => {
  const car = sequelize.define('car', {
    type: {
      type: DataTypes.ENUM("manual", "auto"),
      defaultValue: "auto"
    },
    brand: {
      type: DataTypes.ENUM("avanza", "toyota", "tesla"),
      defaultValue: "tesla"
    },
    color: {
      type: DataTypes.ENUM("black", "white", "gray", "red", "blue"),
      defaultValue: "white"
    },
    carId: {
      type:DataTypes.UUID,
      defaultValue: uuidv4(),
      allowNull: false,
      unique: true,
    },
    productionYear: DataTypes.INTEGER,
    cost: {
      type: DataTypes.BIGINT,
      defaultValue: 1000
    },
    quantity: {
      type: DataTypes.INTEGER,
      defaultValue: 1
    }
  }, {});
  car.associate = function(models) {
    // associations can be defined here
  };
  return car;
};
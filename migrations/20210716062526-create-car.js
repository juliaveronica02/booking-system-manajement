'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('cars', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      type: {
        type: Sequelize.ENUM("manual", "auto")
      },
      brand: {
        type: Sequelize.ENUM("avanza", "toyota", "tesla")
      },
      color: {
        type: Sequelize.ENUM("black", "white", "gray", "red", "blue")
      },
      carId: {
        type: Sequelize.STRING,
      },
      productionYear: {
        type: Sequelize.INTEGER
      },
      cost: {
        type: Sequelize.BIGINT,
      },
      quantity: {
        type: Sequelize.INTEGER,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('cars');
  }
};
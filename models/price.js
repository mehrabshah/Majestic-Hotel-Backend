const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const Categories = require('./categories');

const Prices = sequelize.define('Prices', {
    date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    price: {
      type: DataTypes.FLOAT,
      allowNull: false,
    }
  }, {
    tableName: 'prices',
  });
  module.exports = Prices;
  // Define the many-to-many relationship
//   Categories.belongsToMany(Prices, { through: 'CategoryPrices' });
//   Prices.belongsToMany(Categories, { through: 'CategoryPrices' });
const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');

const CategoryPrices = sequelize.define('CategoryPrices', {
  categoryId: {
    type: DataTypes.INTEGER,
    references: {
      model: 'Categories',
      key: 'id'
    },
    onDelete: 'CASCADE'
  },
  priceId: {
    type: DataTypes.INTEGER,
    references: {
      model: 'Prices',
      key: 'id'
    },
    onDelete: 'CASCADE'
  }
}, {
  tableName: 'category_prices',
  timestamps: false,
});

module.exports = CategoryPrices;

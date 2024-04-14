// models/CategoryImage.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');

const CategoryImage = sequelize.define('CategoryImage', {
  categoryId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  filename: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  tableName: 'categoryImages', 
});

module.exports = CategoryImage;

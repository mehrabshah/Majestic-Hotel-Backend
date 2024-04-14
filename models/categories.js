const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const RoomImage = require('./roomImage');

const Categories = sequelize.define('Categories', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  image: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  price: {
    type: DataTypes.FLOAT, 
    allowNull: false,
  },
}, {
  tableName: 'categories',
});

Categories.hasMany(RoomImage, { foreignKey: 'roomId', onDelete: 'CASCADE' });

module.exports = Categories;

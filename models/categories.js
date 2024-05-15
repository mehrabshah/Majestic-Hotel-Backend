const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const RoomImage = require('./roomImage');
const Room = require('./room');
const Prices = require('./price');
const CategoryPrices = require('./CategoryPrices');

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
  capacity: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  capacityChild: {
    type: DataTypes.STRING, 
    allowNull: true,
  }
}, {
  tableName: 'categories',
});
Categories.belongsToMany(Prices, { through: CategoryPrices, foreignKey: 'categoryId' });
Prices.belongsToMany(Categories, { through: CategoryPrices, foreignKey: 'priceId' });
Categories.hasMany(Room, { foreignKey: 'categoryId', onDelete: 'CASCADE' });
Room.belongsTo(Categories);
Categories.hasMany(RoomImage, { foreignKey: 'roomId', onDelete: 'CASCADE' });

module.exports = Categories;

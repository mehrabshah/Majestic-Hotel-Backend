const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const RoomImage = require('./roomImage');
const Room = require('./room');

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

Categories.hasMany(Room, { foreignKey: 'categoryId', onDelete: 'CASCADE' });
Room.belongsTo(Categories);
Categories.hasMany(RoomImage, { foreignKey: 'roomId', onDelete: 'CASCADE' });

module.exports = Categories;

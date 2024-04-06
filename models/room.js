const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const RoomImage = require('./roomImage');

const Room = sequelize.define('Room', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  image: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  price: {
    type: DataTypes.FLOAT, 
    allowNull: false,
  },
  brand: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  transmission: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  fuel: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  doors: {
    type: DataTypes.STRING, 
    allowNull: false,
  },
}, {
  tableName: 'room',
});

Room.hasMany(RoomImage, { foreignKey: 'roomId', onDelete: 'CASCADE' });

module.exports = Room;

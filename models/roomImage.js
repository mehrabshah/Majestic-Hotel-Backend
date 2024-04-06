// models/RoomImage.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');

const RoomImage = sequelize.define('RoomImage', {
  roomId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  filename: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  tableName: 'roomImages', 
});

module.exports = RoomImage;

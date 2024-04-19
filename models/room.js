const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const RoomImage = require('./roomImage');
const Categories = require('./categories');
const Booking = require('./booking');

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
  description: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  categoryId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  }
}, {
  tableName: 'room',
});

Room.hasMany(RoomImage, { foreignKey: 'roomId', onDelete: 'CASCADE' });
Room.hasMany(Booking, { foreignKey: 'roomId' });
Booking.belongsTo(Room, {
  foreignKey: 'roomId',
  onDelete: 'CASCADE',
});
module.exports = Room;

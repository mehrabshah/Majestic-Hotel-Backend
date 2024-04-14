const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const Room = require('./room'); 

const Booking = sequelize.define('Booking', {
  firstName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lastName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  age: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  status:{
    type: DataTypes.STRING,
  },
  phoneNumber: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  address: {
    type: DataTypes.STRING,
  },
  zipCode: {
    type: DataTypes.STRING,
  },
  city: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  roomId: {
    type: DataTypes.INTEGER, 
    allowNull: false,
    references: {
      model: Room,
      key: 'id',
    },
  },
  startDate: {
    type: DataTypes.DATE,
  },
  endDate: {
    type: DataTypes.DATE,
  },
}, {
  tableName: 'booking',
});

Booking.belongsTo(Room, { foreignKey: 'roomId' });

module.exports = Booking;

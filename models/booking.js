const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const Room = require('./room');

const Booking = sequelize.define('Booking', {
  roomId: {
    type: DataTypes.INTEGER, 
    allowNull: false,
  },
  startDate: {
    type: DataTypes.DATE,
  },
  endDate: {
    type: DataTypes.DATE,
  },
  orderId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  tableName: 'booking',
});

Booking.associate = (models) => {
  Booking.belongsTo(models.Order, {
    foreignKey: 'orderId',
    onDelete: 'CASCADE',
  });
};


module.exports = Booking;

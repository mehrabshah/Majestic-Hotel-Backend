const { DataTypes } = require('sequelize');
const sequelize = require('../config/dbconnection');
const Booking = require('./booking');

const Order = sequelize.define('Order', {
  firstName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lastName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  emailAddress: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  address: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  city: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  postalCode: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  countryRegionCode: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phoneNumber: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  tableName: 'orders',
});
    Order.hasMany(Booking, {
      foreignKey: 'orderId', // This should match the foreign key defined in the Booking model
      onDelete: 'CASCADE',
    });
module.exports = Order;

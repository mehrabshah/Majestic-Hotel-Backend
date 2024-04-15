const { Op, Sequelize } = require('sequelize');
const Booking = require('../models/booking');
const Room  = require('../models/room');
const Categories = require('../models/categories');

const createBooking = async (req, res) => {
  const { categoryId, startDate, endDate, numberOfRooms, firstName, lastName, age, status, phoneNumber, email, address, zipCode, city } = req.body;

  try {
    const rooms = await Room.findAll({ where: { categoryId } });
    const availableRooms = await Promise.all(rooms.map(async (room) => {
      const overlappingBooking = await Booking.findOne({
        where: {
          roomId: room.id,
          startDate: { [Op.lt]: endDate },
          endDate: { [Op.gt]: startDate }
        }
      });
      return overlappingBooking ? null : room;
    }));

    // Remove null entries (rooms with overlapping bookings)
    const filteredAvailableRooms = availableRooms.filter(room => room !== null);

    // Check if enough available rooms are found
    if (filteredAvailableRooms.length < numberOfRooms) {
      return res.status(400).json({ error: 'Not enough available rooms for the specified dates' });
    }

    // Create bookings for the available rooms
    const bookings = await Promise.all(filteredAvailableRooms.slice(0, numberOfRooms).map(async (room) => {
      const newBooking = await Booking.create({
        firstName,
        lastName,
        age,
        status,
        phoneNumber,
        email,
        address,
        zipCode,
        city,
        roomId: room.id,
        startDate,
        endDate,
      });
      return newBooking;
    }));

    res.status(201).json(bookings);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error creating booking' });
  }
};


const getAllBookings = async (req, res) => {
  try {
    const bookings = await Booking.findAll();
    res.status(200).json(bookings);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving bookings' });
  }
};


const getBookingById = async (req, res) => {
  const { id } = req.params;
  try {
    const booking = await Booking.findByPk(id);
    if (!booking) {
      res.status(404).json({ error: 'Booking not found' });
    } else {
      res.status(200).json(booking);
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving booking' });
  }
};


const deleteBookingById = async (req, res) => {
  const { id } = req.params;
  try {
    const booking = await Booking.findByPk(id);
    if (!booking) {
      res.status(404).json({ error: 'Booking not found' });
    } else {
      await booking.destroy();
      res.status(204).json();
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error deleting booking' });
  }
};
const markBookingDone = async (req, res) => {
  const { id } = req.params;
  try {
    const booking = await Booking.findByPk(id);
    if (!booking) {
      res.status(404).json({ error: 'Booking not found' });
    } else {
      await booking.update({ status: 'DONE' });
      res.status(204).json();
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error updating booking status' });
  }
};
const getAvailableRooms = async (req, res) => {
  const { startDate, endDate } = req.body;

  try {
    // Find all rooms that do not have overlapping bookings for the specified dates
    const availableRooms = await Room.findAll({
      include: [{
        model: Booking,
        required: false,
        where: {
          startDate: { [Op.lt]: endDate },
          endDate: { [Op.gt]: startDate }
        }
      }],
    });
    const filteredAvailableRooms = availableRooms.filter(room => room.Bookings.length === 0);
    const availableRoomsByCategory = filteredAvailableRooms.reduce((acc, room) => {
      if (!acc[room.categoryId]) {
        acc[room.categoryId] = 0;
      }
      acc[room.categoryId]++;
      return acc;
    }, {});

    // Fetch all categories from the database
    const categories = await Categories.findAll();

    // Update each category with the count of available rooms
    const categoriesWithAvailableRooms = categories.map(category => {
      return {
       ...category.dataValues,
        // Calculate the number of available rooms for the category
        availableRooms: availableRoomsByCategory[category.id] || 0
      };
    });

    res.status(200).json(categoriesWithAvailableRooms);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving available rooms' });
  }
};




module.exports = {
  createBooking,
  getAllBookings,
  getBookingById,
  deleteBookingById,
  markBookingDone,
  getAvailableRooms
};

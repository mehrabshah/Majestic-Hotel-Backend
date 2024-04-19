const express = require('express');
const router = express.Router();
const bookingController = require('../controllers/bookingController');


router.post('/createBookings', bookingController.createBooking);
router.post('/createMultipleBookings', bookingController.createMultipleBookings);
router.get('/getAllBookings', bookingController.getAllBookings);
router.get('/getAllBookingsWithDetails', bookingController.getOrdersWithRoomCategories);
router.get('/bookings/:id', bookingController.getBookingById);
router.delete('/bookings/:id', bookingController.deleteBookingById);
router.put('/bookings/:id/mark-done', bookingController.markBookingDone);
router.post('/available-rooms', bookingController.getAvailableRooms);

module.exports = router;

const express = require('express');
const router = express.Router();
const bookingController = require('../controllers/bookingController');


router.post('/createBookings', bookingController.createBooking);
router.get('/getAllBookings', bookingController.getAllBookings);
router.get('/bookings/:id', bookingController.getBookingById);
router.delete('/bookings/:id', bookingController.deleteBookingById);
router.put('/bookings/:id/mark-done', bookingController.markBookingDone);
router.get('/available-rooms', bookingController.getAvailableRooms);

module.exports = router;

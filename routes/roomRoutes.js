const express = require("express");
const router = express.Router();

const roomController = require("../controllers/roomController");

router.post("/createRoom", (req, res) => roomController.createRoom(req, res));
router.post("/createRoomBulk", (req, res) => roomController.createBulkRooms(req, res));
router.post("/updateRoomBulk", (req, res) => roomController.updateBulkRooms(req, res));

router.get("/getAllRooms", roomController.getAllRooms);
router.get("/getRoomsByBrand/:brand", roomController.getRoomByBrand);

router.get("/getRoomsById/:id", roomController.getRoomById);

router.post("/UpdateRoomById/:id", (req, res) => roomController.updateRoomById(req, res));

// router.get("/getAllDetails/:roomId", roomController.getRoomWithImages);
router.post("/deleteRoomById/:id", roomController.deleteRoomById);

module.exports = router;

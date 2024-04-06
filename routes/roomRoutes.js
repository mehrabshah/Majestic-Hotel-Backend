const express = require("express");
const router = express.Router();
// const multer = require('multer');
const fileUpload = require("express-fileupload"); // Import express-fileupload module
router.use(fileUpload()); // Initialize fileUpload middleware

const roomController = require("../controllers/roomController");
router.post("/createRoom", (req, res) => {
  if (!req.files || !req.files.image) {
    return res.status(400).json({ message: "No file uploaded" });
  }

  const image = req.files.image;
  const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
  const filename = uniqueSuffix + "-" + image.name;

  image.mv("./uploads/" + filename, (err) => {
    if (err) {
      return res.status(500).send(err);
    }

    roomController.createRoom(req, res, filename);
  });
});
router.get("/getAllRooms", roomController.getAllRooms);
router.get("/getRoomsByBrand/:brand", roomController.getRoomByBrand);

router.get("/getRoomsById/:id", roomController.getRoomById);

router.post("/UpdateRoomById/:id", (req, res) => {
  if (!req.files || !req.files.image) {
    return res.status(400).json({ message: "No file uploaded" });
  }

  const image = req.files.image;
  const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
  const filename = uniqueSuffix + "-" + image.name;

  image.mv("./uploads/" + filename, (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    roomController.updateRoomById(req, res, filename);
  });
});
router.get("/getAllDetails/:roomId", roomController.getRoomWithImages);
router.post("/deleteRoomById/:id", roomController.deleteRoomById);

module.exports = router;

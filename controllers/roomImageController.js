
const multer = require('multer');
const RoomImage = require('../models/roomImage'); 
const Room = require('../models/room');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/roomImages/');
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + '-' + file.originalname);
  },
});

const upload = multer({ storage: storage });

const uploadRoomImage = async (req, res) => {
  try {
    const { roomId } = req.body;
    console.log(roomId)
    const room = await Room.findByPk(roomId);
    if (!room) {
      res.status(404).json({ error: 'Room not found' });
      return;
    }
    const image = req.file;

    if (!image) {
      return res.status(400).json({ error: 'Image file is required' });
    }

    const roomImage = await RoomImage.create({
      roomId,
      filename: image.filename,
    });

    res.status(201).json(roomImage);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error uploading room image' });
  }
};

module.exports = {
  uploadRoomImage,
};

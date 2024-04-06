const Room = require("../models/room");
const fs = require("fs");
const { promisify } = require("util");
const path = require("path");
const RoomImage = require("../models/roomImage");

const createRoom = async (req, res, filename) => {
  console.log("Hello");
  try {
    const { name, price, brand, transmission, fuel, doors } = req.body;

    const newRoom = await Room.create({
      name,
      image: filename,
      price,
      brand,
      transmission,
      fuel,
      doors,
    });

    return res.status(200).json(newRoom);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Error creating room" });
  }
};

const getAllRooms = async (req, res) => {
  try {
    const { page = 1, limit = 10 } = req.query; // Default to page 1 and 10 rooms per page

    const offset = (page - 1) * limit;

    const rooms = await Room.findAll({
      limit: parseInt(limit, 10),
      offset: offset,
    });
    console.log("RETRIEVED Rooms", rooms);
    const roomsWithImages = await Promise.all(
      rooms.map(async (room) => {
        const imageFilePath = path.join("uploads", room.image);
        const imageBuffer = await fs.promises.readFile(imageFilePath);

        const roomWithImage = {
          ...room.toJSON(),
          image: imageBuffer.toString("base64"),
        };

        return roomWithImage;
      })
    );

    res.status(200).json(roomsWithImages);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error retrieving rooms" });
  }
};

const getRoomById = async (req, res) => {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      res.status(404).json({ error: "Room not found" });
      return;
    }

    const imageFilePath = path.join("uploads", room.image);
    const imageBuffer = await fs.promises.readFile(imageFilePath);

    const roomWithImage = {
      ...room.toJSON(),
      image: imageBuffer.toString("base64"),
    };

    res.status(200).json(roomWithImage);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error retrieving room" });
  }
};

const updateRoomById = async (req, res, filename) => {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      res.status(404).json({ error: "Room not found" });
      return;
    }

    const prevImageFilePath = path.join("uploads", room.image);
    if (fs.existsSync(prevImageFilePath)) {
      fs.unlinkSync(prevImageFilePath);
    }
    if (filename) {
      const newImageFilePath = path.join("uploads", filename);
      room.image = filename;
    }

    await room.save();

    res.status(200).json(room);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error updating room" });
  }
};

const getRoomWithImages = async (req, res) => {
  try {
    const { roomId } = req.params;

    // Find the room by ID
    const room = await Room.findByPk(roomId, {
      include: [RoomImage],
    });

    if (!room) {
      res.status(404).json({ error: "Room not found" });
      return;
    }

    // Extract and load the main room image
    const imageFilePath = path.join("uploads", room.image);
    const imageBuffer = await fs.promises.readFile(imageFilePath);

    // Extract and load additional room images
    const roomImages = await Promise.all(
      room.RoomImages.map(async (image) => {
        const imageFilePath = path.join("uploads/", image.filename);
        const imageBuffer = await fs.promises.readFile(imageFilePath);

        return {
          filename: image.filename,
          buffer: imageBuffer.toString("base64"),
        };
      })
    );

    // Combine the room data with the main image and additional images
    const roomWithImages = {
      ...room.toJSON(),
      image: imageBuffer.toString("base64"),
      additionalImages: roomImages, // Include additional room images
    };

    // Send the room data along with the image buffers in the response
    res.status(200).json(roomWithImages);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error retrieving room and images" });
  }
};

const deleteRoomById = async (req, res) => {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      res.status(404).json({ error: "Room not found" });
      return;
    }

    const imageFilePath = path.join("uploads", room.image);

    if (fs.existsSync(imageFilePath)) {
      fs.unlinkSync(imageFilePath);
    }

    await room.destroy();

    res.status(204).json({ message: "Succesfully deleted a Room" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error deleting room" });
  }
};
const getRoomByBrand = async (req, res) => {
  const { brand } = req.params;

  try {
    console.log("BEFORE QUERY", brand);
    const rooms = await Room.findAll({
      where: { brand },
    });
    console.log("AFTER QUERY", rooms);
    const roomsWithImages = await Promise.all(
      rooms.map(async (room) => {
        const imageFilePath = path.join("uploads", room.image);
        const imageBuffer = await fs.promises.readFile(imageFilePath);

        const roomWithImage = {
          ...room.toJSON(),
          image: imageBuffer.toString("base64"),
        };

        return roomWithImage;
      })
    );

    res.status(200).json(roomsWithImages);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error retrieving rooms by brand" });
  }
};

module.exports = {
  createRoom,
  getAllRooms,
  getRoomById,
  updateRoomById,
  deleteRoomById,
  getRoomWithImages,
  getRoomByBrand,
};

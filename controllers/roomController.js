const Room = require("../models/room");

async function createRoom(req, res) {
  try {
    const { name, image, price, description, categoryId } = req.body;
    const newRoom = await Room.create({
      name,
      image,
      price,
      description,
      categoryId
    });
    res.status(201).json(newRoom);
  } catch (error) {
    console.error('Error creating room:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}
async function createBulkRooms(req,res) {
  const { name, image, price, description, categoryId, numberOfRooms } = req.body;
  const rooms = [];
  for (let i = 0; i < numberOfRooms; i++) {
    const room = {
      name: `${name} ${i+1}`,
      image,
      price,
      description,
      categoryId: categoryId
    };
    rooms.push(room);
  }
  try {
    const createdRooms = await Room.bulkCreate(rooms);
    res.status(201).json(createdRooms);
  } catch (error) {
    console.error('Error creating bulk rooms:', error);
    res.status(500).json({ message: 'Internal server error' });  }
}
async function updateBulkRooms(req,res) {
  const { name} = req.body;
  try {
    const updatedRooms = await Room.update(req.body, {
      where: { name: name }
    });    
    res.status(201).json(updatedRooms);
  } catch (error) {
    console.error('Error creating bulk rooms:', error);
    res.status(500).json({ message: 'Internal server error' });  }
}
async function getAllRooms(req, res) {
  try {
    const rooms = await Room.findAll();
    res.json(rooms);
  } catch (error) {
    console.error('Error getting all rooms:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}

async function getRoomByBrand(req, res) {
  const { brand } = req.params;
  try {
    const rooms = await Room.findAll({
      where: {
        brand: brand
      }
    });
    res.json(rooms);
  } catch (error) {
    console.error('Error getting rooms by brand:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}

async function getRoomById(req, res) {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      return res.status(404).json({ message: 'Room not found' });
    }
    res.json(room);
  } catch (error) {
    console.error('Error getting room by ID:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}

async function updateRoomById(req, res) {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      return res.status(404).json({ message: 'Room not found' });
    }
    const { name, image, price, description, categoryId } = req.body;
    await room.update({
      name,
      image,
      price,
      description,
      categoryId
    });
    res.json(room);
  } catch (error) {
    console.error('Error updating room by ID:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}

async function deleteRoomById(req, res) {
  const { id } = req.params;
  try {
    const room = await Room.findByPk(id);
    if (!room) {
      return res.status(404).json({ message: 'Room not found' });
    }
    await room.destroy();
    res.json({ message: 'Room deleted successfully' });
  } catch (error) {
    console.error('Error deleting room by ID:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
}

module.exports = {
  createRoom,
  getAllRooms,
  getRoomByBrand,
  getRoomById,
  updateRoomById,
  deleteRoomById,
  createBulkRooms,
  updateBulkRooms,
};

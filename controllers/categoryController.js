const Category  = require('../models/categories'); 


const createCategory = async (req, res) => {
  try {
    const { name, image, description, price,capacity } = req.body;
    const newCategory = await Category.create({ name, image, description, price,capacity });
    res.status(201).json(newCategory);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error creating category entry' });
  }
};




const getAllCategory = async (req, res) => {
  try {
    const categoryEntries = await Category.findAll();
    res.status(200).json(categoryEntries);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving category entries' });
  }
};


const getCategoryById = async (req, res) => {
  const { id } = req.params;
  try {
    const categoryEntry = await Category.findByPk(id);
    if (!categoryEntry) {
      res.status(404).json({ error: 'Category entry not found' });
    } else {
      res.status(200).json(categoryEntry);
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving category entry' });
  }
};


const deleteCategoryById = async (req, res) => {
  const { id } = req.params;
  try {
    const categoryEntry = await Category.findByPk(id);
    if (!categoryEntry) {
      res.status(404).json({ error: 'Category entry not found' });
    } else {
      await categoryEntry.destroy();
      res.status(204).json();
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error deleting category entry' });
  }
};

module.exports = {
  createCategory,
  getAllCategory,
  getCategoryById,
  deleteCategoryById,
};

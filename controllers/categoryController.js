const Category  = require('../models/categories'); 
const CategoryPrices  = require('../models/CategoryPrices'); 
const Prices  = require('../models/price'); 


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
const updateCategoryPrices = async (req, res) => {
  try {
    const updates = req.body;
    const updatedCategories = await Promise.all(updates.map(async update => {
      const { id, price } = update;
      const updatedCategory = await Category.update({ price: price }, { where: { id: id } });
      return updatedCategory;
    }));
    res.status(200).json(updatedCategories);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error updating category prices' });
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

const addCategoryPrice = async (req, res) => {
  const { date, price,categoryId } = req.body;

  try {
    // Find the category by ID
    const category = await Category.findByPk(categoryId);

    if (!category) {
      return res.status(404).json({ error: 'Category not found' });
    }

    // Create the price entry
    const [priceEntry, created] = await Prices.findOrCreate({
      where: { date },
      defaults: { price }
    });

    if (!created) {
      priceEntry.price = price;
      await priceEntry.save();
    }

    // Associate the price entry with the category
    await CategoryPrices.findOrCreate({
      where: {
        categoryId: category.id,
        priceId: priceEntry.id
      }
    });

    res.status(201).json({ message: 'Price added successfully', price: priceEntry });
  } catch (error) {
    res.status(500).json({ error: 'An error occurred while adding the price', details: error.message });
  }
};
const getCategoryWithPrices = async (req, res) => {
  const { id } = req.body;
  try {
    const category = await Category.findByPk(id, {
      include: {
        model: Prices,
        through: { attributes: [] }
      }
    });

    if (!category) {
      return res.status(404).json({ error: 'Category not found' });
    }

    res.status(200).json(category);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error retrieving category with prices', details: error.message });
  }
};
module.exports = {
  createCategory,
  getAllCategory,
  getCategoryById,
  deleteCategoryById,
  updateCategoryPrices,
  addCategoryPrice,
  getCategoryWithPrices
};

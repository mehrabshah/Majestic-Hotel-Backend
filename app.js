const express= require('express');
const cors = require('cors');
const dotenv = require('dotenv');

require('dotenv').config()
const app = express();
app.use(express.json())
app.use(cors());
require('./config/dbconnection')


const contactUsRoutes = require('./routes/contactUsRoutes');
app.use('/contactUs', contactUsRoutes);
const bookingRoutes = require('./routes/bookingRoutes');
app.use('/booking', bookingRoutes);
const roomRoutes = require('./routes/roomRoutes');
app.use('/room', roomRoutes);
const roomImagesRoutes = require('./routes/roomImagesRoutes');
app.use('/roomImage', roomImagesRoutes);
const authRoutes = require('./routes/auth');
app.use('/auth', authRoutes);

const cron = require('node-cron');

const port = process.env.SERVER_PORT ;


app.get("/",(res,resp)=>{
    resp.send("Home page");
});
console.log("server running on port ",port)

app.listen(port)
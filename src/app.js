import express from 'express';
import config from './config';
import customersRoutes from './routes/customers.routes';
import cors from 'cors';

const app = express();

// settings
app.set('port', config.port);

// middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

//routes
app.use(customersRoutes);

export default app; 
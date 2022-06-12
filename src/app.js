import express from 'express';
import config from './config';
import customersRoutes from './routes/customers.routes';

const app = express();

// settings
app.set('port', config.port);

// middlewares
app.use(express.json());
app.use(express.urlencoded({extended:false}));

//routes
app.use(customersRoutes);

export default app; 
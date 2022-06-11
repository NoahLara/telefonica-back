import express from 'express';
import config from './config';
import customersRoutes from './routes/customers.routes';

const app = express();

// settings
app.set('port', config.port);

// usage routes

app.use(customersRoutes);

export default app; 
import { Router } from 'express';
import { getCustomers, createCustomer, getCustomer } from '../controllers/customers.controller';

const router = Router();

router.get('/customers', getCustomers); // get All customers
router.post('/customers', createCustomer); // save customer
router.get('/customers/:Id', getCustomer); // get Only 1 customer
router.put('/customers',); // update customer
router.delete('/customers',); // delete customer


export default router;
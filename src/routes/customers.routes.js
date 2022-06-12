import { Router } from 'express';
import { getCustomers, createCustomer, getCustomer, deleteCustomer, updateCustomer } from '../controllers/customers.controller';

const router = Router();

/**
 * Customers
 */
router.get('/customers', getCustomers); // get All customers
router.post('/customers', createCustomer); // save customer
router.get('/customers/:Id', getCustomer); // get Only 1 customer
router.put('/customers/:Id', updateCustomer); // update customer
router.delete('/customers/:Id', deleteCustomer); // delete customer

/**
 * Users
 */




export default router;
import { Router } from 'express';
import { getCustomers, createCustomer, getCustomer, deleteCustomer, updateCustomer } from '../controllers/customers.controller';
import { signInCustomer } from '../controllers/users.controller';
import { verifyToken } from '../middlewares/users.middleware';

const router = Router();

/**
 * Customers
 */
router.get('/customers', verifyToken, getCustomers); // get All customers
router.post('/customers', verifyToken, createCustomer); // save customer
router.get('/customers/:Id', verifyToken, getCustomer); // get Only 1 customer
router.put('/customers/:Id', verifyToken, updateCustomer); // update customer
router.delete('/customers/:Id', verifyToken, deleteCustomer); // delete customer

/**
 * Users
 */

router.post('/signin', signInCustomer);




export default router;
import { request, response } from "express";
import { sql, getConnection } from '../database/connection';


// GET CUSTOMERS
export const getCustomers = async(_req = request, _res = response) => {
    try {

        const query = `SELECT * FROM Customers`;

        const pool = await getConnection();
        const result = await pool.request().query(query);

        _res.json({
            success: true,
            status: 200,
            data: result.recordset
        }).send();


    } catch (_err) {
        _res.status(500).send({
            success: false,
            msg: 'Error getting all customers information',
            error: _err
        });
    };
};

// SAVE CUSTOMER
export const createCustomer = async(_req = request, _res = response) => {

    // Object Destructuring
    const { Complete_Name, Contract_Date, Address_Customer } = _req.body;
    let { Id_Celphone_Plan } = _req.body;

    // Validating
    if (Complete_Name == null || Contract_Date == null || Address_Customer == null) {
        return _res.status(400).json({
            success: false,
            msg: 'Bad Request | Please fill all fields to create a new customer'
        });
    };

    if (Id_Celphone_Plan == null) Id_Celphone_Plan = 4;

    try {

        // Saving data
        const pool = await getConnection();

        await pool.request()
            .input('Complete_Name', sql.VarChar, Complete_Name)
            .input('Contract_Date', sql.DateTime, Contract_Date)
            .input('Address_Customer', sql.VarChar, Address_Customer)
            .input('Id_Celphone_Plan', sql.VarChar, Id_Celphone_Plan)
            .query("INSERT INTO Customers (Complete_Name, Contract_Date, Address_Customer,Id_Celphone_Plan) VALUES (@Complete_Name,@Contract_Date,@Address_Customer,@Id_Celphone_Plan)");


        _res.json({
            success: true,
            statu: 200,
            msg: 'Customer added successfully',
            result: { Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan }
        }).send();

    } catch (_err) {
        _res.status(500).send({
            success: false,
            msg: 'Error saving customer information',
            error: _err
        });
    };
};
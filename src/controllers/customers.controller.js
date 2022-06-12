import { request, response } from "express";
import { sql, getConnection, queries } from '../database';

// GET ALL CUSTOMERS
export const getCustomers = async (_req = request, _res = response) => {
    try {

        const pool = await getConnection();
        const result = await pool.request().query(queries.getAllCustomers);

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
export const createCustomer = async (_req = request, _res = response) => {

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
            .query(queries.saveCostumer);


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

// GET CUSTOMER
export const getCustomer = async (_req = request, _res = response) => {

    try {
        const { Id } = _req.params;

        const pool = await getConnection();
        const result = await pool.request().input('Id_Customer', Id).query(queries.getCustomer);

        const customerInfo = result.recordset[0];

        customerInfo.documents = { // adding documents property
            DUI: '',
            NIT: '',
            AFP: '',
            ISSS: ''
        };

        result.recordset.forEach((item) => { // building documents property

            const { Number, Identity_Name } = item;

            switch (Identity_Name) {
                case 'DUI': customerInfo.documents.DUI = Number; break;
                case 'AFP': customerInfo.documents.AFP = Number; break;
                case 'NIT': customerInfo.documents.NIT = Number; break;
                case 'ISSS': customerInfo.documents.ISSS = Number; break;
            };
        })

        // removing Number and Identity_Name
        delete customerInfo.Number;
        delete customerInfo.Identity_Name;

        // sending information to client
        _res.json({
            success: true,
            statu: 200,
            data: customerInfo
        }).send();

    } catch (_err) {
        _res.status(500).send({
            success: false,
            msg: 'Error getting customer information',
            error: _err
        });
    }

};

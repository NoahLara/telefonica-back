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
        });


    } catch (_err) {
        _res.json({
            success: false,
            msg: 'Error getting all customers information',
            error: _err
        });
    };
};

// SAVE CUSTOMER
export const createCustomer = async (_req = request, _res = response) => {

    // Object Destructuring
    const { Complete_Name, Contract_Date, Address_Customer, Documents } = _req.body;
    let { Id_Celphone_Plan } = _req.body;

    // Validating
    if (Complete_Name == null || Contract_Date == null || Address_Customer == null || Documents == null) {
        return _res.status(400).json({
            success: false,
            msg: 'Bad Request | Please fill all fields to create a new customer'
        });
    };

    if (Id_Celphone_Plan == null) Id_Celphone_Plan = 4;

    try {

        // Saving data
        const pool = await getConnection();

        const resultCustomer = await pool.request()
            .input('Complete_Name', sql.VarChar, Complete_Name)
            .input('Contract_Date', sql.DateTime, Contract_Date)
            .input('Address_Customer', sql.VarChar, Address_Customer)
            .input('Id_Celphone_Plan', sql.VarChar, Id_Celphone_Plan)
            .query(queries.saveCostumer);

        const resultLastCustomer = await pool.request().query(queries.getLastCustomer);

        const lastCustomer = resultLastCustomer.recordset[0].Id_Customer;

        const { DUI, AFP, ISSS, NIT } = Documents;

        if (DUI != '' || DUI != undefined) {
            await pool.request()
                .input('Number', DUI)
                .input('Id_Type', 1)
                .input('Id_Customer', lastCustomer)
                .query(queries.saveDocuments);
        }

        if (AFP != '' || AFP != undefined) {
            await pool.request()
                .input('Number', AFP)
                .input('Id_Type', 2)
                .input('Id_Customer', lastCustomer)
                .query(queries.saveDocuments)
        }

        if (ISSS != '' || ISSS != undefined) {
            await pool.request()
                .input('Number', ISSS)
                .input('Id_Type', 3)
                .input('Id_Customer', lastCustomer)
                .query(queries.saveDocuments)
        }

        if (NIT != '' || NIT != undefined) {
            await pool.request()
                .input('Number', NIT)
                .input('Id_Type', 4)
                .input('Id_Customer', lastCustomer)
                .query(queries.saveDocuments)
        }


        _res.json({
            success: true,
            status: 200,
            msg: 'Customer added successfully',
            result: {
                resultCustomer,
            }
        });

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
        const result = await pool.request().input('Id_Customer', Id).query(queries.getCustomerById);

        const customerInfo = result.recordset[0];

        customerInfo.Documents = { // adding documents property
            DUI: '',
            NIT: '',
            AFP: '',
            ISSS: ''
        };

        result.recordset.forEach((item) => { // building documents property

            const { Number, Identity_Name } = item;

            switch (Identity_Name) {
                case 'DUI': customerInfo.Documents.DUI = Number; break;
                case 'AFP': customerInfo.Documents.AFP = Number; break;
                case 'NIT': customerInfo.Documents.NIT = Number; break;
                case 'ISSS': customerInfo.Documents.ISSS = Number; break;
            };
        })

        // removing Number and Identity_Name
        delete customerInfo.Number;
        delete customerInfo.Identity_Name;

        // sending information to client
        _res.json({
            success: true,
            status: 200,
            data: customerInfo
        });

    } catch (_err) {
        _res.json({
            success: false,
            msg: 'Error getting customer information',
            error: _err
        });
    }

};


// DELETE CUSTOMER
export const deleteCustomer = async (_req = request, _res = response) => {

    const { Id } = _req.params;

    const pool = await getConnection();

    try {
        // Deleting information
        const resultAudit = await pool.request().input('Id_Customer', Id).query(queries.deleteAuditLogCustomer);
        const resultIdentification = await pool.request().input('Id_Customer', Id).query(queries.deleteIdentificationCustomer);
        const resultCustomer = await pool.request().input('Id_Customer', Id).query(queries.deleteCostumer);


        // sending information to client
        _res.json({
            success: true,
            status: 200,
            result: {
                resultAudit,
                resultIdentification,
                resultCustomer
            },
            msg: 'customer has been delete successfully'
        });

    } catch (_err) {
        _res.json({
            success: false,
            msg: 'Error deleting customer information',
            error: _err
        });
    }
};


// UPDATE CUSTOMER
export const updateCustomer = async (_req = request, _res = response) => {

    // Object Destructuring
    const { Id_Customer, Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan, Documents } = _req.body;
    // Validating
    if (Id_Customer == null || Complete_Name == null || Contract_Date == null || Address_Customer == null || Id_Celphone_Plan == null || Documents == null) {
        return _res.status(400).json({
            success: false,
            msg: 'Bad Request | Please fill all fields to update a new customer'
        });
    };

    try {

        // UPDATING DAT
        const pool = await getConnection();

        const resultCustomer = await pool.request()
            .input('Id_Customer', sql.Int, Id_Customer)
            .input('Complete_Name', sql.VarChar, Complete_Name)
            .input('Contract_Date', sql.DateTime, Contract_Date)
            .input('Address_Customer', sql.VarChar, Address_Customer)
            .input('Id_Celphone_Plan', sql.VarChar, Id_Celphone_Plan)
            .query(queries.updateCustomer);

        const { DUI, AFP, ISSS, NIT } = Documents;

        const resultValidate = await pool.request().input('Id_Customer', sql.Int, Id_Customer).query(queries.validateIdentifications);

        const documentsExist = [];

        resultValidate.recordset.forEach((document) => {
            documentsExist.push(document.Id_Type);
        });



        if (DUI != '' || DUI != undefined) {

            if (documentsExist.find(el => el == 1)) {
                await pool.request()
                    .input('Number', DUI)
                    .input('Id_Type', 1)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.updateIdentification);

            } else {
                await pool.request()
                    .input('Number', DUI)
                    .input('Id_Type', 1)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.saveDocuments);
            };
        };

        if (AFP != '' || AFP != undefined) {

            if (documentsExist.find(el => el == 2)) {
                await pool.request()
                    .input('Number', AFP)
                    .input('Id_Type', 2)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.updateIdentification);

            } else {
                await pool.request()
                    .input('Number', AFP)
                    .input('Id_Type', 2)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.saveDocuments);
            };
        };

        if (ISSS != '' || ISSS != undefined) {

            if (documentsExist.find(el => el == 3)) {
                await pool.request()
                    .input('Number', ISSS)
                    .input('Id_Type', 3)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.updateIdentification);

            } else {
                await pool.request()
                    .input('Number', ISSS)
                    .input('Id_Type', 3)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.saveDocuments);
            };
        };

        if (NIT != '' || NIT != undefined) {

            if (documentsExist.find(el => el == 4)) {
                await pool.request()
                    .input('Number', NIT)
                    .input('Id_Type', 4)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.updateIdentification);

            } else {
                await pool.request()
                    .input('Number', NIT)
                    .input('Id_Type', 4)
                    .input('Id_Customer', Id_Customer)
                    .query(queries.saveDocuments);
            };
        };


        _res.json({
            success: true,
            status: 200,
            msg: 'Customer updated successfully',
        });

    } catch (_err) {
        _res.json({
            success: false,
            msg: 'Error updating customer information',
            error: _err
        });
    };


};
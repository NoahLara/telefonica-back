import { request, response } from "express";
import getConnection from '../database/connection';


const getCustomers = (_req = request, _res = response) => {
    try {

        const query = `
        SELECT 
            Complete_Name, Number, Identity_Name, Address_Customer,Contract_Date,Name_Plan, Price
        FROM 
            Identification_Customer AS identityCustomer, 
            Customers AS customers, 
            Identity_Type AS identityType,
            Celphone_Plan AS celphone
        WHERE
            identityCustomer.Id_Customer = customers.Id_Customer AND 
            identityCustomer.Id_Type = identityType.Id_Type AND
            celphone.Celphone_Plan = customers.Id_Celphone_Plan
        `;

        getConnection().then(async (pool) => {
            const result = await pool.request().query(query);
            _res.json({
                success: true,
                status: 200,
                data: result.recordset
            }).send();
        });


    } catch (_err) {
        console.error(_err);
    }
}



export default getCustomers;
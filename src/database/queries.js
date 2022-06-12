

export const queries = {
    getAllCustomers: 'SELECT * FROM Customers',
    saveCostumer: 'INSERT INTO Customers (Complete_Name, Contract_Date, Address_Customer,Id_Celphone_Plan) VALUES (@Complete_Name,@Contract_Date,@Address_Customer,@Id_Celphone_Plan)',
    getCustomer: 'SELECT * FROM GeneralCustomerInfo WHERE Id_Customer = @Id_Customer',
};
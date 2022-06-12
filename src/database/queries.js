

export const queries = {
    getAllCustomers: 'SELECT * FROM Customers',
    saveCostumer: 'INSERT INTO Customers (Complete_Name, Contract_Date, Address_Customer,Id_Celphone_Plan) VALUES (@Complete_Name,@Contract_Date,@Address_Customer,@Id_Celphone_Plan)',
    getCustomerById: 'SELECT * FROM GeneralCustomerInfo WHERE Id_Customer = @Id_Customer',
    deleteAuditLogCustomer:'DELETE FROM Audit_Log WHERE Id_Customer = @Id_Customer', 
    deleteIdentificationCustomer: 'DELETE FROM Identification_Customer WHERE Id_Customer = @Id_Customer',
    deleteCostumer: 'DELETE FROM Customers WHERE Id_Customer = @Id_Customer'
};



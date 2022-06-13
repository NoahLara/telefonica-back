

export const queries = {
    getAllCustomers: 'SELECT * FROM Customers',
    saveCostumer: 'INSERT INTO Customers (Complete_Name, Contract_Date, Address_Customer,Id_Celphone_Plan) VALUES (@Complete_Name,@Contract_Date,@Address_Customer,@Id_Celphone_Plan)',
    getLastCustomer: 'SELECT TOP(1) Id_Customer FROM Customers ORDER BY Id_Customer DESC',
    saveDocuments: 'INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES (@Number, @Id_Type, @Id_Customer)',
    getCustomerById: 'SELECT * FROM GeneralCustomerInfo WHERE Id_Customer = @Id_Customer',
    deleteAuditLogCustomer:'DELETE FROM Audit_Log WHERE Id_Customer = @Id_Customer', 
    deleteIdentificationCustomer: 'DELETE FROM Identification_Customer WHERE Id_Customer = @Id_Customer',
    deleteCostumer: 'DELETE FROM Customers WHERE Id_Customer = @Id_Customer',
    updateIdentification: 'UPDATE Identification_Customer SET Number = @Number WHERE Id_Type = @Id_Type AND Id_Customer = @Id_Customer',
    updateCustomer: 'UPDATE Customers SET Complete_Name = @Complete_Name, Contract_Date = @Contract_Date, Address_Customer = @Address_Customer, Id_Celphone_Plan = @Id_Celphone_Plan WHERE Id_Customer = @Id_Customer',
    validateIdentifications:'SELECT * FROM Identification_Customer WHERE Id_Customer = @Id_Customer',
    validateUser: 'SELECT * FROM Users WHERE UserName = @UserName AND Pass_Word = @Pass_Word',
};



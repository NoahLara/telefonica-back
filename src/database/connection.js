import sql from 'mssql';

const dbSettings = {
    user: 'Noah99',
    password: 'God0penheaven52022$',
    server: 'localhost',
    database: 'Telefonica',
    options: {
        encrypt: true, // for azure
        trustServerCertificate: true // change to true for local dev / self-signed certification
    }
};

const getConnection = async () => { // connecting database
    try {
        return await sql.connect(dbSettings);
    } catch (_err) {
        console.error('❌ Bro! There was an error connecting database: ',_err);
    }
}

export default getConnection;
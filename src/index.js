import app from './app';
import './database/connection';


app.listen(app.get('port')); // initializing serve on port based on .env

console.log('✔.:Server listening on port',app.get('port'),':.');
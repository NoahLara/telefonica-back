import { config } from 'dotenv';

config(); // reading enviroment variables

export default {
    port: process.env.PORT || 3080, // validating PORT enviroment variable otherwise 3080
};


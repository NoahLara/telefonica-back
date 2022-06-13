# telefonica-back
Backend created in Nodejs + Express + SQLSERVER.


Requirements:
- nodeJS v16.13.1
- npm 8.3.0
- SQL SERVER +2019 


Setting Up:

✔ Base de Datos:
- La base de datos esta creada en SQLSERVER en el root del proyecto encontraran el Telefonica.bak para restaurar la base de datos asi como
tambien el script, y el diagrama de la base de datos.
- Se debe de crear un usuario para usar SQL AUTHENTICATION y no con WINDOWS CREDENTIALS de lo contrario NodeJs no podra conectarse
- Para que SQL SERVER se pueda conectar con NodeJS es necesario habilitar el TCP/IP del SQL SERVER NewtWork Configuration, para poder acceder aquí
se puede escribir en la barrar de busqueda de windows 'SQL Server 2019(o version que usas) Configuration Manager' y luego reiniciar los servicios de SQL SERVER.

![image](https://user-images.githubusercontent.com/23508529/173453073-68a720ba-9a8c-418a-b4c9-d42adbbd5d39.png)


✔ NodeJS:
- Para poder instalar el proyecto se clona y luego se ejecuta 'npm install' para instalar todas las dependencias y librerias que se has utilizado.
- Luego 'npm run dev' con esto levantaremos el proyecto en el puerto 3000 que es por default
- Si se quiere modificar las credenciales de la conexion a la base de datos puedes hacerlo en '/src/database/connection.js' 

![image](https://user-images.githubusercontent.com/23508529/173454251-1c88089e-f199-4d7a-a1d6-9d2c3f795209.png)
- Se debe de agregar el archivo '.env' en el root del proyecto donde se debe de agregar tanto el PORT que guste usar y el JWTKEY esto para Jsonweb Token

![image](https://user-images.githubusercontent.com/23508529/173455230-c70a6fca-9911-4e07-ba24-1e201e7ad995.png)



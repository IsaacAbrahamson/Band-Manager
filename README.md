## Database Application

Visit at:

https://glacial-springs-05206.herokuapp.com/

## Installation

To run the project, you will need to have Node and MySQL installed on your computer.

Restore the MySQL database:
```
sudo mysql
CREATE DATABASE services;
exit

sudo mysql -u <user> -p<password> services < services.sql
```

Install NPM modules:
```
npm install
```

Create a .env file:
```
DB_HOST="127.0.0.1"
DB_PORT="3306"
DB_USER="serviceuser"
DB_PASSWORD="servicepassword"
DB_DATABASE="services"
PORT="3000"
SOCKET="/var/run/mysqld/mysqld.sock"
```

Run the application
```
node server.js
```

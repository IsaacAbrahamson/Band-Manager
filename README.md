## Database Application

Visit at:

https://glacial-springs-05206.herokuapp.com/

## Installation

To run the project, you will need to have Node and MySQL installed on your computer.

Restore the MySQL database:
```
sudo mysql -u <user> -p<password> services < services.sql
```

Install NPM modules:
```
npm install
```

Create a .env file:
```
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="user"
DB_PASSWORD="userpass"
DB_DATABASE="services"
PORT="3000"
```

Run the application
```
node server.js
```

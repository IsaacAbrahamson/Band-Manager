import util from 'util'
import mysql from 'mysql'

// Helper function to simplify database connection with async functions
// https://codeburst.io/node-js-mysql-and-async-await-6fb25b01b628
function connectDB() {
  const db = mysql.createConnection(process.env.JAWSDB_URL)
  return {  
    query(sql, args) {
      return util.promisify(db.query).call(db, sql, args)
    },
    close() {
      return util.promisify(db.end).call(db)
    }
  }
}

// This function takes a timstamp and returns the date and time
function parseDate(timestamp) {
  let datetime = new Date(Date.parse(timestamp))
  let date = ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '/' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate())) + '/' + datetime.getFullYear()
  let time = datetime.toLocaleTimeString().replace(/:\d+ /, ' ')
  return [date, time]
}

export { parseDate, connectDB }
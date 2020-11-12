import mysql from 'mysql'
import express from 'express'
const router = express.Router()

// Render Index Page
router.get('/', (req, res, next) => {
  // Create database connection
  const connection = mysql.createConnection(process.env.JAWSDB_URL)
  connection.connect()

  connection.query(
    'SELECT * FROM service',
    (error, results, fields) => {
      // Handle errors
      if (error) throw error

      // Render results
      let output = handleResults(results)
      res.render('index', {
        title: 'Demo App',
        message: 'Demo App:',
        output
      })
    }
  )
  connection.end()
})

function handleResults(results) {
  let output = []
  for (let result of results) {   
    let date = parseDate(result.Svc_DateTime)    
    output.push({
      date: date[0],
      time: date[1],
      theme: result.Theme_Event,
      id: result.Service_ID
    })
  }
  return output
}

function parseDate(timestamp) {
  let datetime = new Date(Date.parse(timestamp))
  let date = ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '/' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate())) + '/' + datetime.getFullYear()
  let time = datetime.toLocaleTimeString().replace(/:\d+ /, ' ')
  return [date, time]
}

export default router

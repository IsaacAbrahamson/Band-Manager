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
      console.log(output)
      res.render('index', {
        title: 'Demo App',
        message: 'Demo App:',
        database: output
      })
    }
  )
  connection.end()
})

function handleResults(results) {
  let output = []
  for (let result of results) {   
    // Parse date
    let datetime = new Date(Date.parse(result.Svc_DateTime))
    let date = ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '/' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate())) + '/' + datetime.getFullYear()
    let time = datetime.toLocaleTimeString().replace(/:\d+ /, ' ')
    
    output.push({
      date: date,
      time: time,
      theme: result.Theme_Event
    })
  }
  return output
}

function extractTime(date) {
  
}

export default router

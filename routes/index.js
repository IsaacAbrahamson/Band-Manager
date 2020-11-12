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
    output.push({
      id: result.Service_ID,
      time: result.Svc_DateTime,
      theme: result.Theme_Event
    })
  }
  return output
}

function extractTime(date) {
  
}

export default router

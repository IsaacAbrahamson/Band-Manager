const express = require('express')
const router = express.Router()
const mysql = require('mysql')

// Render Index Page
router.get('/', (req, res, next) => {
  // Create database connection
  const connection = mysql.createConnection(process.env.CLEARDB_DATABASE_URL)
  connection.connect()

  connection.query(
    'SELECT * FROM orders',
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
      orderid: result.orderid,
      name: result.name,
      desc: result.desc
    })
  }
  return output
}

module.exports = router

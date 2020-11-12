import mysql from 'mysql'
import { parseDate } from '../utils.js'
import express from 'express'
const router = express.Router()

router.get('/', (req, res, next) => {
  const connection = mysql.createConnection(process.env.JAWSDB_URL)
  connection.connect()
  connection.query('SELECT * FROM service', (error, results) => {
    if (error) throw error
    let output = handleResults(results)
    res.render('index', {
      title: 'Service Manager',
      message: 'Service Manager',
      output
    })
  })
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

export default router

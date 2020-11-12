import mysql from 'mysql'
import { parseDate } from '../utils.js'
import express from 'express'
const router = express.Router()

// Render No service specified Page
router.get('/', (req, res) => {
  res.send('no service specified')
})

// Render Service Detail Page
router.get('/:id', (req, res) => {
  const id = req.params.id
  const connection = mysql.createConnection(process.env.JAWSDB_URL)
  connection.connect()
  connection.query('SELECT * FROM service_view WHERE service_ID = ?', [id], (error, results, fields) => {
    if (error) throw error
    let output = handleResults(results)
    console.log(output)
    res.render('service', { id, output })
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
      event: result.Event,
      songLeader: result.songLeader,
      songLeader: result.songLeader,
      pianist: result.Pianist,
      organist: result.Organist,
    })
  }
  return output
}

export default router

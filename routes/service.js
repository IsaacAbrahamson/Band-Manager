import mysql from 'mysql'
import express from 'express'
const router = express.Router()

// Render Service Page
router.get('/', (req, res) => {
  res.send('no service specified')
})

router.get('/:id', (req, res) => {
  const id = req.params.id

  // Create database connection
  const connection = mysql.createConnection(process.env.JAWSDB_URL)
  connection.connect()

  connection.query(
    'SELECT * FROM service_view WHERE service_ID = ?', [id],
    (error, results, fields) => {
      // Handle errors
      if (error) throw error

      // Render results
      let output = handleResults(results)
      console.log(output)
      res.render('service', { id, output })
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
      event: result.Event,
      songLeader: result.songLeader,
      songLeader: result.songLeader,
      pianist: result.Pianist,
      organist: result.Organist,
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

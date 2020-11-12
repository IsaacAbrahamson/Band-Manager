import mysql from 'mysql'
import { parseDate, connectDB } from '../utils.js'
import express from 'express'
const router = express.Router()

router.get('/:id', async (req, res) => {
  const id = req.params.id
  const db = connectDB()
  try {
    const results = await db.query('SELECT * FROM service_view WHERE service_ID = ?', [id])
    let output = handleResults(results)
    res.render('service', { id, output })
  } catch (error) {
    throw error
  } finally {
    await db.close()
  }
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

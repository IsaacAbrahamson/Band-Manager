import 'dotenv/config'
import mysql from 'mysql2/promise'
import { parseDate } from '../utils.js'
import express from 'express'
const router = express.Router()

router.get('/', async (req, res) => {
  const db = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    socketPath: process.env.SOCKET
  })

  try {
    const results = await db.query('SELECT * FROM service')
    let output = handleResults(results[0])
    res.render('index', { output })
  } catch (error) {
    throw error
  } finally {
    await db.end()
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
      id: result.Service_ID
    })
  }
  return output
}

export default router

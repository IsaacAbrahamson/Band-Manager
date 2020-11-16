import { parseDate, connectDB } from '../utils.js'
import express from 'express'
const router = express.Router()

router.get('/', async (req, res) => {
  const db = connectDB()
  try {
    const results = await db.query('SELECT * FROM service')
    let output = handleResults(results)
    res.render('index', { output })
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
      id: result.Service_ID
    })
  }
  return output
}

export default router

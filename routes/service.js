import mysql from 'mysql'
import { parseDate, formatTime, connectDB } from '../utils.js'
import express from 'express'
const router = express.Router()

router.get('/:id', async (req, res) => {
  const id = req.params.id
  const db = connectDB()
  try {
    // Retreive service items
    const services = await db.query('SELECT * FROM service_view WHERE service_ID = ?', [id])
    let serviceOutput = handleServiceResults(services)
    let time = formatTime(services[0].Svc_DateTime)
    let theme = serviceOutput[0].theme

    // Retrieve list of songleaders for create form
    const songleaders = await db.query('SELECT * FROM songleader_list')
    let slOutput = handleSongleaderResults(songleaders)

    res.render('service', { id, serviceOutput, slOutput, theme, time })
  } catch (error) {
    throw error
  } finally {
    await db.close()
  }
})

router.post('/new', async (req, res) => {
  const time = req.body.time
  const template = req.body.template
  const db = connectDB()

  // Convert empty string variables to null
  let theme = req.body.theme != '' ? req.body.theme : null
  let songleader = req.body.songleader != '' ? req.body.songleader : null
  
  try {
    const update = await db.query('CALL create_service(?, ?, ?, ?, @output)', [time, theme, songleader, template])
    console.log(update[0][0].status)
    res.render('status', {status: update[0][0].status})
  } catch (error) {
    throw error
  } finally {
    await db.close()
  }
})

function handleServiceResults(results) {
  let output = []
  for (let serviceItem of results) {
    let date = parseDate(serviceItem.Svc_DateTime)   
    output.push({
      date: date[0],
      time: date[1],
      theme: serviceItem.Theme_Event,
      event: serviceItem.Event,
      songLeader: serviceItem.songLeader,
      songLeader: serviceItem.songLeader,
      pianist: serviceItem.Pianist,
      organist: serviceItem.Organist,
    })
  }
  console.log(output)
  return output
}

function handleSongleaderResults(results) {
  let output = []
  output.push(null)
  for (let leader of results) {
    let name = leader.name
    let id = leader.Person_ID
    output.push({name, id})
  }
  return output
}

export default router

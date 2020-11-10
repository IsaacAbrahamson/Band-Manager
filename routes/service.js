const express = require('express')
const router = express.Router()

// Render Service Page
router.get('/', (req, res) => {
  res.send('no service specified')
})

router.get('/:id', (req, res) => {
  const id = req.params.id
  res.render('service', {
    message: 'Additional details for service: ' + id
  })
})

module.exports = router

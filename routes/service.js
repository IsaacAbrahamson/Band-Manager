const express = require('express')
const router = express.Router()

// Render Service Page
router.get('/', (req, res, next) => {
  res.send('no service specified')
})

router.get('/:id', (req, res, next) => {
  res.send(req.params.id)
})

module.exports = router

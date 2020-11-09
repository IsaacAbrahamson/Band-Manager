// Load ENV variables
require('dotenv').config()

// Load HTTP dependencies
const createError = require('http-errors')
const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')

// Load route files
const indexRouter = require('./routes/index')

// Initialize Express App
const app = express()

// Setup views
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'pug')

// Setup Express middleware
app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))

// Setup routing
app.use('/', indexRouter)

// Catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404))
})

// Error handler
app.use((err, req, res, next) => {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(err.status || 500)
  res.render('error')
})

module.exports = app

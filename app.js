// Load ENV variables
import 'dotenv/config'

// Load HTTP dependencies
import createError from 'http-errors'
import express from 'express'
import path from 'path'
import cookieParser from 'cookie-parser'
import logger from 'morgan'
import bodyParser from 'body-parser'

// Load route files
import indexRouter from './routes/index.js'
import serviceRouter from './routes/service.js'

// Get current directory
import { dirname } from 'path'
import { fileURLToPath } from 'url'
const __dirname = dirname(fileURLToPath(import.meta.url))

// Initialize Express App
const app = express()

// Setup views
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'pug')

// Setup Express middleware
app.use(logger('dev'))
app.use(express.json())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))

// Setup routing
app.use('/', indexRouter)
app.use('/service', serviceRouter)

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
  res.render('error', { err })
})

export default app

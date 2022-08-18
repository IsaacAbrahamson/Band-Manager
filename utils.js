import 'dotenv/config'

// This function takes a timestamp and returns the date and time
function parseDate(timestamp) {
  let datetime = new Date(Date.parse(timestamp))
  let date = ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '/' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate())) + '/' + datetime.getFullYear()
  let time = datetime.toLocaleTimeString().replace(/:\d+ /, ' ')
  return [date, time]
}

// This function returns the time in the correct entry format
function formatTime(timestamp) {
  let datetime = new Date(Date.parse(timestamp))
  let date = datetime.getFullYear() + '-' + ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '-' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate()))
  let time = `${datetime.getHours()}:${datetime.getMinutes()}`
  return date + ' ' + time
}

export { parseDate, formatTime }
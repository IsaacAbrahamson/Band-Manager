// This function takes a timstamp and returns the date and time
function parseDate(timestamp) {
  let datetime = new Date(Date.parse(timestamp))
  let date = ((datetime.getMonth() > 8) ? (datetime.getMonth() + 1) : ('0' + (datetime.getMonth() + 1))) + '/' + ((datetime.getDate() > 9) ? datetime.getDate() : ('0' + datetime.getDate())) + '/' + datetime.getFullYear()
  let time = datetime.toLocaleTimeString().replace(/:\d+ /, ' ')
  return [date, time]
}

export { parseDate }
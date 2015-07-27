# Description:
#   Report timestamps in timezones that are relevant to our team.
#
# Commands:
#   hubot timezones <hh:mm am/pm> <TZ> - Report a timestamp in many timezones.
#
# Author:
#   smashwilson

moment = require("moment-timezone")

FORMATS = [
  "h:mm a",
  ""
]

module.exports = (robot) ->

  robot.respond /timezones\s+(.+)/i, (res) ->

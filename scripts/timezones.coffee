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
  "h:mma"
  "ha"
]

TIMEZONES = [
  "America/Los_Angeles"
  "America/Chicago"
  "America/New_York"
  "Europe/Berlin"
]

SHORTHAND =
  PDT: "America/Los_Angeles"
  PST: "America/Los_Angeles"
  CDT: "America/Chicago"
  CST: "America/Chicago"
  EST: "America/New_York"
  EDT: "America/New_York"
  CET: "Europe/Berlin"
  CEST: "Europe/Berin"

OUTPUT = "h:mma z"

module.exports = (robot) ->

  robot.respond /timezones\s+(\S+) +(\S+)/i, (res) ->
    [timeExpr, tzName] = [res.match[1], res.match[2]]

    tzName = SHORTHAND[tzName] if SHORTHAND[tzName]

    timestamp = moment.tz(timeExpr, FORMATS, tzName)

    unless timestamp.isValid()
      now = moment()
      examples = [now.format(fmt) for fmt in FORMATS]

      res.reply "Sorry, I don't understand that time! Valid formats look like: #{examples.join("; ")}"
      return

    converted = (timestamp.tz(target).format(OUTPUT) for target in TIMEZONES)

    res.reply(converted.join(" | "))

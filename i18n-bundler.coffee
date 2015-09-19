if process.env.NODE_ENV is 'development'

  fs = Npm.require "fs"
  staticRoot = process.env.PWD + "/public"
  assetsPath = staticRoot + "/i18n"
  i18nPath = assetsPath + "/tap-i18n.json"

  Meteor.startup ->

    # read the current
    if fs.existsSync i18nPath
      currenti18n = fs.readFileSync i18nPath

    # read the new
    newi18n = JSON.stringify TAPi18n.translations

    # overwrite if different
    if newi18n isnt currenti18n
      # create directories if they don't exist
      unless fs.existsSync staticRoot
        fs.mkdirSync staticRoot
      unless fs.existsSync assetsPath
        fs.mkdirSync assetsPath
      # write the json
      fs.writeFileSync i18nPath, newi18n

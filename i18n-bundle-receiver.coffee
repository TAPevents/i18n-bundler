i18nPath = 'i18n/tap-i18n.json'

Meteor.startup ->
  # set absolute JSON path for offline apps
  if TAPi18n.conf.cdn_path.indexOf('/') is -1
    if !Meteor.isCordova
      path = window.location.pathname
      TAPi18n.conf.cdn_path = path.substring(0, path.lastIndexOf('/')) + "/" + TAPi18n.conf.cdn_path

  if TAPi18n.precacheBundle
    $.ajax
      type: 'GET',
      url: i18nPath
      dataType: 'json',
      success: (data) ->
        for language, translations of data
          TAPi18n._loadLangFileObject language, translations
          unless language in TAPi18n._loaded_languages
            TAPi18n._loaded_languages.push language

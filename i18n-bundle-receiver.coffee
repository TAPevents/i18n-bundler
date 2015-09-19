i18nPath = 'i18n/tap-i18n.json'

$.ajax
  type: 'GET',
  url: i18nPath
  dataType: 'json',
  success: (data) ->
    for language, translations of data
      TAPi18n._loadLangFileObject language, translations
      unless language in TAPi18n._loaded_languages
        TAPi18n._loaded_languages.push language

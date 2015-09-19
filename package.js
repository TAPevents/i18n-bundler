Package.describe({
  name: "tap:i18n-bundler",
  summary: "Bundles your project's tap-i18n files and pre-loads them on the client automatically",
  version: '0.1.0'
});

Package.on_use(function(api) {
  api.versionsFrom('1.1.0.3');

  api.use([
    'coffeescript',
    'jquery',
    'tap:i18n'
  ], ['client', 'server']);

  api.add_files("i18n-bundler.coffee", "server");
  api.add_files("i18n-bundle-receiver.coffee", "client");

});
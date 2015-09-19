# TAPi18n Bundler

The purpose of this package is to allow for client-only deploys of Meteor apps that use [tap-i18n](http://github.com/tapevents/tap-i18n).

It will automatically create a `/public/i18n/tap-i18n.json` file, which is made availalbe to clients by Meteor. Clients will automatically request this file and load the i18n data it contains into tap-i18n.

Using the `/public` folder means it should work in Cordova and other 'client-only' deployment environmnents.

This package will simply generate the JSON file whenever the result of `TAPi18n.translations` changes on the server. As such, It's designed to work only in development mode, and will automatically re-createa a new JSON file each time your i18n files change - so you should edit your the original files, not the generated one!

### Why?

Until tap-i18n supports native bundling (which will require a breaking change), this is a way of solving https://github.com/TAPevents/tap-i18n/issues/93 etc.

Whilst this solution might not be the most elegent, it seems to be the only one that works in all cases without requiring all packages to be re-released with an updated verion of tap-i18n.

Other failed approaches were:

* Fastender
  * Doesn't work because it injects request responses; most client build processes use a static index.html so we don't get a chance to inject after bundling
* Modifying the TAP-i18n build process
  * This didn't work because 3rd party packages are built and shipped with whatever config the package author gives, so they'd have to rebuild a version for each conceivable combination of `supported_languages`

---

MIT License, Chris Hitchcott, 2015
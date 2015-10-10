Package.describe({
  name: "schnauze:app",
  summary: "Schnauze app package",
  version: "0.0.1",
  git: ""
});

Package.onUse(function(api) {

  api.versionsFrom("METEOR@1.0");

  var packages = [
    'schnauze:lib',
    'schnauze:styles',
    'schnauze:recorder',
    'schnauze:geo',
    'schnauze:map'
  ];

  api.use(packages);

  api.imply(packages);

  api.addFiles([
    'both/collections/audioSnippets.coffee',
  ], ['client', 'server']);

  api.addFiles([
    'client/app.html',
    'client/audioSnippets.coffee'
  ], ['client']);


  api.addFiles([
    'server/security.coffee'
  ], ['server']);

});
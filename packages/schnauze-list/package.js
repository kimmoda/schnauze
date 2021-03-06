Package.describe({
  name: "schnauze:list",
  summary: "Schnauze list package",
  version: "0.0.1",
  git: ""
});

Package.onUse(function(api) {

  api.versionsFrom("METEOR@1.0");

  var packages = [
    'schnauze:lib',
    'd3js:d3'
  ];

  api.use(packages);

  api.imply(packages);

  api.addFiles([
  ], ['client', 'server']);

  api.addFiles([
    'client/views/listItem/listItem.html',
    'client/views/listItem/listItem.coffee',
    'client/views/list/list.html',
    'client/views/list/list.coffee'
  ], ['client']);


  // api.addFiles([
  // ], ['server']);

});
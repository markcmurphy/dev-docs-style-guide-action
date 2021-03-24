var vfile = require('to-vfile');
var report = require('vfile-reporter');
var retext = require('retext');
var googlestyleguide = require('retext-google-styleguide');

retext()
  .use(googlestyleguide)
  .process(vfile.readSync('example.md'), function (err, file) {
    console.error(report(err || file));
  });
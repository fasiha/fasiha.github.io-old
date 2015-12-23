/*

Installation: install Node.js from https://nodejs.org. Then run

$ npm install

to install dependencies locally (mainly Express and related middleware).

Usage:

$ node server take3.html.pm "POLLEN=TESTING raco pollen render take3.html"

or 

$ node server "*.pm" "POLLEN=TESTING raco pollen render *.html"

(N.B. The "*.pm" must be in quotes, or your shell will expand it!)

Open http://localhost:3000/take3.html

Whenever take3.html.pm is saved, Node will detect it, rerun Pollen, and send a
message to the browser, triggering a refresh.

 */

"use strict";

var FILE_TO_WATCH = process.argv[2] || '';
var COMMAND_TO_RUN = process.argv[3] || '';
var PORT = process.argv[4] || 3000;

var fs = require('fs');
var child_process = require('child_process');
var EventEmitter = require('events');
var express = require('express');
var onFinished = require('on-finished');
var bodyParser = require("body-parser");
var glob = require("glob");

var events = {refreshme : new EventEmitter()};

var app = express();
app.use(bodyParser.text({type : '*/*'}));

app.post("/events/:id", function(req, res) {
  // This was helpful:
  // http://www.html5rocks.com/en/tutorials/eventsource/basics/
  var id = req.params.id;
  if (!(id in events)) {
    events[id] = new EventEmitter();
  }
  events[id].emit('sendMessage', 'sendMessage', req.body || "empty");
  res.status(200).send('Thanks\n');
});

app.get("/events/:id", function(req, res) {
  console.log('Subscription received');
  var id = req.params.id;

  res.writeHead(200, {
    'Content-Type' : 'text/event-stream',
    'Cache-Control' : 'no-cache',
    'Connection' : 'keep-alive'
  });
  res.write("\n");

  // Adapted from
  // http://www.futureinsights.com/home/real-time-the-easy-way-with-eventsource-angularjs-and-nodejs.html
  function sendSse(eventname, data, id) {
    console.log('Event transmitted. Event:', eventname, 'data:', data, 'id:',
                id);
    res.write("event: " + eventname + "\n");
    if (id) {
      res.write("id: " + id + "\n");
    }
    res.write("data: " + JSON.stringify(data) + "\n\n");
  }
  if (!(id in events)) {
    events[id] = new EventEmitter();
  }
  events[id].on('sendMessage', sendSse);

  onFinished(res, function(err, res) {
    events[id].removeListener('sendMessage', sendSse);
  });

});

app.use('/', express.static('.'));

var server = app.listen(PORT, function() {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});

var handleFiles = function() {
  if (FILE_TO_WATCH) {
    glob(FILE_TO_WATCH, function(err, files) {
      files.map(function(file) {
        var watch = fs.watch(file, function(ev, fname) {
          // What should actually be done when transmitting: emit on an event
          // and log to console.
          var transmitMessage = function() {
            events.refreshme.emit('sendMessage', 'sendMessage', ev);
            console.log('File change detected and transmitted:', ev);
          };

          // If we are given a command to run (e.g., re-render the changed
          // file), do so asynchronously and send the message when completed, in
          // the callback.  If no command is needed, transmit the message right
          // away.
          if (COMMAND_TO_RUN) {
            child_process.exec(COMMAND_TO_RUN, function(err, stdout, stderr) {
              console.log('Command run. Output: \n' + stdout);
              if (stderr) {
                console.log('Command resulted in ERROR:', stderr);
              }
              transmitMessage();
            });
          } else {
            transmitMessage();
          }

          // If the file was renamed (vim saving does this, e.g., see
          // https://github.com/nodejs/node-v0.x-archive/issues/3640#issuecomment-6806347),
          // the watch will no longer work. Recreate it.
          if (ev === 'rename') {
            handleFiles();
          }
        });

      });

    });
  }
};
handleFiles();

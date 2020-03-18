const jayson = require('jayson');

// create a server
const server = jayson.server({
  add: function(args, callback) {
    console.log("received: ", args)
    callback(null, args["first"] + args["second"]);
  }
});

console.log("listening ...")
server.http().listen(3000);
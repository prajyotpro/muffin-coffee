var app, cluster, config, cpu, cpus, db, helmet, http, i, len, router, server;

cluster = require('cluster');

http = require('http');

cpus = require('os').cpus();

app = require('express')();

server = require('http').createServer(app);

config = require('../config/');

db = require('../core/database');

helmet = require('helmet');

if (cluster.isMaster) {
  console.log(`Master process is running on ${process.env.NODE_ENV} environment`);
  for (i = 0, len = cpus.length; i < len; i++) {
    cpu = cpus[i];
    cluster.fork();
  }
  cluster.on('exit', function(worker, code, signer) {
    var forked;
    console.log(`Worker ${worker.id} died`);
    forked = cluster.fork();
    return console.log(`Re-spawning worker ${process.pid} `);
  });
} else {
  app.use(helmet());
  router = require('../routes/')(app);
  app.listen(config.server.port, function() {
    return db.Connection.sync().then(function() {
      console.log("... database synced!");
      return console.log(`Worker running ${process.pid}, listening to port ${config.server.port}`);
    }).catch(function(err) {
      throw err;
    });
  });
}

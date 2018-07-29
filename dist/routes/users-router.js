var express, router;

express = require('express');

router = express.Router();

router.get('/', function(req, res) {
  
  // res.writeHead(200)
  res.end("Hello world, we are running CoffeeScript");
});

module.exports = router;

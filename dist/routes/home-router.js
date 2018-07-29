var express, router;

express = require('express');

router = express.Router();

router.get('/', function(req, res) {
  res.send("Welcome home");
});

module.exports = router;

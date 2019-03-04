var Home, express, router;

express = require('express');

router = express.Router();

Home = require('../controllers/home-controller');

router.get('/', function(req, res) {
  return Home.welcome(req, res);
});

module.exports = router;

var Controller, Home, Models, home,
  boundMethodCheck = function(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new Error('Bound instance method accessed before binding'); } };

Controller = require('../core/controller');

Models = require('../models/');

Home = class Home extends Controller {
  constructor() {
    super(...arguments);
    this.welcome = this.welcome.bind(this);
  }

  welcome(req, res) {
    boundMethodCheck(this, Home);
    console.log(Models);
    Models.users.getAll(req, function(error, users) {
      console.log(error);
      return console.log(users);
    });
    return res.send(super.welcome() + " home welcome");
  }

};

home = new Home;

module.exports = home;

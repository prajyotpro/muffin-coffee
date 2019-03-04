var Controller;

Controller = class Controller {
  constructor() {
    this.welcome = this.welcome.bind(this);
  }

  welcome() {
    return "controller welcome";
  }

};

module.exports = Controller;

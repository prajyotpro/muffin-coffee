# Muffin Coffee (Under development)
Slim flexible MVC framework build over express.js and coffeescript. For coffeescript lovers.

Framework (MVC)
  - node.js
  - coffeescript
  - sequelize
  - mongoose
  - gulp

### Folder Structure
  - crons : cron scripts for cron jobs
  - dist : distribution build transpiled from coffeescript
  - src : source code written in coffeescript
    - config : all configurations
    - controllers : all controllers
    - core : core modules of architecture
    - lib : custom libraries
    - middlewares : all custom middlewares
    - migrations : all migration scripts
    - models : all models
    - routes : all defined routes
    - test : TDD test cases written in mocha and chai
    - www : main project exec

### Instalation
  - clone git repository
  - npm install
  
### Execution
- production 
  -- npm start OR pm2
- development
-- gulp (please check gulpfile.js for tasks)


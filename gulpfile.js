var gulp 	= require('gulp');
var gutil 	= require('gulp-util');
var nodemon = require('gulp-nodemon');
var watch 	= require('gulp-watch');
var coffee 	= require('gulp-coffee');
// var fs 		= require('fs');
// var path 	= require('path');
// var yaml 	= require('gulp-yaml');

gulp.task('nodeMon', function () {
	gutil.log(gutil.colors.yellow('=> Firing up node server + nodemon ...'));
	nodemon({
		script: './dist/www/index.js',
		ext: 'js',
		env: { 'NODE_ENV': 'local' }
	})
});


gulp.task('coffee', function() {
 
	return watch('./src/**/*.coffee', function () {
		gulp.src('./src/**/*.coffee')
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest('./dist/'))
	});
});


gulp.task('default', ['coffee', 'nodeMon']);

gulp.task('developer', ['coffee', 'nodeMon']);

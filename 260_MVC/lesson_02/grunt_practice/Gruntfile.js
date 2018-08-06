module.exports = function (grunt) {
  grunt.initConfig({
    bower_concat: {
      all: {
        dest: 'public/javascripts/all.js',
        cssDest: 'public/stylesheets/bower.css'
      }
    },
    uglify: {
      my_target: {
        files: {
          'public/javascripts/application.js': ['public/javascripts/all.js']
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-bower-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.registerTask('default', ['bower_concat', 'uglify']);
}

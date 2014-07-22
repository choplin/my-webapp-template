module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    bower:
      install:
        options:
          targetDir: './public/vendor'
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: false

    watch:
      coffee:
        files: ['src/coffee/**/*.coffee']
        tasks: 'coffee'
      stylus:
        files: ['src/stylus/**/*.stylus']
        tasks: 'stylus'
      views:
        files: ['views/**/*']
      app:
        files: ['app.rb']
      options:
        livereload: true

    coffee:
      compile:
        options:
          join: true
        files:
          'public/js/app.js': 'src/coffee/*.coffee'

    stylus:
      compile:
        files:
          'public/css/app.css': 'src/stylus/*.stylus'

    shell:
      bundleInstall:
        command: "bundle install --path=vendor/bundle"

  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask "install", ["bower:install", "shell:bundleInstall"]
  grunt.registerTask 'default', ['watch']
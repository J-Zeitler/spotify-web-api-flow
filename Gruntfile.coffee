module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-exec'
  grunt.loadNpmTasks 'grunt-noflo-manifest'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-rerun'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'

  grunt.initConfig

    nodemon:
      dev:
        script: 'node_modules/.bin/noflo-nodejs'
        options:
          ext: 'coffee'

    noflo_manifest:
      update:
        files: 'package.json': ['graphs/*', 'components/*']

  grunt.registerTask 'default', ['noflo_manifest', 'nodemon']
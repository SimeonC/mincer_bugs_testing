'use strict'

module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-mincer'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	
	grunt.initConfig
		clean:
			issue163: ["issue163"]
			issue164: ["issue164"]
		mince:
			issue163:
				options:
					include: ['bower_components']
					manifestPath: "issue163/manifest.json"
					manifestOptions:
						compress: true
						sourceMaps: true
						embedMappingComments: true
					jsCompressor: "uglify"
				files: [
					src: ["bower_components/**/*.js", "bower_components/**/*.min.js"]
					dest: "issue163/js/"
				]
			issue164:
				options:
					include: ['assets']
					manifestPath: "test2/manifest.json"
					manifestOptions:
						compress: true
						sourceMaps: true
						embedMappingComments: true
					jsCompressor: "uglify"
				files: [
					src: "assets/*.js.coffee"
					dest: "issue164/js/"
				]
	
	#grunt.loadTasks 'tasks'
	
	grunt.registerTask 'test1', ['clean:issue163', 'mince:issue163']
	grunt.registerTask 'test2', ['clean:issue164', 'mince:issue164']
grunt



<entry [Thu 2014:03:06 23:48:34 EST] START Gruntfile.js CONTENTS>

http://gruntjs.com/getting-started

module.exports = function(grunt) {
    console.log("INSIDE Gruntfile.js");

    // set up grunt
};


CREATE package.json FILE:

{
  "name": "biorepository",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "~0.4.2",
    "grunt-contrib-jshint": "~0.6.3",
    "grunt-contrib-nodeunit": "~0.2.0",
    "grunt-contrib-uglify": "~0.2.2"
  }
}

	
</entry>
<entry [Mon 2014:03:03 06:09:35 EST] grunt TASKS - IMPORT JSON DATA, ASYNC AND process.env ENVIRONMENT VARIABLES>

http://gruntjs.com/configuring-tasks

grunt.initConfig({
  pkg: grunt.file.readJSON('package.json'),
  uglify: {
    options: {
      banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
    },
    dist: {
      src: 'src/<%= pkg.name %>.js',
      dest: 'dist/<%= pkg.name %>.min.js'
    }
  }
});


CLI options / environment

Use process.env to access the environment variables.


Why doesn't my asynchronous task complete?
Chances are this is happening because you have forgotten to call the this.async method to tell Grunt that your task is asynchronous. For simplicity's sake, Grunt uses a synchronous coding style, which can be switched to asynchronous by calling this.async() within the task body.

Note that passing false to the done() function tells Grunt that the task has failed.

For example:

grunt.registerTask('asyncme', 'My asynchronous task.', function() {
  var done = this.async();
  doSomethingAsync(done);
});



</entry>
<entry [Mon 2014:03:03 06:04:56 EST] SAMPLE GRUNTFILE>

http://gruntjs.com/sample-gruntfile

Finally we have the watch plugin:

watch: {
  files: ['<%= jshint.files %>'],
  tasks: ['jshint', 'qunit']
}

This can be run on the command line with grunt watch. When it detects any of the files specified have changed (here, I just use the same files I told JSHint to check), it will run the tasks you specify, in the order they appear.

Finally, we have to load in the Grunt plugins we need. These should have all been installed through npm.

grunt.loadNpmTasks('grunt-contrib-uglify');
grunt.loadNpmTasks('grunt-contrib-jshint');
grunt.loadNpmTasks('grunt-contrib-qunit');
grunt.loadNpmTasks('grunt-contrib-watch');
grunt.loadNpmTasks('grunt-contrib-concat');


And finally set up some tasks. Most important is the default task:

// this would be run by typing "grunt test" on the command line
grunt.registerTask('test', ['jshint', 'qunit']);

// the default task can be run just by typing "grunt" on the command line
grunt.registerTask('default', ['jshint', 'qunit', 'concat', 'uglify']);



And here's the finished Gruntfile.js:

module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src: ['src/**/*.js'],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      },
      dist: {
        files: {
          'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
        }
      }
    },
    qunit: {
      files: ['test/**/*.html']
    },
    jshint: {
      files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js'],
      options: {
        // options here to override JSHint defaults
        globals: {
          jQuery: true,
          console: true,
          module: true,
          document: true
        }
      }
    },
    watch: {
      files: ['<%= jshint.files %>'],
      tasks: ['jshint', 'qunit']
    }
  });

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('test', ['jshint', 'qunit']);

  grunt.registerTask('default', ['jshint', 'qunit', 'concat', 'uglify']);

};
	
</entry>
<entry [Mon 2014:03:03 06:00:50 EST] QUNIT TESTING>

https://qunitjs.com/

http://qunitjs.com/intro/
	
</entry>
<entry [Mon 2014:03:03 05:28:30 EST] INSTALLED intern>

https://github.com/theintern/intern/wiki/Running-Intern

https://github.com/theintern/intern/wiki/Using-Intern-with-Grunt

https://github.com/theintern/intern-examples/blob/master/grunt-example/Gruntfile.js

https://github.com/theintern/intern-examples/tree/master/dojo-example

RUN WITH SELENIUM
https://code.google.com/p/selenium/wiki/Grid2


DOWNLOAD WHOLE REPO

cd /tmp/temp
git clone https://github.com/theintern/intern-examples.git
cp -r intern-examples/dojo-examples .

	-rw-r--r--  1 root   root    181 Mar  3 05:36 bower.json
	drwxr-xr-x  2 root   root   4096 Mar  3 05:36 css
	drwxr-xr-x  7 root   root   4096 Mar  3 05:32 .git
	-rw-r--r--  1 root   root    359 Mar  3 05:31 .gitignore
	-rw-r--r--  1 syoung root   1317 Mar  3 05:18 Gruntfile.js
	-rw-r--r--  1 root   root   1140 Mar  3 05:36 index.html
	drwxr-xr-x 10 root   root   4096 Mar  3 05:33 intern-examples
	drwxr-xr-x  4 root   root   4096 Mar  3 05:36 js
	drwxr-xr-x  8 syoung syoung 4096 Mar  3 05:23 node_modules
	-rw-r--r--  1 syoung root    321 Mar  3 05:36 package.json
	drwxr-xr-x  2 root   root   4096 Mar  3 05:36 profiles
	-rw-r--r--  1 root   root    893 Mar  3 05:36 README.md
	drwxr-xr-x  6 root   root   4096 Mar  3 05:36 tests


1. INSTALL AND UPDATE SUBMODULES

cd intern-examples
git submodule update --init --recursive


2. INSTALL node MODULES

cd dojo-example
npm install


3. BROWSE TO CONFIRM

The intern-examples repository should accessible via a local HTTP server.

The application should be accessible via http://somePath/intern-examples/dojo-example after the url is adjusted to match your local web server.


4. RUN LOCAL node TESTS

node node_modules/intern/client.js config=tests/intern


5. RUN BROWSER TESTS

Navigate to

http://somePath/intern-examples/dojo-example/node_modules/intern/client.html?config=tests/intern


6. REMOTE node/BROWSER TESTS

node node_modules/intern/runner.js config=tests/intern


7. CONTENTS OF /tmp/temp/Gruntfile.js

	
	module.exports = function(grunt) {
	
	
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			},
			dist: {
				src: 'src/<%= pkg.name %>.js',
				dest: 'dist/<%= pkg.name %>.min.js'
			}
		},
		mocha: {
			// HTML FILE MUST 
		//		all: ['/aguadev/t/unit/html/plugins/apps/packages/test.html']
		}
		,
		qunit: {
			all: {
				options: {
					urls: [
					  'http://localhost:8000/test/foo.html',
					  'http://localhost:8000/test/bar.html',
					]
				}
			}
		}
		,
		connect: {
			server: {
				options: {
					port: 8000,
					base: '.'
				}
			}
		}
	});
	
	grunt.loadNpmTasks('grunt-mocha');
	grunt.loadNpmTasks('grunt-contrib-qunit');
	
	grunt.registerTask('qunit', function(args) {
		console.log("running qunit");
		console.dir({args:args});
	});
	
	// This plugin provides the "connect" task.
	grunt.loadNpmTasks('grunt-contrib-connect');
	
	// A convenient task alias
	grunt.registerTask('test', ['connect', 'qunit']);
	//grunt.registerTask('test', ['qunit']);
	
	
	//grunt.registerTask('compliment', function() {
	//	grunt.log.writeln('You are so awesome!');
	//});
	
	
	};
	
	
	
	//module.exports = function(grunt) {
	//
	//   console.log("INSIDE Gruntfile.js   grunt: " + grunt);
	//    console.dir({grunt:grunt});
	
	//    // set up grunt
	//};

</entry>
<entry [Sun 2014:03:02 22:29:54 EST] INSTALLED grunt>


http://gruntjs.com/getting-started

EXAMPLE Gruntfile.js

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};


INSTALL grunt QUNIT PLUGIN

npm install grunt-contrib-qunit --save-dev
npm install grunt-contrib-connect --save-dev

	grunt-contrib-connect@0.7.1 node_modules/grunt-contrib-connect
	├── connect-livereload@0.3.2
	├── open@0.0.4
	├── async@0.2.10
	├── portscanner@0.2.2 (async@0.1.15)
	└── connect@2.13.0 (uid2@0.0.3, methods@0.1.0, cookie-signature@1.0.1, pause@0.0.1, fresh@0.2.0, qs@0.6.6, debug@0.7.4, bytes@0.2.1, raw-body@1.1.2, buffer-crc32@0.2.1, batch@0.5.0, cookie@0.1.0, compressible@1.0.0, negotiator@0.3.0, send@0.1.4, multiparty@2.2.0)


INSTALL intern

cd /my/project/root
npm install intern --save-dev

	
</entry>

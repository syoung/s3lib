bootstrap


<entry [Fri 2013:12:27 00:56:50 EST] xsokev RESOURCES>

## Useful resources

http://dojobootstrap.com
+ [Dojo-Bootstrap Website with examples for all the modules]


http://dojotoolkit.org/reference-guide/
+ [Dojo Reference Guide (latest release version)](


http://livedocs.dojotoolkit.org
+ [Dojo Reference Guide (Dojo trunk)](/)


http://twitter.github.com/bootstrap
+ [Twitter Bootstrap]


</entry>
<entry [Fri 2013:12:27 00:56:13 EST] xsokev EXAMPLE>

See examples in tests/test_*.html

### In Brief
<!--
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Dojo-Bootstrap</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="path/to/bootstrap/styles.css">
        </head>
    
        <body>
            <button type="button" id="loading-button" class="btn btn-primary"
                data-dojo-type="bootstrap/Button" data-dojo-props="loadingText: 'Loading...'">Load</button>
        
            <script>
                var dojoConfig = {
                    async: 1,
                    parseOnLoad: true,
                    packages: [
                        { name: "bootstrap", location: "path/to/Dojo-Bootstrap" }
                    ]
                };
            </script>
        
            <script type="text/javascript" src="path/to/dojo/dojo/dojo.js"></script>
    
            <script>
                require(["bootstrap/Button"], function (Button) {

                });
            </script>
        </body>
    </html>

-->


	
</entry>
<entry [Fri 2013:12:27 00:48:37 EST] INSTALLED xsokev/Dojo-Bootstrap TO bootstrap>

1. DOWNLOAD xsokev/Dojo-Bootstrap

cd /mnt/repos/private/syoung
git clone git://github.com/xsokev/Dojo-Bootstrap.git bootstrap


2. POPULATE SUBMODULES

cd /mnt/repos/private/syoung/bootstrap
git submodule init
git submodule update


3. LINK TO HTML DIR

ln -s /mnt/repos/private/syoung/bootstrap /var/www/html/bootstrap


4. BROWSE TO TESTS

http://localhost/bootstrap/tests


</entry>
<entry [Wed 2013:10:30 12:28:03 EST] dbootstrap - DOJO BOOTSTRAP>

https://github.com/thesociable/dbootstrap

1. DOWNLOAD dbootstrap

cd /aguadev/html/dojo
git clone --recursive git://github.com/thesociable/dbootstrap.git



NOTES
-----

http://kevinandre.com/dev/using-twitter-bootstrap-with-dojo/

Using Twitter Bootstrap with Dojo
JULY 30, 2012

I have been using Twitter Bootstrap lately due to its appearance and simplicity in creating basic pages and complex layouts. I wanted the use Dojo to develop a recent project but I felt that Dijit would be too much for my needs so I decided to use Bootstrap again. The problem here is that Bootstrap uses jQuery for its Javascript components and I didn’t want to load Dojo, jQuery and the Bootstrap plugin.


My solution: build an implementation of Twitter Bootstrap using the Dojo Toolkit. Dojo Bootstrap  is a port of the Twitter Bootstrap plugins. It uses 100% Dojo code and has support for AMD.

A reproduction of the Twitter Bootstrap JavaScript page using the Dojo Bootstrap modules can be found here.

Update

I have created a new dedicated website for the Dojo Bootstrap project.

http://dojobootstrap.com/


<!--
To build the project locally you will need the following installed:

Python >= 2.6, <3
Nodejs >= 10.5
Stylus >= 0.31
Java >= 7.0 (aka 1.7.0)
All other requirements are bundled as git submodules so make sure you have initialised them (the default when using --recursive with git clone)

Demo

For a live preview of the theme using Dojo's Theme Tester, see http://thesociable.github.com/dbootstrap/

To build the demo locally:

Navigate to your clone of the repo:

$ cd /path/to/dbootstrap
Build it:

$ python build.py demo
Note

If you like to see what is going on under the hood, run with a lower logging level:

$ python build.py -v debug demo
Fire up a server:

$ cd build/demo
$ python -m SimpleHTTPServer 8000
Take a look:

Point your browser at http://localhost:8000/
Integration

Want to use the theme in your own project? Here's a short guide to integrating it successfully.

Standalone Package

Useful if you just want a quick play of the theme with your project. For a better solution see the integrated build below.

Navigate to your clone of the repo:

$ cd /path/to/dbootstrap
Build just the theme:

$ python build.py theme
Note

If you like to see what is going on under the hood, run with a lower logging level:

$ python build.py -v debug theme
Copy (or link) the resulting package dbootstrap/build/theme/dbootstrap into the appropriate location in your project and ensure you notify Dojo about the location. One way to do this is through the Dojo config:

'packages': [
    ...,
    {
        location: '/path/to/dbootstrap',
        name: 'dbootstrap'
    }
]
Add a require call for dbootstrap. You must require dbootstrap before any Dijit widgets are loaded for the icons to work correctly:

require(['dbootstrap', ...], function(dbootstrap) {
    // Start application.
});
Add dbootstrap as a css class to your <body> element:

<body class='dbootstrap'>
View your project as normal.

Integrated Build

Copy or link the dbootstrap/source/dbootstrap folder into your project (typically so that it is a sibling to your Dojo and Dijit packages). You will also need to link the xstyle and nib packages if you don't already have them.

Note

Only tested with Dojo 1.8+

Add the following to your build profile.js to include dbootstrap as a package and separate build layer:

packages: [
    ...
    'dbootstrap',
    'xstyle'
],

layers: {
    ...
    'dbootstrap/main': {
        include: [
            'dbootstrap/main',
            'xstyle/load-css'
        ],
    }
}
Note

If you have placed your dbootstrap package somewhere that isn't directly accessible as a child directory of your basePath then you must use the fuller package syntax in the packages list:

{
    location: '/path/to/dbootstrap',
    name: 'dbootstrap'
}
In your main application entry point (or index.html) require the dbootstrap package before any Dijit widgets are loaded:

require(['dbootstrap', ...], function(dbootstrap) {
    // Start application.
});
Add dbootstrap as a css class to your <body> element:

<body class='dbootstrap'>
Add to your build process relevant calls to Stylus to compile the CSS files into one dbootstrap.css file:

$ stylus --include path/to/dbootstrap/nib/lib \
         --include path/to/dbootstrap/theme/dbootstrap \
         path/to/dbootstrap/theme/dbootstrap/index.styl

$ mv path/to/dbootstrap/theme/dbootstrap/index.css \
     path/to/dbootstrap/theme/dbootstrap/dbootstrap.css
Note

The CSS build must happen before the Dojo build is performed as the generated css file is required as part of the build. Therefore, the css file is built in the source tree to be copied to the build directory during the Dojo build step.

Build your project and view as normal.

Community

Reporting Issues

Bugs or enhancements can be reported by opening an issue at https://github.com/thesociable/dbootstrap/issues.

When reporting a bug, please try to provide the following information:

Affected browsers and Dojo versions.
A clear list of steps to reproduce the problem.
If the problem cannot be easily reproduced then please include an example reduced test case (for example, as a Gist).
If you would like to propose a fix for a particular issue then you are welcome to fork dbootstrap, create a branch and submit a pull request. Please note that a Dojo CLA is required for any non-trivial modifications.

Copyright and license

Copyright (c) 2012-2013 Martin Pengelly-Phillips

Available under either the terms of the modified BSD license or the Apache License, Version 2.0. As a recipient of dbootstrap, you may choose which license to receive this code under.

The text of the BSD and Apache License, Version 2.0 licenses is available in the LICENSE.txt file.

Font-Awesome

The icons are provided by the excellent Font-Awesome team at http://fortawesome.github.com/Font-Awesome/

Status API Training Shop Blog About


-->

</entry>
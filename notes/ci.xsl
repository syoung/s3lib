ci

CHECK SITES:

DeployIt
LiveRebel


<entry [Sun 2013:12:15 22:09:17 EST] PUPPET JENKINS DEPLOYMENT>

https://github.com/aussielunix/jenkins-appliance/blob/master/manifests/site.pp

	
</entry>
<entry [Sat 2013:09:07 10:33:01 EST] TEST SELENIUM ON SAUCELABS.COM>

https://saucelabs.com/account

1. INSTALL Selenium::Remote::Driver AND Test::More

cpanm install Selenium::Remote::Driver
cpanm install Test::More

2. CREATE TEST SCRIPT

em /home/syoung/misc/annai/ci/selenium/testsauce.pl

    #! /usr/bin/perl
    use strict;
    use warnings;
    use Selenium::Remote::Driver;
    
    my $desc = "This is an example test";
    
    my $host = "stuartpyoung:88e46cd6-4444-4fbe-af44-9d7e74f9ebf4\@ondemand.saucelabs.com";
    
    my $driver = new Selenium::Remote::Driver(
                              'remote_server_addr' => $host,
                              'port' => "80",
                              'browser_name' => "iphone",
                              'version' => "5.0",
                              'platform' => "Mac 10.6",
                              'extra_capabilities' => {'name' => $desc},
                              );
    $driver->get('http://www.google.com');
    print $driver->get_title() . "\n";
    $driver->quit();

    
3. RUN TEST SCRIPT

**** OK ****

root@computer:/home/syoung/misc/annai/ci# ./testsauce.pl 
Google
Driver:
$VAR1 = bless( {
    'remote_conn' => bless( {
                              'remote_server_addr' => 'stuartpyoung:88e46cd6-4444-4fbe-af44-9d7e74f9ebf4@ondemand.saucelabs.com',
                              'debug' => 0,
                              'port' => '80'
                            }, 'Selenium::Remote::RemoteConnection' ),
    'browser_name' => 'iphone',
    'session_id' => '23e2d9e650dd4019b255fd91ecba4879',
    'version' => '5.0',
    'commands' => bless( {
        'setWindowSize' => {
                             'url' => 'session/:sessionId/window/:windowHandle/size',
                             'method' => 'POST'
                           },
        'deleteCookieNamed' => {
                                 'url' => 'session/:sessionId/cookie/:name',
                                 'method' => 'DELETE'
                               },
        'getElementText' => {
                              'url' => 'session/:sessionId/element/:id/text',
                              'method' => 'GET'
                            },
        'getElementTagName' => {
                                 'url' => 'session/:sessionId/element/:id/name',
                                 'method' => 'GET'
                               },
        'refresh' => {
                       'url' => 'session/:sessionId/refresh',
                       'method' => 'POST'
                     },
        'goForward' => {
                         'url' => 'session/:sessionId/forward',
                         'method' => 'POST'
                       },
        'newSession' => {
                          'url' => 'session',
                          'method' => 'POST'
                        },
        'setTimeout' => {
                          'url' => 'session/:sessionId/timeouts',
                          'method' => 'POST'
                        },
        'sendKeysToElement' => {
                                 'url' => 'session/:sessionId/element/:id/value',
                                 'method' => 'POST'
                               },
        'buttonDown' => {
                          'url' => 'session/:sessionId/buttondown',
                          'method' => 'POST'
                        },
        'isElementDisplayed' => {
                                  'url' => 'session/:sessionId/element/:id/displayed',
                                  'method' => 'GET'
                                },
        'elementEquals' => {
                             'url' => 'session/:sessionId/element/:id/equals/:other',
                             'method' => 'GET'
                           },
        'sendKeysToPrompt' => {
                                'url' => 'session/:sessionId/alert_text',
                                'method' => 'POST'
                              },
        'isElementSelected' => {
                                 'url' => 'session/:sessionId/element/:id/selected',
                                 'method' => 'GET'
                               },
        'getCurrentUrl' => {
                             'url' => 'session/:sessionId/url',
                             'method' => 'GET'
                           },
        'setImplicitWaitTimeout' => {
                                      'url' => 'session/:sessionId/timeouts/implicit_wait',
                                      'method' => 'POST'
                                    },
        'sendKeysToActiveElement' => {
                                       'url' => 'session/:sessionId/keys',
                                       'method' => 'POST'
                                     },
        'availableEngines' => {
                                'url' => 'session/:sessionId/ime/available_engines',
                                'method' => 'GET'
                              },
        'clearElement' => {
                            'url' => 'session/:sessionId/element/:id/clear',
                            'method' => 'POST'
                          },
        'getElementLocation' => {
                                  'url' => 'session/:sessionId/element/:id/location',
                                  'method' => 'GET'
                                },
        'getCurrentWindowHandle' => {
                                      'url' => 'session/:sessionId/window_handle',
                                      'method' => 'GET'
                                    },
        'click' => {
                     'url' => 'session/:sessionId/click',
                     'method' => 'POST'
                   },
        'submitElement' => {
                             'url' => 'session/:sessionId/element/:id/submit',
                             'method' => 'POST'
                           },
        'describeElement' => {
                               'url' => 'session/:sessionId/element/:id',
                               'method' => 'GET'
                             },
        'switchToWindow' => {
                              'url' => 'session/:sessionId/window',
                              'method' => 'POST'
                            },
        'deleteAllCookies' => {
                                'url' => 'session/:sessionId/cookie',
                                'method' => 'DELETE'
                              },
        'getElementValueOfCssProperty' => {
                                            'url' => 'session/:sessionId/element/:id/css/:propertyName',
                                            'method' => 'GET'
                                          },
        'getAllCookies' => {
                             'url' => 'session/:sessionId/cookie',
                             'method' => 'GET'
                           },
        'screenshot' => {
                          'url' => 'session/:sessionId/screenshot',
                          'method' => 'GET'
                        },
        'uploadFile' => {
                          'url' => 'session/:sessionId/file',
                          'method' => 'POST'
                        },
        'hoverOverElement' => {
                                'url' => 'session/:sessionId/element/:id/hover',
                                'method' => 'POST'
                              },
        'setAsyncScriptTimeout' => {
                                     'url' => 'session/:sessionId/timeouts/async_script',
                                     'method' => 'POST'
                                   },
        'toggleElement' => {
                             'url' => 'session/:sessionId/element/:id/toggle',
                             'method' => 'POST'
                           },
        'findChildElements' => {
                                 'url' => 'session/:sessionId/element/:id/elements',
                                 'method' => 'POST'
                               },
        'getActiveElement' => {
                                'url' => 'session/:sessionId/element/active',
                                'method' => 'POST'
                              },
        'findElements' => {
                            'url' => 'session/:sessionId/elements',
                            'method' => 'POST'
                          },
        'executeAsyncScript' => {
                                  'url' => 'session/:sessionId/execute_async',
                                  'method' => 'POST'
                                },
        'getElementLocationInView' => {
                                        'url' => 'session/:sessionId/element/:id/location_in_view',
                                        'method' => 'GET'
                                      },
        'addCookie' => {
                         'url' => 'session/:sessionId/cookie',
                         'method' => 'POST'
                       },
        'getElementAttribute' => {
                                   'url' => 'session/:sessionId/element/:id/attribute/:name',
                                   'method' => 'GET'
                                 },
        'mouseMoveToLocation' => {
                                   'url' => 'session/:sessionId/moveto',
                                   'method' => 'POST'
                                 },
        'doubleClick' => {
                           'url' => 'session/:sessionId/doubleclick',
                           'method' => 'POST'
                         },
        'getElementSize' => {
                              'url' => 'session/:sessionId/element/:id/size',
                              'method' => 'GET'
                            },
        'goBack' => {
                      'url' => 'session/:sessionId/back',
                      'method' => 'POST'
                    },
        'setElementSelected' => {
                                  'url' => 'session/:sessionId/element/:id/selected',
                                  'method' => 'POST'
                                },
        'getWindowSize' => {
                             'url' => 'session/:sessionId/window/:windowHandle/size',
                             'method' => 'GET'
                           },
        'getTitle' => {
                        'url' => 'session/:sessionId/title',
                        'method' => 'GET'
                      },
        'status' => {
                      'url' => 'status',
                      'method' => 'GET'
                    },
        'clickElement' => {
                            'url' => 'session/:sessionId/element/:id/click',
                            'method' => 'POST'
                          },
        'getWindowHandles' => {
                                'url' => 'session/:sessionId/window_handles',
                                'method' => 'GET'
                              },
        'sendModifier' => {
                            'url' => 'session/:sessionId/modifier',
                            'method' => 'POST'
                          },
        'getPageSource' => {
                             'url' => 'session/:sessionId/source',
                             'method' => 'GET'
                           },
        'close' => {
                     'url' => 'session/:sessionId/window',
                     'method' => 'DELETE'
                   },
        'getSessions' => {
                           'url' => 'sessions',
                           'method' => 'GET'
                         },
        'get' => {
                   'url' => 'session/:sessionId/url',
                   'method' => 'POST'
                 },
        'dragElement' => {
                           'url' => 'session/:sessionId/element/:id/drag',
                           'method' => 'POST'
                         },
        'setWindowPosition' => {
                                 'url' => 'session/:sessionId/window/:windowHandle/position',
                                 'method' => 'POST'
                               },
        'quit' => {
                    'url' => 'session/:sessionId',
                    'method' => 'DELETE'
                  },
        'acceptAlert' => {
                           'url' => 'session/:sessionId/accept_alert',
                           'method' => 'POST'
                         },
        'findElement' => {
                           'url' => 'session/:sessionId/element',
                           'method' => 'POST'
                         },
        'switchToFrame' => {
                             'url' => 'session/:sessionId/frame',
                             'method' => 'POST'
                           },
        'buttonUp' => {
                        'url' => 'session/:sessionId/buttonup',
                        'method' => 'POST'
                      },
        'isElementEnabled' => {
                                'url' => 'session/:sessionId/element/:id/enabled',
                                'method' => 'GET'
                              },
        'executeScript' => {
                             'url' => 'session/:sessionId/execute',
                             'method' => 'POST'
                           },
        'findChildElement' => {
                                'url' => 'session/:sessionId/element/:id/element',
                                'method' => 'POST'
                              },
        'getAlertText' => {
                            'url' => 'session/:sessionId/alert_text',
                            'method' => 'GET'
                          },
        'dismissAlert' => {
                            'url' => 'session/:sessionId/dismiss_alert',
                            'method' => 'POST'
                          },
        'getWindowPosition' => {
                                 'url' => 'session/:sessionId/window/:windowHandle/position',
                                 'method' => 'GET'
                               },
        'getCapabilities' => {
                               'url' => 'session/:sessionId',
                               'method' => 'GET'
                             }
      }, 'Selenium::Remote::Commands' ),
    'javascript' => bless( do{\(my $o = 1)}, 'JSON::XS::Boolean' ),
    'port' => '80',
    'remote_server_addr' => 'stuartpyoung:88e46cd6-4444-4fbe-af44-9d7e74f9ebf4@ondemand.saucelabs.com',
    'pid' => 4255,
    'auto_close' => 1,
    'platform' => 'Mac 10.6',
    'accept_ssl_certs' => $VAR1->{'javascript'}
}, 'Selenium::Remote::Driver' );


    
</entry>
<entry [Sat 2013:09:07 09:35:44 EST] SETUP SELENIUM WITH BAMBOO>

SAUCE PLUGIN
https://marketplace.atlassian.com/plugins/com.saucelabs.bamboo.bamboo-sauceondemand-plugin

SETUP SELENIUM WITH BAMBOO
https://confluence.atlassian.com/display/AOD/Populating+your+EBS+volume#PopulatingyourEBSvolume-SettingupSeleniumonelasticagents

USE SELENIUM WITH perl WEBDRIVER
http://search.cpan.org/~aivaturi/Selenium-Remote-Driver/lib/Selenium/Remote/Driver.pm


SET UP SELENIUM ON AWS
https://confluence.atlassian.com/display/AOD/Populating+your+EBS+volume#PopulatingyourEBSvolume-SettingupSeleniumonelasticagents


</entry>
<entry [Sat 2013:09:07 01:35:14 EST] PUPPET VS CHEF>


http://www.infoworld.com/d/data-center/puppet-or-chef-the-configuration-management-dilemma-215279

https://www.scriptrock.com/blog/puppet-vs-chef-battle-wages/

DOCS
http://docs.puppetlabs.com/
http://docs.opscode.com/

COOKBOOKS
http://www.amazon.com/Pro-Puppet-James-Turnbull/dp/1430230576
http://www.amazon.com/Puppet-2-7-Cookbook-John-Arundel/dp/1849515387
http://www.amazon.com/Test-Driven-Infrastructure-Chef-Stephen-Nelson-Smith/dp/1449304818
http://www.amazon.com/Chef-Definitive-Guide-Stephen-Nelson-Smith/dp/1449327443

CLARITY VS POWER
http://utcc.utoronto.ca/~cks/space/blog/programming/ConfiguringInRealLanguage

    
</entry>
<entry [Sat 2013:09:07 01:09:40 EST] INTEGRATING BAMBOO WITH JIRA>

DEPLOY WITH PUPPET OR CHEF SCRIPT

https://quickstart.atlassian.com/es/download/bamboo/get-started/continuous-delivery-with-bamboo-and-jira
https://quickstart.atlassian.com/es/download/bamboo/get-started/continuous-delivery-with-bamboo-and-jira


Within the Manual Stage, you can now add a Job that: 

    Deploys your web application to an Application Server (such as Tomcat or JBoss)
    Uploads files using sftp or ftp to your website
    *** Applies a Puppet or Chef configuration to your server machine ***
    Executes any other scriptable action that gets your software in the hands of users.


With the Manual Stage and its Job in place, whenever your build executes, it will stop at the Manual Stage you created. The status icon will no longer show the success icon but will display the partial success icon, denoting that the build has stopped to wait for manual intervention by the user.

 

6 steps toward stress-free releases with JIRA & Bamboo
http://blogs.atlassian.com/2013/09/6-steps-toward-stress-free-releases-with-jira-bamboo/


https://confluence.atlassian.com/display/BAMBOO/Integrating+Bamboo+with+JIRA

Using JIRA and Bamboo together, you can:

    create actionable JIRA issues from a Bamboo build
    run a Bamboo build when releasing a JIRA version
    have Bamboo automatically link a plan branch with a JIRA issue
    view the JIRA issues linked to a build result
    view the Bamboo builds that relate to a particular JIRA issue
    view the Bamboo builds that relate to a JIRA project or version
    add Bamboo gadgets to a JIRA dashboard.
    
</entry>
<entry [Wed 2013:04:24 09:56:05 EST] CONTINUOUS INTEGRATION WITH DOJO TESTS>

dRobotReport
http://codeblog.bigbrowser.net/dojo-objective-harness-testing-with-continuous-integration/

Mocha (NODE)
http://visionmedia.github.io/mocha/

Jenkins
http://stackoverflow.com/questions/5256334/how-to-run-dojo-doh-unit-tests-through-jenkins/10891178#10891178


</entry>
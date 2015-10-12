ruby

<entry [Wed 2012:09:26 05:53:30 EST] RUBY IN THE CLOUD>

http://www.ruby-doc.org/gems/docs/n/nirvdrum-rubber-1.1.7/Object.html

STARTING TO PULL AWAY
https://github.com/wr0ngway/rubber/blob/master/lib/rubber/recipes/rubber/volumes.rb

</entry>
<entry [Fri 2012:06:01 16:09:46 EST]INSTALLED RUBY ON LAPTOP>

sudo su
apt-get install ruby
apt-get install rubygems
gem install sinatra
gem install oauth2
gem install json


TO RUN testOauth.rb:

  #!/usr/bin/env ruby
  
  require 'rubygems'
  require 'sinatra'
  require 'oauth2'
  require 'json'
  
  ...

TEST:

/mnt/home/syoung/notes/agua/restricted/bin/test# ./testOauth.rb 

  Faraday: you may want to install system_timer for reliable timeouts
  [2012-06-01 18:04:48] INFO  WEBrick 1.3.1
  [2012-06-01 18:04:48] INFO  ruby 1.8.7 (2011-06-30) [x86_64-linux]
  == Sinatra/1.3.2 has taken the stage on 4567 for development with backup from WEBrick
  [2012-06-01 18:04:53] INFO  WEBrick::HTTPServer#start: pid=672 port=4567



</entry>
xy


<entry [Sun 2013:06:23 13:48:08 EST] RESTARTED AS m1.large>


echo $xy
    i-2c67c640

ec2stop i-2c67c640

ec2-modify-instance-attribute  \
--instance-type m1.large \
i-2c67c640

    instanceType	i-2c67c640	m1.large

    
</entry>
<entry [Sat 2013:06:22 20:43:32 EST] TEST BACKEND createExperiment>


reset; echo '{"username":"admin","sessionid":"9999999999.9999.999","mode":"createExperiment","module":"Xy::Base","query":{"experiment":"BloodSugar","variables":["Blood Sugar"]},"SHOWLOG":4}' | ./xy.pl



    
</entry>
<entry [Sat 2013:06:22 13:05:17 EST] KEVIN>
    

quantitative self
modified self

    
sparklines

graphing


conjtact

app


    
</entry>
<entry [Sat 2013:06:22 11:13:56 EST] TO DO>
    

1. INSTANCE USERS

userdel stuart
useradd -d /home/stuart -m stuart
passwd stuart

userdel tyler
useradd -d /home/tyler -m tyler
passwd tyler

userdel philip
useradd -d /home/philip -m philip
passwd philip



2. DEV GROUP








    
</entry>
<entry [Sat 2013:06:22 10:35:33 EST] LINEAR SLIDER TABLES>


SLIDER


CREATE TABLE IF NOT EXISTS linearSlider
(
    username        VARCHAR(30) NOT NULL,
    experiment      VARCHAR(30) NOT NULL,
    type            ENUM ('linear', 'log') ,
    xmin	        INT NOT NULL DEFAULT 0,
    xmax	        INT NOT NULL DEFAULT 1000 ,
    ymin	        INT NOT NULL DEFAULT 1,
    ymax	        INT NOT NULL DEFAULT 10,
    xvar_name	    'Cost',
    yvar_name	    'Value',

    PRIMARY KEY (username, experiment, type)
);


DATASERIES

CREATE TABLE IF NOT EXISTS dataseries
(
    username        VARCHAR(30) NOT NULL,
    experiment      VARCHAR(30) NOT NULL,
    datetime        DATETIME NOT NULL,
    x               INT(10) NOT NULL,
    y               INT(10) NOT NULL,

    PRIMARY KEY (username, experiment, x, y)
);


POLL

CREATE TABLE IF NOT EXISTS poll
(
    username        VARCHAR(30) NOT NULL,
    experiment      VARCHAR(30) NOT NULL,
    delay           INT(10) NOT NULL,       -- notification_succ

    PRIMARY KEY (username, experiment)
);




UI
--


poll_freq = SchedulerObject()

SchedulerObject.get_next_poll_time()

‘MVP’
‘exponential’
‘daily’

min_interval_sec = 5*60
tau = 3*60
times = [9:00, 12:00, 18:00]    (eg three times a day)    



</entry>
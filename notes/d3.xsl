d3




<entry [Tue 2013:04:23 19:32:20 EST] FIXED: Y AXIS RANGE TOPS OUT AT 98>

PROBLEM:

GRAPH Y AXIS RANGE IS SET AT 98 AND CHOPS OFF PEAKS


DIAGNOSIS:

98 HAS THE HIGHEST ASCII VALUE (THERE IS NO 99 OR 999, ETC. IN THE SERIES)


SOLUTION:

USE parseInt()

    
    
</entry>
<entry [Tue 2013:04:23 16:46:09 EST] d3 PARSEDATE FUNCTION>

Input date / time formatted as a generic MySQL ‘YYYY-MM-DD HH:MM:SS’ TIMESTAMP:

    parseDate = d3.time.format("%Y-%m-%d %H:%M:%S").parse;


Check out the Time Formatting page on the D3 Wiki for a the authoritative list and some great detail, but the following is the list of currently available formatters (from the d3 wiki):

%a - abbreviated weekday name.
%A - full weekday name.
%b - abbreviated month name.
%B - full month name.
%c - date and time, as "%a %b %e %H:%M:%S %Y".
%d - zero-padded day of the month as a decimal number [01,31].
%e - space-padded day of the month as a decimal number [ 1,31].
%H - hour (24-hour clock) as a decimal number [00,23].
%I - hour (12-hour clock) as a decimal number [01,12].
%j - day of the year as a decimal number [001,366].
%m - month as a decimal number [01,12].
%M - minute as a decimal number [00,59].
%p - either AM or PM.
%S - second as a decimal number [00,61].
%U - week number of the year (Sunday as the first day of the week) as a decimal number
[00,53].
%w - weekday as a decimal number [0(Sunday),6].
%W - week number of the year (Monday as the first day of the week) as a decimal number
[00,53].
%x - date, as "%m/%d/%y".
%X - time, as "%H:%M:%S".
%y - year without century as a decimal number [00,99].
%Y - year with century as a decimal number.
%Z - time zone offset, such as "-0700".

There is also a a literal "%" character that can be presented by using double % signs.


    
</entry>
<entry [Fri 2012:12:21 12:31:41 EST] DOJO CHARTING AND D3 SUPPORT SITES>


http://dojotoolkit.org/features/graphics-and-charting


http://d3js.org/

    
</entry>
<entry [Fri 2012:12:21 12:26:26 EST] EVENT SUPPORT IN DOJO CHARTS>

http://www.sitepen.com/blog/2008/05/27/dojo-charting-event-support-has-landed/

The Following events are supported: onclick, onmouseover, and onmouseout.

As mentioned in Zooming, Scrolling, and Panning in Dojo Charting, our next goal to tackle was charting events. I am happy to announce that event support for Charting has landed in the Dojo trunk, and shipped with Dojo 1.2. It was the most requested dojox.charting feature, and I am excited that it is finally here!

Now you can interact with following elements representing your data points:
Chart 	Element 	Comment
Default 	marker 	This chart is responsible for lines and areas with markers, and the scatter chart.
Stacked 	marker 	This chart is responsible for stacked lines and areas.
Bars 	bar 	Horizontal bars.
StackedBars 	bar 	 
ClusteredBars 	bar 	A clustered version of bars.
Columns 	column 	Vertical columns.
StackedColumns 	column 	 
ClusteredColumns 	column 	A clustered version of columns.
Bubble 	circle 	 
Pie 	slice 	 


</entry>
<entry [Fri 2012:12:21 12:20:15 EST] USE RAPHAEL FOR COMPLEX GRAPHS>

http://www.google.com/url?sa=t&rct=j&q=d3.js%20dojo&source=web&cd=3&cad=rja&ved=0CD0QFjAC&url=http%3A%2F%2Fstackoverflow.com%2Fquestions%2F119969%2Fjavascript-chart-library&ei=mZPUUKzwLYqW8gSj3oCoAg&usg=AFQjCNHjv8NRq0MxaxPSb5HsrjzJ4JspaQ&bvm=bv.1355534169,d.dmQ

I was recently looking for a javascript charting library and I evaluated a whole bunch before finally settling on jqplot which fit my requirements very well. As Jean Vincent's answer mentioned you are really choosing between canvas based and svg based solution.

To my mind the major pros and cons were as follows. The SVG based solutions like Raphael (and offshoots) are great if you want to construct highly dynamic/interactive charts. Or if you charting requirements are very much outside the norm (e.g. you want to create some sort of hybrid chart or you've come up with a new visualization that no-one else has thought of yet). The downside is the learning curve and the amount of code you will have to write. You won't be banging out charts in a few minutes, be prepared to invest some real learning time and then to write a goodly amount of code to produce a relatively simple chart.

If your charting requirements are reasonably standard, e.g. you want some line or bar graphs or perhaps a pie chart or two, with limited interactivity, then it is worth looking at canvas based solutions. There will be hardly any learning curve, you'll be able to get basic charts going within a few minutes, you won't need to write a lot of code, a few lines of basic javascript/jquery will be all you need. Of course you will only be able to produce the specific types of charts that the library supports, usually limited to various flavors of line, bar, pie. The interactivity choices will be extremely limited, that is to say non-existent for many of the libraries out there, although some limited hover effects are possible with the better ones.

I went with JQplot which is a canvas based solution since I only really needed some standard types of charts. From my research and playing around with the various choices I found it to be reasonably full-featured (if you're only after the standard charts) and extremely easy to use, so I would recommend it if your requirements are similar.

To summarize, simple and want charts now, then go with JQplot. Complex/different and not pressed for time then go with Raphael and friends.

    
</entry>
<entry [Fri 2012:12:21 12:17:58 EST] d3 WAS CREATED BY STANFORD VISUALIZATION GROUP>

http://stackoverflow.com/questions/119969/javascript-chart-library

There is another javascript library based on SVG. It is called Protovis and it comes from Stanford Visualization Group

It also allows making nice interactive graphics and visualizations.

http://vis.stanford.edu/protovis/ex/

Although it is only for modern web browsers

UPDATE: The protovis team has moved to another library called d3.js (Data Driven Documents) as they said:

"The Protovis team is now developing a new visualization library, D3.js, with improved support for animation and interaction. D3 builds on many of the concepts in Protovis"

The new library can now be found in:

http://mbostock.github.com/d3/

UPDATE 2:

"Rickshaw" is a JavaScript toolkit for creating interactive time series graphs. Based on d3.js that simplifies a lot the work with d3.js although is a little bit less powerful.

http://code.shutterstock.com/rickshaw/

    
</entry>
<entry [Fri 2012:12:21 12:08:05 EST] WHICH IS BETTER - SVG OR CANVAS?>

SVG, SEE BELOW

http://stackoverflow.com/questions/119969/javascript-chart-library

There is a growing number of Open Source and commercial solutions for pure JavaScript charting that do not require Flash. In this response I will only present Open Source options.

There are 2 main classes of JavaScript solutions for graphics that do not require Flash:

    Canvas-based, rendered in IE using ExplorerCanvas that in turns relies on VML
    SVG on standard-based browsers, rendered as VML in IE

There are pros and cons of both approaches but for a charting library I would recommend the later because it is well integrated with DOM, allowing to manipulate charts elements with the DOM, and most importantly setting DOM events. By contrast Canvas charting libraries must reinvent the DOM wheel to manage events. So unless you intend to build static graphs with no event handling, SVG/VML solutions should be better.

For SVG/VML solutions there are many options, including:

    Dojox Charting, good if you use the Dojo toolkit already
    Raphael-based solutions

Raphael is a very active, well maintained, and mature, open-source graphic library with very good cross-browser support including IE 6 to 8, Firefox, Opera, Safari, Chrome, and Konqueror. Raphael does not depend on any JavaScript framework and therefore can be used with Prototype, jQuery, Dojo, Mootools, etc...

There are a number of charting libraries based on Raphael, including (but not limited to):

    gRaphael, an extension of the Raphael graphic library
    Ico, with an intuitive API based on a single function call to create complex charts

Disclosure: I am the developer of one of the Ico forks on github.

    
</entry>
<entry [Fri 2012:12:21 12:03:32 EST] d3 WEB RESOURCES>

LIST OF GRAPH TYPES IN d3
https://github.com/mbostock/d3/wiki/Gallery

COMPARISON WITH OTHER GRAPHIC LIBRARIES
www.google.com/url?sa=t&rct=j&q=d3.js dojo&source=web&cd=7&cad=rja&ved=0CF0QFjAG&url=http%3A%2F%2Fsocialcompare.com%2Fen%2Fcomparison%2Fjavascript-graphs-and-charts-libraries&ei=mZPUUKzwLYqW8gSj3oCoAg&usg=AFQjCNG0gZyPcxd0IR6yjelb5xXIaZmkmA&bvm=bv.1355534169,d.dmQ




</entry>
gimp


<entry [Tue 2014:05:13 14:23:33 EST] CREATE FAVICON>

1. SAVE FILE IN SIZES 64 pixels TO 16 pixels

cd ~/annai/site/images
64 × 64	favicon64.png	
Currently used by IE; and (potentially) by browsers on high-resolution displays in the near future.

32 × 32	favicon32.png
24 × 24	favicon24.png
16 × 16	favicon16.png


2. CREATE FAVICON 

Right-click on LARGEST image in GIMP and choose File / Open as Layers… Choose the other favicons, from largest to smallest.


3. EXPORT AS FAVICON

CNTL+E --> USE .ico SUFFIX (WINDOWS ICON FILE)



</entry>
<entry [Wed 2013:09:04 12:10:36 EST] GRADIENT ON LAYER>

How to fade image layers using Gimp gradient/blend tool
This post will explain how to do fading (fade out a layer) in Gimp.

Assuming you have an image open...

Add a new layer
Draw the part you want faded
Right click on the layer in the Layers panel/window and select 'Add Layer Mask', then click on Add on the Add Layer Mask dialog (making sure the default value of 'White (full opacity)' is selected).
Select the Blend/Gradient tool and set the Gradient to 'FG to GB(RGB)' .
On the layer click and drag a line where you want the gradient (fade) to start and finish.  The first click is where it will be faded out and the second click is where it will start to fade.
Right click on the layer in the Layers panel/window and select 'Apply Layer Mask'.
That's it.
    
</entry>
<entry [Thu 2013:08:08 17:59:35 EST] CREATE DROP SHADOW>

Click on Filters -> Light and Shadow -> Drop Shadow

    
</entry>
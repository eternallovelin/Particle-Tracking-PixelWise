# Particle-Tracking-PixelWise for Red Object Tracking
Description: This code is modified from the demo of red object tracking in Matlab
(http://www.mathworks.com/matlabcentral/fileexchange/33666-simple-particle-filter-demo)
with some other features.  
  1. The object is first selected to track. 
  2. Adding bounding box instead of using particles only
  2. Particles are generated inside the bounding box with gaussian distribution
     instead of random generated entire frame.

Usage: 
  1. Press 'p' to pause video 
  2. Using cursors to draw the bounding box of object wish to be tracked.
  3. Change show_particle variable to '0' or '1' to turn off or turn on showing particles.
  

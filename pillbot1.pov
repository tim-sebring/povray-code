// Persistence Of Vision raytracer version 3.1 sample file.
// Original design by Tim Sebring timATtimsebringDOTcom


#include "colors.inc"
global_settings { assumed_gamma 2.2 }

#declare xfactor = clock*4;
#declare spherey = 5+abs(50*sin((clock)*2*pi));
#switch (xfactor)
    #range(0,1)  // x value cycles from 0 to 1
    #debug "Range A"
        #declare spherex = 50*xfactor
        #break
    #range(1,3)  // x value cycles from 1 to -1
    #debug "Range B"
        #declare spherex = 50*(2-xfactor)
        #break
    #range(3,4)  // x value cycles from -1 back to 0
    #debug "Range C"
        #declare spherex = -50*(4-xfactor)
        #break
#end

camera {
    location  <40, 20, -60>
    direction <0,  0,   1>
    up        <0,  1,   0>
    right   <4/3,  0,   0>
    look_at <0, 11, 0>
}

//------------------------------------------------

// Temp camera1... comment out when not debugging.

//camera {
//    location  <-73.828125, 15, -15.3125>
//    direction <0,  -1,   0>
//    up        <1,  0,   0>
//    right   <0,  4/3,   0>
//    look_at <0, -1, 0>
//}
//------------------------------------------------




light_source {<30, 20, -30> colour White
    fade_distance 190
    fade_power 1
}

sky_sphere {
    pigment {
        gradient y
        color_map {
            [0.0 Blue ]
            [1.0 SkyBlue ]
        }
    }
}

#declare Brick =
texture {
    pigment { Gray75 }
    finish {
        ambient 0.0
        diffuse 0.8
    }
    scale 6
}

//plane { x, -60 texture { Brick rotate y*90 }}               // left wall
//plane { x, 60 texture { Brick rotate y* 90}}                // right wall
//plane { z, 40 hollow on texture { Brick }}                            // back wall
plane { y, 0 texture { Brick }} // translate -y*5 }             // floor


// Capped Cylinder, closed [or open ended]
// cylinder { <END1>, <END2>, RADIUS [open] }
//  END1 = coord of one end of cylinder
//  END2 = coord of other end
// RADIUS = size of cylinder
// open = if present, cylinder is hollow, else capped


// --------------------- BEGIN BOTTLE --------------------------------


// This is the bronze/transparent part of the pill bottle
cylinder
{
  <10,0,0>,  <10,30,0>,  10
  // open
    texture {
        pigment { rgbt<0.55, 0.57, 0.14, 0.6> }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

//This is the lower rim on the bottom of the cap
cylinder
{
  <10,29,0>,  <10,30,0>,  11.5
  // open
    texture {
        pigment { White }
        finish { specular 1 roughness 0.001 }
    }
  
  
}



//This is the main part of the white cap
cylinder
{
  <10,29,0>,  <10,37,0>,  11
  // open
    texture {
        pigment { White }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

// --------------------- END BOTTLE --------------------------------

// -------------------  BEGIN PILL 1--------------------------------
// This is the beginning of the pill in the bottom of the bottle.
cylinder
{
  <7,2.5,0>   <13,2.5,0>,  3
  // open
    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

// create a sphere shape
sphere
{
  <7, 2.5, 0> ,  3                       // center of sphere <X Y Z>
                                   // radius of sphere
  // scale <1,2,1> // <= Note: Spheres can become ellipses by uneven scaling  

    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }


}


sphere
{
  <13, 2.5, 0> ,  3                       // center of sphere <X Y Z>
                                   // radius of sphere
  // scale <1,2,1> // <= Note: Spheres can become ellipses by uneven scaling  

    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }


}


//-----------------------  END PILL 1-------------------------------                  

// -------------------  BEGIN PILL 2--------------------------------
// This is the beginning of the pill in the bottom of the bottle.
cylinder
{
  <10,2.5,-5>   <5.5, 5.8,-5>,  3
  // open
    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

// create a sphere shape
sphere
{
  <5.5, 5.8, -5> ,  3                       // center of sphere <X Y Z>
                                   // radius of sphere
  // scale <1,2,1> // <= Note: Spheres can become ellipses by uneven scaling  

    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }


}


sphere
{
  <10, 2.5, -5> ,  3                       // center of sphere <X Y Z>
                                   // radius of sphere
  // scale <1,2,1> // <= Note: Spheres can become ellipses by uneven scaling  

    texture {
        pigment { Green }
        finish { specular 1 roughness 0.001 }
    }


}


//-----------------------  END PILL 2-------------------------------                  
      
      
//-----------------------  BEGIN PEN -------------------------------

//This is the main white stem of the pen
cylinder
{
  <-55, 3, -5>   <20, 3,-25>,  3
  // open
    texture {
        pigment { White }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

//Gonna try a cone instead of the cylinder, same coordinates

// clipped conical shape
// cone { <END1>, RADIUS1, <END2>, RADIUS2 [open] }
// Where <END1> and <END2> are vectors defining the x,y,z
// coordinates of the center of each end of the cone
// and RADIUS1 and RADIUS2 are float values for the radii
// of those ends.  open, if present, cone is hollow, else capped
cone
{
<-55, 3, -5>, 3.1   <-56.171875, 3, -4.6875>,  2
  
    texture {
        pigment { Blue }
        finish { specular 1 roughness 0.001 }
    }
  
  
}


// Part of the blue tip.. a small cylinder

cylinder
{
  <20, 3,-25>   <21.171875, 3, -25.3125>,  3
  // open
    texture {
        pigment { Blue }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

//First cone of the blue tip part.

cone
{
<21.171875, 3, -25.3125>, 3   <23.515625, 3, -25.9375>,  2.5
  
    texture {
        pigment { Blue }
        finish { specular 1 roughness 0.001 }
    }
  
  
}


//Second cone of the blue tip part. (Next to the brown part)

cone
{
<23.515625, 3, -25.9375>,  2.5   <27.03125, 3, -26.875>,  1.9
  
    texture {
        pigment { Blue }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

// This is the first brown part, near the tip of the pen, right next to the blue part.
cylinder
{
  <27.03125, 3, -26.875>   <28.203125, 3, -27.1875>,  1.5
  // open
    texture {
        pigment { Bronze }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

//Second cone of the brown tip part.

cone
{
<28.203125, 3, -27.1875>,  1.5   <30.546875, 3, -27.8125>,  .8
  
    texture {
        pigment { Bronze }
        finish { specular 1 roughness 0.001 }
    }
  
  
}



//Beginning of the 'brass' part of the pen tip.

cone
{
<30.546875, 3, -27.8125>,  .7   <31.1328125, 3, -27.96875>,  .3
  
    texture {
        pigment { Brass }
        finish { specular 1 roughness 0.001 }
    }
  
  
}

//Middle part of the brass pen tip.

cone
{
<30.83984375, 3, -27.890625>,  .45   <31.71875, 3, -28.125>,  .3
  
    texture {
        pigment { Brass }
        finish { specular 1 roughness 0.001 }
    }
  
  
}


sphere
{
  <31.71875, 3, -28.125> ,  .3                       // center of sphere <X Y Z>
                                   // radius of sphere
  // scale <1,2,1> // <= Note: Spheres can become ellipses by uneven scaling  

    texture {
        pigment { Blue }
        finish { specular 1 roughness 0.001 }
    }


}


//-----------------------  END PEN -------------------------------



//  ---------------  This is my x-axis marker  ----------------------
//cylinder
//{
//  <30, 5, -5>   <-5, 5, -5>,  3
//    texture {
//        pigment { White }
//        finish { specular 1 roughness 0.001 }
//    }
  
  
//}










        

///////////////////////////////////////////////////////////////////////
# Wide Screen Layout by Tankman3737               
# As always, thanks to those developers for their time, effort and great modules 
# Big Thanks to Chadnaut for the Curve shader, Perspective and reflection modules                                                             
# (AM+) v3.0.9                                          
# Updated (12-11-24)   

///////////////////////////////////////////////////////////////////////
fe.layout.width=1920;
fe.layout.height=1080;
fe.layout.preserve_aspect_ratio = true

fe.load_module("perspective");
fe.load_module("inertia")
fe.load_module("wheel");


local screen=fe.add_image("assets/screen.png",0,0,1920,1080)
local BG=fe.add_image("assets/bg3.png",0,0,1920,1080)




 ////////////////////Main Screen Reflection//////////
local S1=fe.add_surface(1920,800)
S1.x=0
S1.y=500
S1.mipmap = true
S1.alpha=0
local retrocentre =
{                             ////////////////////Main Screen Reflection//////////
    function init()
    {
    slots <- 9
    speed <- 900
    artwork_label <- "snap" 
    //video_flags <- Vid.ImagesOnly
    x <- 730
    y <- 180
    layout.y <- [ 0,0,0,0,0,0,0,0,0 ]
    layout.x <- [ -1540,-1140, -740,-360, -55, 460,820,1200,1600] 
    layout.width <- [ 400,400,380,360, 600, 360,380,400,400]
    layout.height <- [ 480,-480,-480,-480, -480, -480,-480,480,480] 
    layout.pinch_x<-  [0,0,0,0,150,0,0,0,0]   
        //////////////middle screen
    layout.alpha <- [ 00, 50, 50, 50, 30, 50, 50, 50, 0 ]
    zorder <- 2
    anchor <- Wheel.Anchor.TopLeft
    }
}	
local wheelcentre = fe.add_wheel( retrocentre,S1)
 

local r = fe.add_surface(1920, 1005);////////SURFACE HAS TO BE BIGGER BECAUSE REFLECTION IS OPPOSITE////////
r.set_pos( 0, 0 )
r.y = 50;///////////////////SORT THIS OUT FIRST, GET THE SELECTED GAME LINED UP, DO THE REST IN WHEEL2REFLECT //////////
r.shader = ::fe.add_shader(Shader.Fragment, "assets/reflection.frag");
r.shader.set_texture_param("source", S1 ); // <-- pass in the artwork surface
r.shader.set_param("blur", 4.4, 5.4); // from & to blur strength
r.alpha=250
r.visible = true
////////////////////Main Screen Reflection//////////





//////////Bottom Logo wheel Surfaces and Shadow///////////
local wheelS=Perspective(fe.add_surface(1075,165));
wheelS.x=420
wheelS.y=760                      //////////////right screen2
wheelS.set_offset(255, 0, -255, 0, 0, 0, 0, 0)  //set_offset(tl_x, tl_y, tr_x, tr_y, bl_x, bl_y, br_x, br_y)
//local white=wheel.add_image("assets/white.png",0,0,1640,170)
wheelS.set_rgb( 0,0,0 )
wheelS.alpha=50

local wheel=Perspective(fe.add_surface(1075,165));
wheel.x=420
wheel.y=752                      //////////////right screen2
wheel.set_offset(170, 0, -167, 0, 0, 0, 0, 0)  //set_offset(tl_x, tl_y, tr_x, tr_y, bl_x, bl_y, br_x, br_y)
//local white=wheel.add_image("assets/white.png",0,0,1640,170)
//wheel.alpha=0

//////////Bottom Logo wheel Surfaces and Shadow///////////






local boxP=Perspective(fe.add_surface(300,170));
boxP.x=120
boxP.y=750                      //////////////Left Box/////////
boxP.set_offset(260, 0, 173, 0, 0, 0, 0, 0)  //set_offset(tl_x, tl_y, tr_x, tr_y, bl_x, bl_y, br_x, br_y)
local box=boxP.add_artwork("2Dboxes",0,0,300,170)



local boxP2=Perspective(fe.add_surface(300,170));
boxP2.x=1500
boxP2.y=750                      //////////////Right Box//////////////
boxP2.set_offset(-173, 0, -260, 0, 0, 0, 0, 0)  //set_offset(tl_x, tl_y, tr_x, tr_y, bl_x, bl_y, br_x, br_y)
local box2=boxP2.add_artwork("2Dboxes",0,0,300,170)







//////////Bottom Logo wheel and Shadow///////////


local retrocentreS =
{
    function init()
    {
    slots <- 5
    speed <- 900
    artwork_label <- "wheel" 
    //vide o_flags <- Vid.ImagesOnly
    x <- -10
    y <- 10
    layout.y <- [ 85,85,85,85,85 ]
    layout.x <- [  -430,-430, 538, 1500,2060] 
    layout.width <- [550,550, 600, 550,550]
    layout.height <- [ 150,150,150,150, 150]          
    layout.alpha <- [ 255, 255, 255, 255, 255 ]
    zorder <- 2
    anchor <- Wheel.Anchor.Centre
    

    }
}	
local wheelcentre = fe.add_wheel( retrocentreS,wheelS)


local retrocentreC =
{
    function init()
    {
    slots <- 5
    speed <- 900
    artwork_label <- "wheel" 
    //vide o_flags <- Vid.ImagesOnly
    x <- 0
    y <- 0
    layout.y <- [ 85,85,85,85,85 ]
    layout.x <- [  -430,-430, 538, 1500,2060] 
    layout.width <- [550,550, 550, 550,550]
    layout.height <- [ 150,130,130,130, 150]            
    //layout.alpha <- [ 0, 0, 255, 0, 0 ]
    zorder <- 2
    anchor <- Wheel.Anchor.Centre
    

    }
}	
local wheelcentre = fe.add_wheel( retrocentreC,wheel)


//////////Bottom Logo wheel and Shadow///////////






local blue_light=fe.add_image("assets/blue_light.png",0,0,1920,1080)
blue_light.alpha=128

local red_light=fe.add_image("assets/red_light.png",0,0,1920,1080)
red_light.alpha=128


/////////////////////Main Screen  and Curve shader//////////////
local MS=fe.add_surface(1920,800)
MS.x=0
MS.y=20
MS.shader = fe.add_shader(Shader.Fragment, "assets/curve.frag");
MS.shader.set_param("strength", 0.75); // amount of curvature [0..1]
MS.shader.set_param("dir", 0.35); // alignment [0..1]


local retrocentre =
{
    function init()
    {
    slots <- 9
    speed <- 900
    artwork_label <- "snap" 
    //video_flags <- Vid.ImagesOnly
    x <- 730
    y <- 180
    layout.y <- [ 0,0,0,0,0,0,0,0,0 ]
    layout.x <- [ -1540,-1140, -740,-360, 0, 460,820,1200,1600] 
    layout.width <- [ 400,400,380,360, 460, 360,380,400,400]
    layout.height <- [ 480,480,480,480, 480, 480,480,480,480]           
    //layout.alpha <- [ 0, 0, 0, 0, 255, 0, 0, 0, 0 ]
    zorder <- 2
    anchor <- Wheel.Anchor.TopLeft
    }
}	
local wheelcentre = fe.add_wheel( retrocentre,MS)
/////////////////////Main Screen//////////////


local Mscreen=MS.add_image("Assets/Mscreen4.png",0,30,1920,670)//////////////Main screen Frame///////////////
Mscreen.zorder=10







visilibity
==========

A copy of Karl J. Obermeyer's VisiLibity (http://www.visilibity.org/)

[the following is taken from http://www.visilibity.org/ ]


What is VisiLibity?
===================

VisiLibity is a free open source C++ library for 2D floating-point visibility 
algorithms, path planning, and supporting data types. It is intended for use in 
robot and sensor network design software. Other possible applications include, 
e.g., architectural/urban planning, computer games, and education. The entire 
library consists only of a single compilation unit (one .hpp + one .cpp file) 
with no dependence on third party libraries. It is therefore suitable for 
applications where simple visibility and path planning computations are needed 
but the power of a larger computational geometry library is not necessary. 
VisiLibity offers

Current Functionality of VisiLibity (R-1) in planar polygonal environments with 
polygonal holes:

  * visibility polygons
  * visibility graphs
  * Euclidean shortest paths for a point

Exact/arbitrary precision arithmetic is avoided and robustness is achieved by 
considering two points to be colocated whenever the Euclidean distance between 
them is less or equal to a user defined tolerance &epsilon called the robustness 
constant. If the robustness constant is chosen poorly or the scale of 
environment features varies too dramatically, library functions can and will 
return errors. However, provided the user tunes the robustness constant 
appropriately, we find the library works well for a large range of useful 
environments. Examples of environments and a Matlab interface (via MEX-files) 
are available with the download package below. 


Documentation
=============

see http://motion.mee.ucsb.edu/~karl/VisiLibity/doxygen_html/index.html

Citing
======

When possible, please cite VisiLibity. For your convenience, here is a BibTeX 
item:

    @Misc{VisiLibity:08,
       author =       {K. J. Obermeyer and Contributors},
       title =        {The {VisiLibity} library},
       howpublished = {\texttt{http://www.VisiLibity.org}},
       year =         2008,
       note =         {R-1},
       abstract =     {A C++ library for floating-point visibility
                       computations},
    }

# 
# Copyright © 2015 Claus Christmann <hcc |ä| gatech.edu>.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 

# ============================================================================
#
# Variables used by this module, they can change the default behaviour and
# need to be set before calling find_package:
#
#
#   VisiLibity_USE_STATIC_LIBS   Can be set to ON to force the use of the static
#                                visilibity libraries. Defaults to OFF.

#
# Find the include directory
# =======================
#
find_path(VISILIBITY_INCLUDE_DIR visilibity.hpp PATH_SUFFIXES  visilibity)

#debug output
if( NOT VisiLibity_FIND_QUIETLY )
  if( NOT VISILIBITY_INCLUDE_DIR )
    message(SEND_ERROR ${VISILIBITY_INCLUDE_DIR})
  else( NOT VisiLibity_FIND_QUIETLY )
    message(STATUS "Visilibity include directory is " ${VISILIBITY_INCLUDE_DIR} )
  endif( NOT VISILIBITY_INCLUDE_DIR )
endif( NOT VisiLibity_FIND_QUIETLY )



#
# Find the actual library
# =======================
#

# Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
if( VisiLibity_USE_STATIC_LIBS )
  set( _VisiLibity_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
  if(WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else()
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a )
  endif()
endif( VisiLibity_USE_STATIC_LIBS )

# do the finding
find_library(VISILIBITY_VisiLibity_LIBRARY visilibity)

# Restore the original find library ordering
if( VisiLibity_USE_STATIC_LIBS )
  set(CMAKE_FIND_LIBRARY_SUFFIXES ${_VisiLibity_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
endif(VisiLibity_USE_STATIC_LIBS)




# debug output
if( NOT VisiLibity_FIND_QUIETLY )
  if( NOT VISILIBITY_VisiLibity_LIBRARY )
    message(SEND_ERROR ${VISILIBITY_VisiLibity_LIBRARY})
  else( NOT VISILIBITY_VisiLibity_LIBRARY )
    message(STATUS "Visilibity has been found as " ${VISILIBITY_VisiLibity_LIBRARY} )
  endif( NOT VISILIBITY_VisiLibity_LIBRARY )
endif( NOT VisiLibity_FIND_QUIETLY )

# find_path(VISILIBITY_INCLUDE_DIR xxx.h)
# find_library(VISILIBITY_xxx_LIBRARY xxx)
# find_library(VISILIBITY_yyy_LIBRARY yyy)


#
# Prepare the standart return
# ===========================
#
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(VISILIBITY DEFAULT_MSG
  VISILIBITY_INCLUDE_DIR VISILIBITY_VisiLibity_LIBRARY)
if(VISILIBITY_FOUND)
  set(VISILIBITY_INCLUDE_DIRS ${VISILIBITY_INCLUDE_DIR})
  set(VISILIBITY_LIBRARIES ${VISILIBITY_VisiLibity_LIBRARY} )
endif() 




# don't show the internal variables outside the advanced view
mark_as_advanced( 
  VISILIBITY_INCLUDE_DIR
  VISILIBITY_VisiLibity_LIBRARY
)
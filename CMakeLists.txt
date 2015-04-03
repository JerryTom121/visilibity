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


project(visilibity)
cmake_minimum_required(VERSION 2.8.9)


# load my CMake Stuff
get_filename_component(_cc_projects_DIR ${CMAKE_CURRENT_LIST_DIR}/../..  ABSOLUTE)
include(${_cc_projects_DIR}/CMake/Modules/cc_general.cmake) 

# install into the source dir of this project
set( CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR} )

# enable C++11
add_definitions(-std=gnu++11)

# show all warnings during the compilation
add_definitions(-Wall)

set( VISILIBITY_DIR "VisiLibity.2011_12_17" )

set( VISILIBITY_SRCS
  ${VISILIBITY_DIR}/source_code/visilibity.cpp
)
set( VISILIBITY_HDRS
  ${VISILIBITY_DIR}/source_code/visilibity.hpp
)

add_library_shared_and_static( visilibity VISILIBITY_SRCS)

add_executable( test  ${VISILIBITY_DIR}/source_code/main.cpp)
target_link_libraries( test ${LIB_VISILIBITY} )

install(TARGETS ${LIB_VISILIBITY_TARGETS}
  ARCHIVE DESTINATION ${archive_DIR}
  LIBRARY DESTINATION ${library_DIR}
)

install(FILES ${VISILIBITY_HDRS}
  DESTINATION ${headers_DIR}/visilibity 
)

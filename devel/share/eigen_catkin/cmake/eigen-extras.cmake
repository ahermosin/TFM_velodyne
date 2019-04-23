if("FALSE" STREQUAL "TRUE" AND "ON" STREQUAL "OFF")
  set(eigen_catkin_INCLUDE_DIRS ${eigen_catkin_INCLUDE_DIRS}/eigen3)
endif()

# The following eigen_catkin_enforce macro can be called in a depending 
# project's CMakeLists.txt file (Below findpackage eigen_catkin or the 
# catkin_simple() call.
# It will ensure that eigen_catkin's lib Eigen will be included instead 
# of any other possible candidate (like a system installation of Eigen).
#
# It is possible to get that right by careful treatment of workspace layer 
# order but calling this macro is easier.
macro(eigen_catkin_enforce)
  include_directories(BEFORE ${eigen_catkin_INCLUDE_DIRS})
endmacro()

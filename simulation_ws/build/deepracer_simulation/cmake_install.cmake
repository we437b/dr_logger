# Install script for directory: /home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/inspacehj/dr_logger/simulation_ws/install/deepracer_simulation")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/inspacehj/dr_logger/simulation_ws/build/deepracer_simulation/catkin_generated/installspace/deepracer_simulation.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/cmake" TYPE FILE FILES
    "/home/inspacehj/dr_logger/simulation_ws/build/deepracer_simulation/catkin_generated/installspace/deepracer_simulationConfig.cmake"
    "/home/inspacehj/dr_logger/simulation_ws/build/deepracer_simulation/catkin_generated/installspace/deepracer_simulationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation" TYPE FILE FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/deepracer_simulation" TYPE PROGRAM FILES
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/servo_commands.py"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/run_local_rl_agent.sh"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/run_rollout_rl_agent.sh"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/run_evaluation_rl_agent.sh"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/key_control.py"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/logger.py"
    "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/scripts/ackermann_control.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/launch" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/config" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/config/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/meshes" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/meshes/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/models" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/models/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/urdf" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/urdf/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepracer_simulation/worlds" TYPE DIRECTORY FILES "/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/worlds/")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/inspacehj/dr_logger/simulation_ws/build/deepracer_simulation/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/inspacehj/dr_logger/simulation_ws/build/deepracer_simulation/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")

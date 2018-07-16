# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(industrial_controls)

# Automock
set(CMAKE_AUTOMOC ON)

# Enable Qt modules
find_package(Qt5 COMPONENTS
    Core
    Gui
    Quick
    Qml
    Positioning
REQUIRED)

# Dynamic library target
add_library(${PROJECT_NAME} SHARED "")

# Public includes
HEADER_DIRECTORIES(INCLUDES "includes")
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDES})

# Sources and headers
file(GLOB_RECURSE SOURCES "includes/*.h" "sources/*.h" "sources/*.cpp" "sources/*.hpp")
target_sources(${PROJECT_NAME} PRIVATE ${SOURCES})

# Resources
file(GLOB_RECURSE QRC_FILES "*.qrc")
qt5_add_resources(QRC_SOURCES ${QRC_FILES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_SOURCES})

# Add Qt libraries
set(QT_LIBRARIES
    Qt5::Core
    Qt5::Gui
    Qt5::Quick
    Qt5::Qml
    Qt5::Positioning
)

# Link Libraries
target_link_libraries(${PROJECT_NAME} ${QT_LIBRARIES})

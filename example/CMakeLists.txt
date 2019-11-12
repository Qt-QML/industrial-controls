# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(example LANGUAGES CXX)

# Set default output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/result)

# Instruct CMake to run moc & rcc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 2ndparty libraries
include(../CMakeLists.txt)

# Add Qt Creator import path
set(QML_IMPORT_PATH "${QML_IMPORT_DIRS}" CACHE STRING "Qt Creator extra qml import paths")

# Find Qt libraries
find_package(Qt5 COMPONENTS Core Quick REQUIRED)

# Executable target
file(GLOB_RECURSE SOURCES "main.cpp" "gui_configurator.h" "gui_configurator.cpp")
file(GLOB_RECURSE QML_SOURCES "qml/*.qml")
add_executable(${PROJECT_NAME} ${SOURCES} ${QML_SOURCES})

# Industrial vendor includes & sources
target_include_directories(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_CONTROLS_INCLUDES})
target_sources(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_CONTROLS_SOURCES} ${INDUSTRIAL_CONTROLS_RESOURCES})

# Link with libraries
target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)

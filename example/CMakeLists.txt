# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(example LANGUAGES CXX)

# Set default output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/result)

# Instruct CMake to run moc & rcc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Add Qt Creator import path
set(QML_IMPORT_PATH "${QML_IMPORT_DIRS}" CACHE STRING "Qt Creator extra qml import paths")

# Find Qt libraries
find_package(Qt5 COMPONENTS Core Quick REQUIRED)

# Executable target
file(GLOB_RECURSE SOURCES "main.cpp" "gui_configurator.h" "gui_configurator.cpp")
file(GLOB_RECURSE QML_SOURCES "qml/*.qml")
add_executable(${PROJECT_NAME} ${SOURCES} ${QML_SOURCES})

# Link with libraries
target_link_libraries(${PROJECT_NAME} industrial_controls Qt5::Core Qt5::Quick)

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

# Find Qt libraries
find_package(Qt5 COMPONENTS Core Quick REQUIRED)

# Executable target
add_executable(${PROJECT_NAME} "main.cpp")

# Industrial vendor includes & sources
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/../includes)

file(GLOB_RECURSE INDUSTRIAL_SOURCES
    ${CMAKE_SOURCE_DIR}/../includes/*.h
    ${CMAKE_SOURCE_DIR}/../sources/*.cpp
    ${CMAKE_SOURCE_DIR}/../Industrial/*.qml
    ${CMAKE_SOURCE_DIR}/../Industrial/*.qml
    ${CMAKE_SOURCE_DIR}/../*.qrc
)
target_sources(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_SOURCES})

# Link with libraries
target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)

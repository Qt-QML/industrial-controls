cmake_minimum_required(VERSION 2.8.12)

project(example LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# 2ndparty libraries
include(../CMakeLists.txt)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

add_executable(${PROJECT_NAME} "main.cpp" "qml.qrc")

# Industrial vendor includes & sources
target_include_directories(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_INCLUDES})
target_sources(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_SOURCES} ${INDUSTRIAL_RESOURCES})

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)

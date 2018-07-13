# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(iIndustrialControls)

# QML compile resources
file(GLOB_RECURSE QRC_QML_FILES "qml/qml.qrc")
#qtquick_compiler_add_resources(QRC_QML_SOURCES ${QRC_QML_FILES})
qt5_add_resources(QRC_QML_SOURCES ${QRC_QML_FILES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_QML_SOURCES})

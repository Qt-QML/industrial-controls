# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(industrial_controls)

# Find QtCore module
find_package(Qt5 ${QT_REQUIRED_VERSION} CONFIG REQUIRED COMPONENTS Core Gui Qml LinguistTools)

# Target
add_library(${PROJECT_NAME} SHARED "")

# Qml import dirs
set (QML_IMPORT_PATH ${QML_IMPORT_PATH} ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "Qt Creator extra qml import paths" FORCE)

# Includes
target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}/includes")

# Sources
file(GLOB_RECURSE SOURCES "*.h" "*.hpp")
file(GLOB_RECURSE INTERNAL_INCLUDES "*.cpp")
target_sources(${PROJECT_NAME} PUBLIC ${SOURCES})
target_sources(${PROJECT_NAME} PRIVATE ${INTERNAL_INCLUDES})

# Create translations QRC file
file(GLOB TS_FILES "translations/*.ts")

set (TRANSLATIONS_QRC "${CMAKE_CURRENT_BINARY_DIR}/industrial_controls_tr_ts.qrc")

qt5_add_translation(QM_FILES ${TS_FILES})
file(WRITE ${TRANSLATIONS_QRC} "<RCC>\n\t<qresource prefix=\"/\">")
foreach(QM_FILE ${QM_FILES})
    get_filename_component(QM_FILE_NAME ${QM_FILE} NAME)
    file(APPEND ${TRANSLATIONS_QRC} "\n\t\t<file alias=\"${QM_FILE_NAME}\">${QM_FILE_NAME}</file>")
endforeach()
file(APPEND ${TRANSLATIONS_QRC} "\n\t</qresource>\n</RCC>")
list(APPEND QRC_FILES ${TRANSLATIONS_QRC})

# Resources
file(GLOB_RECURSE QRC_FILES "*.qrc")

# Compile resources
qt5_add_resources(QRC_SOURCES ${QRC_FILES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_SOURCES})

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Gui Qt5::Qml)

#example
set(INDUSTRIAL_CONTROLS_EXAMPLE false)
if(INDUSTRIAL_CONTROLS_EXAMPLE)
    add_subdirectory(example)
endif(INDUSTRIAL_CONTROLS_EXAMPLE)

# Set Windows export
add_definitions(-DINDUSTRIAL_CONTROLS_DLL)

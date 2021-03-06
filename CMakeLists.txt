# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Project
project(industrial_controls)

# Find QtCore module
find_package(Qt5 ${QT_REQUIRED_VERSION} CONFIG REQUIRED COMPONENTS
    Core Gui Qml Svg QuickControls2 LinguistTools
)

# Instruct CMake to run moc & rcc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# Target
add_library(${PROJECT_NAME} SHARED "")

# Qml import dirs
set (QML_IMPORT_PATH ${QML_IMPORT_PATH} ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "Qt Creator extra qml import paths" FORCE)

# Includes
target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}/includes")

# Sources
file(GLOB_RECURSE SOURCES "*.h" "*.hpp" "*.cpp")
target_sources(${PROJECT_NAME} PRIVATE ${SOURCES})

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
file(GLOB_RECURSE LOC_QRC_FILES "*.qrc")


# Compile resources
qt5_add_resources(QRC_SOURCES ${QRC_FILES} ${LOC_QRC_FILES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_SOURCES})

target_link_libraries(${PROJECT_NAME}
    PUBLIC Qt5::Core Qt5::Gui Qt5::Qml Qt5::Svg Qt5::QuickControls2
)

# Example
option(INDUSTRIAL_CONTROLS_EXAMPLE "Industrial Controls Example" TRUE)
if(INDUSTRIAL_CONTROLS_EXAMPLE)
    add_subdirectory(example)
endif(INDUSTRIAL_CONTROLS_EXAMPLE)

# Set Windows export
add_definitions(-DINDUSTRIAL_CONTROLS_DLL)

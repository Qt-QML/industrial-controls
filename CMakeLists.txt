# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Import path
set(INDUSTRIAL_IMPORT_PATH ${CMAKE_CURRENT_LIST_DIR})

# Add Qt Creator import path
set(QML_IMPORT_PATH ${INDUSTRIAL_IMPORT_PATH} CACHE TYPE STRING)
#set(QML2_IMPORT_PATH ${INDUSTRIAL_IMPORT_PATH} CACHE TYPE STRING)

# Industrial includes
set(INDUSTRIAL_INCLUDES "${INDUSTRIAL_IMPORT_PATH}/includes")

# Industrial sources & resources
file(GLOB_RECURSE INDUSTRIAL_SOURCES
    "${INDUSTRIAL_IMPORT_PATH}/includes/*.h"
    "${INDUSTRIAL_IMPORT_PATH}/sources/*.h"
    "${INDUSTRIAL_IMPORT_PATH}/sources/*.cpp"
)

# Industrial resources
file(GLOB_RECURSE INDUSTRIAL_RESOURCES
    "${INDUSTRIAL_IMPORT_PATH}/*.qrc"
)

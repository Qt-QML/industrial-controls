# CMake version string
cmake_minimum_required(VERSION 3.2.1)

# Import path
set(INDUSTRIAL_IMPORT_PATH ${CMAKE_CURRENT_LIST_DIR})

# Add Qt Creator import path
set(QML_IMPORT_PATH ${INDUSTRIAL_IMPORT_PATH} CACHE TYPE STRING)
#set(QML2_IMPORT_PATH ${INDUSTRIAL_IMPORT_PATH} CACHE TYPE STRING)

# Industrial sources-resources
set(INDUSTRIAL_SOURCES "${CMAKE_CURRENT_LIST_DIR}/industrial.qrc")

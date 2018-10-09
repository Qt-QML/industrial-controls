# industrial-controls
QML controls library, based on Qt Quick Controls 2.0 and designed for UAV and robotics control systems user interface.

### Usage
To use Industrial.Controls in your project, add this library to 3rd-party folder (git submodule is good practice).
Next, you should add some lines in to your CMakeLists.txt.

For sources & includes:

```
# Industrial.Controls vendor includes & sources
target_include_directories(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_INCLUDES})
target_sources(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_SOURCES})
```

For resources (old-style):

```
# Compile & add Industrial.Controls vendor resources
qt5_add_resources(QRC_SOURCES ${INDUSTRIAL_RESOURCES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_SOURCES})
```

For resources (new-style, with CMAKE_AUTORCC flag):

```
# Add Industrial.Controls vendor resources
target_sources(${PROJECT_NAME} PRIVATE ${INDUSTRIAL_SOURCES})
```

### Screenshots
![alt tag](https://github.com/DigitalAero/industrial-controls/blob/master/screenshots/buttons.png)
![alt tag](https://github.com/DigitalAero/industrial-controls/blob/master/screenshots/edits.png)
![alt tag](https://github.com/DigitalAero/industrial-controls/blob/master/screenshots/inputs.png)
![alt tag](https://github.com/DigitalAero/industrial-controls/blob/master/screenshots/misc.png)



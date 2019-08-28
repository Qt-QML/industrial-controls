import QtQuick 2.6

ShaderEffect {
    id: shader

    property color color: Theme.colors.negative
    property real size: 2

    property real _ratio: width * height / size
    property real _xFactor: _ratio / width
    property real _yFactor: _ratio / height

    fragmentShader:"
    varying highp vec2 qt_TexCoord0;
    uniform highp float _xFactor;
    uniform highp float _yFactor;
    uniform highp vec4 color;

    void main(void)
    {
        gl_FragColor = mix(vec4(0.0, 0.0, 0.0, 0.0), color,
                        cos(qt_TexCoord0.x * _yFactor + qt_TexCoord0.y * _xFactor));
    }"
}

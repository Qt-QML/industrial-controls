import QtQuick 2.6

ShaderEffect {
    id: shader

    property color color: theme.negativeColor
    property real ratio: width / height
    property real xFactor: theme.baseSize
    property real yFactor: theme.baseSize * ratio

    fragmentShader:"
    varying highp vec2 qt_TexCoord0;
    uniform highp float xFactor;
    uniform highp float yFactor;
    uniform highp vec4 color;

    void main(void)
    {
        gl_FragColor = mix(vec4(0.0, 0.0, 0.0, 0.0), color,
                        cos(qt_TexCoord0.x * yFactor + qt_TexCoord0.y * xFactor));
    }"
}

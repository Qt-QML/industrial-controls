// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Internal
#include "control_size_factory.h"
#include "palette_factory.h"

namespace
{
    const QString controlSize = "controlSize";
    const QString palette = "customPalette";
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("../../"));

    presentation::ControlSizeFactory controlSize;
    presentation::PaletteFactory palette;

    engine.rootContext()->setContextProperty(::controlSize,
                                             QVariant::fromValue(controlSize.createControlSize(36)));
    engine.rootContext()->setContextProperty(::palette,
                                             QVariant::fromValue(palette.createNightPalette()));

    engine.load(QStringLiteral("../Main.qml"));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}

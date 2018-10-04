// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Internal
#include "control_size_factory.h"
#include "palette_factory.h"
#include "component_cache_trimmer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("../../"));

    presentation::ControlSizeFactory controlSize;
    presentation::PaletteFactory palette;
    ComponentCacheTrimmer trimmer(&engine);

    engine.rootContext()->setContextProperty(QStringLiteral("controlSize"),
                                             QVariant::fromValue(controlSize.createControlSize(36)));
    engine.rootContext()->setContextProperty(QStringLiteral("customPalette"),
                                             QVariant::fromValue(palette.createNightPalette()));
    engine.rootContext()->setContextProperty(QStringLiteral("trimmer"),
                                             QVariant::fromValue(&trimmer));

    engine.load(QStringLiteral("../qml/Main.qml"));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}

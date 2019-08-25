// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Internal
#include "theme_configurator.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));


    ThemeConfigurator* themeConfigurator = new ThemeConfigurator(&app);
    engine.rootContext()->setContextProperty(QStringLiteral("themeConfigurator"),
                                             QVariant::fromValue(themeConfigurator));

    themeConfigurator->setPaletteStyle(ThemeConfigurator::Night);

    const char *qt_version = qVersion();


    engine.load(QStringLiteral("../qml/Main.qml"));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}

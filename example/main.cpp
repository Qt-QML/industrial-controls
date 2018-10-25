// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Internal
#include "theme.h"
#include "theme_configurator.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));

    qmlRegisterType<Theme>("Industrial", 1, 0, "Theme");

    ThemeConfigurator* themeConfigurator = new ThemeConfigurator(&app);
    engine.rootContext()->setContextProperty(QStringLiteral("themeConfigurator"),
                                             QVariant::fromValue(themeConfigurator));
    engine.rootContext()->setContextProperty(QStringLiteral("theme"),
                                             QVariant::fromValue(themeConfigurator->theme()));


    engine.load(QStringLiteral("../qml/Main.qml"));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}

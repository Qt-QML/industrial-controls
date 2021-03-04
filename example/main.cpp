#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "theme_loader.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<ThemeLoader>("Industrial.Controls", 1, 0, "ThemeLoader");

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));

    engine.load(QStringLiteral("../qml/Main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

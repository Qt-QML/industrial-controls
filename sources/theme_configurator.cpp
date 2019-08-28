#include "theme_configurator.h"

#include <QColor>
#include <QCoreApplication>
#include <QDebug>
#include <QQmlEngine>

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent)
{
}

void ThemeConfigurator::setTheme(QObject* theme)
{
    qDebug() << theme;
    //theme->setProperty("baseSize", QVariant(50));
}

static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("Industrial.Controls", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)




#include "theme_configurator.h"

// Qt
#include <QObject>
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
    //theme->setProperty("baseSize", QVariant(50));
}




static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("ThemeConfigurator", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)




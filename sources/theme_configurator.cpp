#include "theme_configurator.h"

#include <QColor>
#include <QCoreApplication>
#include <QDebug>
#include <QQmlEngine>

namespace
{
constexpr char rounding[] = "rounding";
constexpr char baseSize[] = "baseSize";
}

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent)
{
}

void ThemeConfigurator::setTheme(QObject* theme)
{
    if (m_theme == theme) return;

    m_theme = theme;
    if (!theme) return;

    m_rounding = theme->property(::rounding).toInt();
    m_baseSize = theme->property(::baseSize).toInt();

    this->configure();
}

void ThemeConfigurator::setRounding(int rounding)
{
    if (m_rounding == rounding) return;

    m_rounding = rounding;
    this->configure();
}

void ThemeConfigurator::setBaseSize(int baseSize)
{
    if (m_baseSize == baseSize) return;

    m_baseSize = baseSize;
    this->configure();
}

void ThemeConfigurator::configure()
{
    if (!m_theme) return;

    m_theme->setProperty(::rounding, m_rounding);
    m_theme->setProperty(::baseSize, m_baseSize);
}

static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("Industrial.Controls", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)




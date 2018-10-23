#include "theme_configurator.h"
#include "theme.h"

// Qt
#include <QDebug>

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent),
    m_theme(new Theme(this)),
    m_baseColor("#313238"),
    m_lightness(100)
{
    this->rebuild();
}

Theme* ThemeConfigurator::theme() const
{
    return m_theme;
}

QColor ThemeConfigurator::baseColor() const
{
    return m_baseColor;
}

QColor ThemeConfigurator::primaryColor() const
{
    return m_primaryColor;
}

float ThemeConfigurator::lightness() const
{
    return m_lightness;
}

void ThemeConfigurator::setBaseColor(QColor baseColor)
{
    if (m_baseColor == baseColor) return;

    m_baseColor = baseColor;
    emit baseColorChanged();
}

void ThemeConfigurator::setPrimaryColor(const QColor& primaryColor)
{
    if (m_primaryColor == primaryColor) return;

    m_primaryColor = primaryColor;
    emit primaryColorChanged();

    this->rebuild();
}

void ThemeConfigurator::setLightness(float lightness)
{
    if (qFuzzyCompare(m_lightness, lightness)) return;

    m_lightness = lightness;
    emit primaryColorChanged();

    this->rebuild();
}

void ThemeConfigurator::rebuild()
{
    m_theme->setBackgroundColor(m_baseColor.lighter(m_lightness));
    m_theme->setSurfaceColor(m_baseColor.lighter(m_lightness + 50));
    m_theme->setContainerColor(m_baseColor.lighter(m_lightness - 50));
    m_theme->setButtonColor(m_baseColor.lighter(m_lightness + 75));
}

#include "theme_configurator.h"
#include "theme.h"

// Qt
#include <QDebug>

namespace
{
    const int background = 60;
    const int surface = 100;
    const int container = 80;
    const int button = 140;

    const int tip = 60;
    const int selection = 100;
    const int highlight = 140;
}

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent),
    m_theme(new Theme(this)),
    m_baseColor("#37474f"),
    m_primaryColor("#31d0b3"),
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

int ThemeConfigurator::lightness() const
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

void ThemeConfigurator::setLightness(int lightness)
{
    if (m_lightness == lightness) return;

    m_lightness = lightness;
    emit primaryColorChanged();

    this->rebuild();
}

void ThemeConfigurator::rebuild()
{
    QColor base = m_baseColor.lighter(m_lightness);

    m_theme->setBackgroundColor(base.lighter(::background));
    m_theme->setSurfaceColor(base.lighter(::surface));
    m_theme->setContainerColor(base.lighter(::container));
    m_theme->setButtonColor(base.lighter(::button));

    m_theme->setTipColor(m_primaryColor.lighter(::tip));
    m_theme->setSelectionColor(m_primaryColor.lighter(::selection));
    m_theme->setHighlightColor(m_primaryColor.lighter(::highlight));
}

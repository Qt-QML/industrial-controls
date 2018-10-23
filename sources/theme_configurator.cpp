#include "theme_configurator.h"
#include "theme.h"

// Qt
#include <QDebug>

namespace
{
    const QColor baseColor = "#37474f";
    const QColor onBaseColor = "#fafafa";
    const QColor primaryColor = "#31d0b3";
    const QColor onPrimaryColor = "#161616";

    const int background = 60;
    const int surface = 100;
    const int container = 80;
    const int button = 140;

    const int disabled = 40;
    const int control = 120;

    const int tip = 80;
    const int selection = 100;
    const int highlight = 120;
}

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent),
    m_theme(new Theme(this)),
    m_baseColor(::baseColor),
    m_onBaseColor(::onBaseColor),
    m_primaryColor(::primaryColor),
    m_onPrimaryColor(::onPrimaryColor),
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

QColor ThemeConfigurator::onBaseColor() const
{
    return m_onBaseColor;
}

QColor ThemeConfigurator::primaryColor() const
{
    return m_primaryColor;
}

QColor ThemeConfigurator::onPrimaryColor() const
{
    return m_onPrimaryColor;
}

int ThemeConfigurator::lightness() const
{
    return m_lightness;
}

void ThemeConfigurator::setBaseColor(const QColor& baseColor)
{
    if (m_baseColor == baseColor) return;

    m_baseColor = baseColor;
    emit baseColorChanged();

    this->rebuild();
}

void ThemeConfigurator::setOnBaseColor(const QColor& fontColor)
{
    if (m_onBaseColor == fontColor) return;

    m_onBaseColor = fontColor;
    emit onBaseColorChanged();

    this->rebuild();
}

void ThemeConfigurator::setPrimaryColor(const QColor& primaryColor)
{
    if (m_primaryColor == primaryColor) return;

    m_primaryColor = primaryColor;
    emit primaryColorChanged();

    this->rebuild();
}

void ThemeConfigurator::setOnPrimaryColor(const QColor& onPrimaryColor)
{
    if (m_onPrimaryColor == onPrimaryColor) return;

    m_onPrimaryColor = onPrimaryColor;
    emit onPrimaryColorChanged();

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

    m_theme->setDisabledColor(base.lighter(::disabled));
    m_theme->setControlColor(base.lighter(::control));

    QColor onBase = m_onBaseColor.lighter(m_lightness + 40);
    m_theme->setOnBackgroundColor(onBase);
    m_theme->setOnSurfaceColor(onBase);
    m_theme->setOnContainerColor(onBase);
    m_theme->setOnButtonColor(onBase);

    m_theme->setTipColor(m_primaryColor.lighter(::tip));
    m_theme->setSelectionColor(m_primaryColor.lighter(::selection));
    m_theme->setHighlightColor(m_primaryColor.lighter(::highlight));

    m_theme->setOnTipColor(m_onPrimaryColor);
    m_theme->setOnSelectionColor(m_onPrimaryColor);
    m_theme->setOnHighlightColor(m_onPrimaryColor);
}

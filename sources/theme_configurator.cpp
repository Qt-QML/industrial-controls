#include "theme_configurator.h"

// Qt
#include <QDebug>

namespace
{
    const QColor baseColor = "#37474f";
    const QColor textBaseColor = "#fafafa";
    const QColor primaryColor = "#009688";
    const QColor textPrimaryColor = "#161616";
}

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent),
    m_baseColor(::baseColor),
    m_textBaseColor(::textBaseColor),
    m_primaryColor(::primaryColor),
    m_textPrimaryColor(::textPrimaryColor),
    m_lightness(1),
    m_rounding(10),
    m_baseSize(32)
{

}



QColor ThemeConfigurator::baseColor() const
{
    return m_baseColor;
}

QColor ThemeConfigurator::textBaseColor() const
{
    return m_textBaseColor;
}

QColor ThemeConfigurator::primaryColor() const
{
    return m_primaryColor;
}

QColor ThemeConfigurator::textPrimaryColor() const
{
    return m_textPrimaryColor;
}

double ThemeConfigurator::lightness() const
{
    return m_lightness;
}

int ThemeConfigurator::rounding() const
{
    return m_rounding;
}

int ThemeConfigurator::baseSize() const
{
    return m_baseSize;
}

void  ThemeConfigurator::setPaletteStyle(PaletteStyle paletteStyle)
{
    m_primaryColor = "#01c5a5";
    m_textPrimaryColor = "#000000";

    switch (paletteStyle) {
    case Day:
        m_baseColor = "#F5F5F5";
        m_textBaseColor = "#F5F5F5";
        break;
    case Night:
        m_baseColor = "#2d373e";
        m_textBaseColor = "#ffffff";
        break;
    }
    emit baseColorChanged();
    emit textBaseColorChanged();
}

void ThemeConfigurator::setBaseColor(const QColor& baseColor)
{
    if (m_baseColor == baseColor) return;

    m_baseColor = baseColor;
    emit baseColorChanged();
}

void ThemeConfigurator::setTextBaseColor(const QColor& fontColor)
{
    if (m_textBaseColor == fontColor) return;

    m_textBaseColor = fontColor;
    emit textBaseColorChanged();
}

void ThemeConfigurator::setPrimaryColor(const QColor& primaryColor)
{
    if (m_primaryColor == primaryColor) return;

    m_primaryColor = primaryColor;
    emit primaryColorChanged();
}

void ThemeConfigurator::setTextPrimaryColor(const QColor& textPrimaryColor)
{
    if (m_textPrimaryColor == textPrimaryColor) return;

    m_textPrimaryColor = textPrimaryColor;
    emit textPrimaryColorChanged();
}

void ThemeConfigurator::setLightness(double lightness)
{
    if (m_lightness == lightness) return;

    m_lightness = lightness;
    emit primaryColorChanged();
}

void ThemeConfigurator::setRounding(int rounding)
{
    if (m_rounding == rounding) return;

    m_rounding = rounding;
    emit roundingChanged();
}

void ThemeConfigurator::setBaseSize(int baseSize)
{
    if (m_baseSize == baseSize) return;

    m_baseSize = baseSize;
    emit baseSizeChanged();
}


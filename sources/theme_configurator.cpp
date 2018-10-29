#include "theme_configurator.h"
#include "theme.h"

// Qt
#include <QDebug>

namespace
{
    const QColor linkColor = "#51a0e7";
    const QColor baseColor = "#37474f";
    const QColor onBaseColor = "#fafafa";
    const QColor primaryColor = "#18c19d";
    const QColor onPrimaryColor = "#161616";

    const QColor positiveColor = "#86c34a";
    const QColor neutralColor = "#ff9800";
    const QColor negativeColor = "#e53535";

    const int background = 60;
    const int surface = 100;
    const int container = 80;
    const int button = 140;

    const int disabled = 40;
    const int control = 120;

    const int tip = 80;
    const int selection = 100;
    const int highlight = 120;

    const int underline = 2;
    const int shadowSize = 3;

    const float mainFontFactor = 2.0;
    const float auxFontFactor = 2.5;
    const float spacingFactor = 2.0;
    const float marginsFactor = 4.0;
    const float paddingFactor = 5.0;
    const float fillFactor = 8.0;
    const float handleSizeFactor = 1.5;
    const float floatSizeFactor = 0.75;

    const int animationTime = 100;
}

ThemeConfigurator::ThemeConfigurator(QObject* parent):
    QObject(parent),
    m_theme(new Theme(this)),
    m_baseColor(::baseColor),
    m_onBaseColor(::onBaseColor),
    m_primaryColor(::primaryColor),
    m_onPrimaryColor(::onPrimaryColor),
    m_lightness(100),
    m_rounding(4),
    m_baseSize(32)
{
    m_theme->setLinkColor(::linkColor);

    m_theme->setPositiveColor(::positiveColor);
    m_theme->setNeutralColorr(::neutralColor);
    m_theme->setNegativeColor(::negativeColor);

    m_theme->setUnderline(::underline);
    m_theme->setShadowSize(::shadowSize);

    m_theme->setAnimationTime(::animationTime);

    m_theme->setRounding(m_rounding);

    this->rebuildColors();
    this->rebuildSizes();
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

int ThemeConfigurator::rounding() const
{
    return m_rounding;
}

int ThemeConfigurator::baseSize() const
{
    return m_baseSize;
}

void ThemeConfigurator::setBaseColor(const QColor& baseColor)
{
    if (m_baseColor == baseColor) return;

    m_baseColor = baseColor;
    emit baseColorChanged();

    this->rebuildColors();
}

void ThemeConfigurator::setOnBaseColor(const QColor& fontColor)
{
    if (m_onBaseColor == fontColor) return;

    m_onBaseColor = fontColor;
    emit onBaseColorChanged();

    this->rebuildColors();
}

void ThemeConfigurator::setPrimaryColor(const QColor& primaryColor)
{
    if (m_primaryColor == primaryColor) return;

    m_primaryColor = primaryColor;
    emit primaryColorChanged();

    this->rebuildColors();
}

void ThemeConfigurator::setOnPrimaryColor(const QColor& onPrimaryColor)
{
    if (m_onPrimaryColor == onPrimaryColor) return;

    m_onPrimaryColor = onPrimaryColor;
    emit onPrimaryColorChanged();

    this->rebuildColors();
}

void ThemeConfigurator::setLightness(int lightness)
{
    if (m_lightness == lightness) return;

    m_lightness = lightness;
    emit primaryColorChanged();

    this->rebuildColors();
}

void ThemeConfigurator::setRounding(int rounding)
{
    if (m_rounding == rounding) return;

    m_rounding = rounding;
    emit roundingChanged();

    m_theme->setRounding(m_rounding);
}

void ThemeConfigurator::setBaseSize(int baseSize)
{
    if (m_baseSize == baseSize) return;

    m_baseSize = baseSize;
    emit baseSizeChanged();

    this->rebuildSizes();
}

void ThemeConfigurator::rebuildColors()
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

void ThemeConfigurator::rebuildSizes()
{
    m_theme->setBaseSize(m_baseSize);
    m_theme->setMainFontSize(m_baseSize / ::mainFontFactor);
    m_theme->setAuxFontSize(m_baseSize / ::auxFontFactor);
    m_theme->setSpacing(m_baseSize / ::spacingFactor);
    m_theme->setMargins(m_baseSize / ::marginsFactor);
    m_theme->setPadding(m_baseSize / ::paddingFactor);
    m_theme->setFill(m_baseSize / ::fillFactor);
    m_theme->setHandleSize(m_baseSize / ::handleSizeFactor);
    m_theme->setFloatButton(m_baseSize / ::floatSizeFactor);
}

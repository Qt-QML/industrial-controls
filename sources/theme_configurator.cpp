#include "theme_configurator.h"
#include "theme.h"

// Qt
#include <QDebug>

namespace
{
const QColor linkColor = "#51a0e7";
const QColor baseColor = "#37474f";
const QColor onBaseColor = "#fafafa";
const QColor primaryColor = "#009688";
const QColor onPrimaryColor = "#161616";

const QColor positiveColor = "#86c34a";
const QColor neutralColor = "#ff9800";
const QColor negativeColor = "#e53535";

const QColor shadowColor = "#80000000";

const int background = 60;
const int surface = 100;
const int container = 80;
const int button = 140;

const int disabled = 40;
const int control = 120;

const int tip = 80;
const int selection = 100;
const int highlight = 140;

const int scrollSize = 2;
const int underline = 2;
const int shadowSize = 3;

const float mainFontFactor = 2.0;
const float auxFontFactor = 2.5;
const float spacingFactor = 4.0;
const float marginsFactor = 4.0;
const float paddingFactor = 6.0;
const float iconFactor = 1.75;
const float fillFactor = 8.0;
const float handleSizeFactor = 1.5;
const float checkmarkFactor = 1.5;
const float floatFactor = 0.75;

const int animationTime = 100;
} // namespace

ThemeConfigurator::ThemeConfigurator(QObject* parent) :
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
    m_theme->colors()->setLink(::linkColor);

    m_theme->colors()->setPositive(::positiveColor);
    m_theme->colors()->setNeutral(::neutralColor);
    m_theme->colors()->setNegative(::negativeColor);

    m_theme->colors()->setShadow(::shadowColor);

    m_theme->setScrollSize(::scrollSize);
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

    Colors* colors = m_theme->colors();

    colors->setBackground(base.lighter(::background));
    colors->setSurface(base.lighter(::surface));
    colors->setContainer(base.lighter(::container));
    colors->setButton(base.lighter(::button));

    colors->setDisabled(base.lighter(::disabled));
    colors->setControl(base.lighter(::control));

    QColor onBase = m_onBaseColor.lighter(m_lightness + 40);
    colors->setOnBackground(onBase);
    colors->setOnSurface(onBase);
    colors->setOnContainer(onBase);
    colors->setOnButton(onBase);

    colors->setTip(m_primaryColor.lighter(::tip));
    colors->setSelection(m_primaryColor.lighter(::selection));
    colors->setHighlight(m_primaryColor.lighter(::highlight)); // highlight color darker

    colors->setOnTip(m_onBaseColor);
    colors->setOnSelection(m_onBaseColor);
    colors->setOnHighlight(m_onPrimaryColor);
}

void ThemeConfigurator::rebuildSizes()
{
    m_theme->setBaseSize(m_baseSize);
    m_theme->setMainFontSize(static_cast<int>(m_baseSize / ::mainFontFactor));
    m_theme->setAuxFontSize(static_cast<int>(m_baseSize / ::auxFontFactor));
    m_theme->setSpacing(static_cast<int>(m_baseSize / ::spacingFactor));
    m_theme->setMargins(static_cast<int>(m_baseSize / ::marginsFactor));
    m_theme->setPadding(static_cast<int>(m_baseSize / ::paddingFactor));
    m_theme->setIconSize(static_cast<int>(m_baseSize / ::iconFactor));
    m_theme->setFillSize(static_cast<int>(m_baseSize / ::fillFactor));
    m_theme->setHandleSize(static_cast<int>(m_baseSize / ::handleSizeFactor));
    m_theme->setCheckmarkSize(static_cast<int>(m_baseSize / ::checkmarkFactor));
    m_theme->setFloatSize(static_cast<int>(m_baseSize / ::floatFactor));
}

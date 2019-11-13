#include "theme_configurator.h"

#include <QColor>
#include <QCoreApplication>
#include <QDebug>
#include <QQmlEngine>

namespace
{
constexpr char rounding[] = "rounding";
constexpr char baseSize[] = "baseSize";
constexpr char animationTime[] = "animationTime";
constexpr char underline[] = "underline";
constexpr char scrollSize[] = "scrollSize";
constexpr char shadowSize[] = "shadowSize";

constexpr char spacing[] = "spacing";
constexpr char margins[] = "margins";
constexpr char padding[] = "padding";
constexpr char iconSize[] = "iconSize";
constexpr char fillSize[] = "fillSize";
constexpr char handleSize[] = "handleSize";
constexpr char checkmarkSize[] = "checkmarkSize";
constexpr char floatSize[] = "floatSize";
constexpr char mainFontSize[] = "mainFontSize";
constexpr char auxFontSize[] = "auxFontSize";

const double mainFontFactor = 2.0;
const double auxFontFactor = 2.5;
const double spacingFactor = 4.0;
const double marginsFactor = 4.0;
const double paddingFactor = 6.0;
const double iconFactor = 1.75;
const double fillFactor = 8.0;
const double handleSizeFactor = 1.5;
const double checkmarkFactor = 1.5;
const double floatFactor = 0.75;

// Colors
constexpr char colors[] = "colors";

constexpr char background[] = "background";
constexpr char sunken[] = "sunken";
constexpr char raised[] = "raised";
constexpr char text[] = "text";
constexpr char border[] = "border";

constexpr char disabled[] = "disabled";

constexpr char control[] = "control";
constexpr char controlText[] = "controlText";

constexpr char tip[] = "tip";
constexpr char tipText[] = "tipText";

constexpr char selection[] = "selection";
constexpr char selectedText[] = "selectedText";

constexpr char highlight[] = "highlight";
constexpr char highlightedText[] = "highlightedText";

constexpr char link[] = "link";
constexpr char positive[] = "positive";
constexpr char neutral[] = "neutral";
constexpr char negative[] = "negative";
constexpr char shadow[] = "shadow";


const QColor linkColor = "#51a0e7";
const QColor positiveColor = "#86c34a";
const QColor neutralColor = "#ff9800";
const QColor negativeColor = "#e53535";
const QColor shadowColor = "#80000000";

const QColor darkBackgroundColor = "#2c393f";
const QColor darkTextColor = "#ffffff";
const QColor darkSelectionColor = "#009688";
const QColor darkSelectedTextColor = "#000000";

const QColor brightBackgroundColor = "#f4f6f7";
const QColor brightTextColor = "#273339";
const QColor brightSelectionColor = "#20b2aa";
const QColor brightSelectedTextColor = "#ffffff";

const double brightRaisedFactor = 105;
const double brightSunkenFactor = 95;
const double brightDisabledFactor = 70;
const double brightControlFactor = 125;
const double brightBorderFactor = 135;

const double darkRaisedFactor = 115;
const double darkSunkenFactor = 85;
const double darkDisabledFactor = 50;
const double darkControlFactor = 150;
const double darkBorderFactor = 150;

} // namespace

ThemeConfigurator::ThemeConfigurator(QObject* parent) : QObject(parent)
{
}

void ThemeConfigurator::setTheme(QObject* theme)
{
    if (m_theme == theme)
        return;

    m_theme = theme;

    if (m_theme)
    {
        m_rounding = theme->property(::rounding).toInt();
        m_baseSize = theme->property(::baseSize).toInt();
    }
}

void ThemeConfigurator::setRounding(int rounding)
{
    if (m_rounding == rounding)
        return;

    m_rounding = rounding;
}

void ThemeConfigurator::setBaseSize(int baseSize)
{
    if (m_baseSize == baseSize)
        return;

    m_baseSize = baseSize;
}

void ThemeConfigurator::setDark(bool dark)
{
    m_dark = dark;
}

void ThemeConfigurator::configureSizes()
{
    if (!m_theme)
        return;

    m_theme->setProperty(::rounding, m_rounding);
    m_theme->setProperty(::baseSize, m_baseSize);
    m_theme->setProperty(::spacing, m_baseSize / ::spacingFactor);
    m_theme->setProperty(::margins, m_baseSize / ::marginsFactor);
    m_theme->setProperty(::padding, m_baseSize / ::paddingFactor);
    m_theme->setProperty(::iconSize, m_baseSize / ::iconFactor);
    m_theme->setProperty(::fillSize, m_baseSize / ::fillFactor);
    m_theme->setProperty(::handleSize, m_baseSize / ::handleSizeFactor);
    m_theme->setProperty(::checkmarkSize, m_baseSize / ::checkmarkFactor);
    m_theme->setProperty(::floatSize, m_baseSize / ::floatFactor);
    m_theme->setProperty(::mainFontSize, m_baseSize / ::mainFontFactor);
    m_theme->setProperty(::auxFontSize, m_baseSize / ::auxFontFactor);
}

void ThemeConfigurator::configureColors()
{
    if (!m_theme)
        return;

    QObject* colors = m_theme->property(::colors).value<QObject*>();
    if (!colors)
        return;

    // set theme base color
    if (m_dark)
    {
        colors->setProperty(::background, ::darkBackgroundColor);
        colors->setProperty(::text, ::darkTextColor);
        colors->setProperty(::selection, ::darkSelectionColor);
        colors->setProperty(::selectedText, ::darkSelectedTextColor);

        colors->setProperty(::disabled, ::darkTextColor.lighter(::darkDisabledFactor));
        colors->setProperty(::sunken, ::darkBackgroundColor.lighter(::darkSunkenFactor));
        colors->setProperty(::raised, ::darkBackgroundColor.lighter(::darkRaisedFactor));
        colors->setProperty(::control, ::darkBackgroundColor.lighter(::darkControlFactor));
        colors->setProperty(::border, ::darkBackgroundColor.lighter(::darkBorderFactor));
    }
    else
    {
        colors->setProperty(::background, ::brightBackgroundColor);
        colors->setProperty(::text, ::brightTextColor);
        colors->setProperty(::selection, ::brightSelectionColor);
        colors->setProperty(::selectedText, ::brightSelectedTextColor);

        colors->setProperty(::disabled, ::brightTextColor.lighter(::brightDisabledFactor));
        colors->setProperty(::sunken, ::brightBackgroundColor.lighter(::brightSunkenFactor));
        colors->setProperty(::raised, ::brightBackgroundColor.lighter(::brightRaisedFactor));
        colors->setProperty(::control, ::brightBackgroundColor.darker(::brightControlFactor));
        colors->setProperty(::border, ::brightBackgroundColor.darker(::brightBorderFactor));
    }

    // set other theme colors
    colors->setProperty(::controlText, m_dark ? darkTextColor : brightTextColor);
    colors->setProperty(::tip, m_dark ? darkSelectionColor : brightSelectionColor);
    colors->setProperty(::tipText, m_dark ? darkTextColor : brightTextColor);
    colors->setProperty(::highlight, m_dark ? darkSelectionColor : brightSelectionColor);
    colors->setProperty(::highlightedText, m_dark ? darkSelectedTextColor : brightSelectedTextColor);



    // set independent colors
    colors->setProperty(::link, ::linkColor);
    colors->setProperty(::positive, ::positiveColor);
    colors->setProperty(::neutral, ::neutralColor);
    colors->setProperty(::negative, ::negativeColor);
    colors->setProperty(::shadow, ::shadowColor);
}

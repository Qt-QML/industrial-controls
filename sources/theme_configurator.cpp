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

constexpr char disabled[] = "disabled";

constexpr char control[] = "control";
constexpr char controlText[] = "controlText";

constexpr char tip[] = "tip";
constexpr char tipText[] = "tipText";

constexpr char selection[] = "selection";
constexpr char selectedText[] = "selectedText";

constexpr char highlight[] = "highlight";
constexpr char highlightedText[] = "highlightedText";

const double raisedFactor = 150;
const double sunkenFactor = 125;
const double disabledFactor = 40;
const double controlFactor = 170;

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

const int darkThemeThreshold = 122;
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

        if (QObject* colors = m_theme->property(::colors).value<QObject*>())
        {
            m_backgroundColor = colors->property(::background).value<QColor>();
            m_textColor = colors->property(::text).value<QColor>();
            m_selectionColor = colors->property(::selection).value<QColor>();
            m_selectedTextColor = colors->property(::selectedText).value<QColor>();
        }
    }

    this->configure();
    this->configureColor();
}

void ThemeConfigurator::setRounding(int rounding)
{
    if (m_rounding == rounding)
        return;

    m_rounding = rounding;
    this->configure();
}

void ThemeConfigurator::setBaseSize(int baseSize)
{
    if (m_baseSize == baseSize)
        return;

    m_baseSize = baseSize;
    this->configure();
}

void ThemeConfigurator::configure()
{
    if (!m_theme)
        return;

    m_theme->setProperty(::rounding, m_rounding);
    m_theme->setProperty(::baseSize, m_baseSize);
    m_theme->setProperty(::spacing, m_baseSize / ::spacingFactor);
    m_theme->setProperty(::padding, m_baseSize / ::paddingFactor);
    m_theme->setProperty(::iconSize, m_baseSize / ::iconFactor);
    m_theme->setProperty(::fillSize, m_baseSize / ::fillFactor);
    m_theme->setProperty(::handleSize, m_baseSize / ::handleSizeFactor);
    m_theme->setProperty(::checkmarkSize, m_baseSize / ::checkmarkFactor);
    m_theme->setProperty(::floatSize, m_baseSize / ::floatFactor);
    m_theme->setProperty(::mainFontSize, m_baseSize / ::mainFontFactor);
    m_theme->setProperty(::auxFontSize, m_baseSize / ::auxFontFactor);
}

bool ThemeConfigurator::isDark()
{
    if (!m_theme)
        return false;

    QObject* colors = m_theme->property(::colors).value<QObject*>();
    if (!colors)
        return false;

    QColor backroundColor = colors->property(::background).value<QColor>();

    return backroundColor.black() > ::darkThemeThreshold;
}

void ThemeConfigurator::setBackgroundColor(const QColor& color)
{
    if (m_backgroundColor == color)
        return;

    m_backgroundColor = color;
    this->configureColor();
}

void ThemeConfigurator::setTextColor(const QColor& color)
{
    if (m_textColor == color)
        return;

    m_textColor = color;
    this->configureColor();
}

void ThemeConfigurator::setSelectionColor(const QColor& color)
{
    if (m_selectionColor == color)
        return;

    m_selectionColor = color;
    this->configureColor();
}

void ThemeConfigurator::setSelectionTextColor(const QColor& color)
{
    if (m_selectedTextColor == color)
        return;

    m_selectedTextColor = color;
    this->configureColor();
}

void ThemeConfigurator::configureColor()
{
    if (!m_theme)
        return;

    QObject* colors = m_theme->property(::colors).value<QObject*>();
    if (!colors)
        return;



    // set base color
    colors->setProperty(::background, m_backgroundColor);
    colors->setProperty(::text, m_textColor);
    colors->setProperty(::selection, m_selectionColor);
    colors->setProperty(::selectedText, m_selectedTextColor);


    // set darkWhite dependencies colors
    bool isDarkTheme = m_backgroundColor.black() > ::darkThemeThreshold;
    if(isDarkTheme)
    {
        colors->setProperty(::sunken, m_backgroundColor.lighter(::sunkenFactor));

        colors->setProperty(::raised, m_backgroundColor.lighter(::raisedFactor));

        colors->setProperty(::disabled, m_textColor.lighter(::disabledFactor));

        colors->setProperty(::control, m_backgroundColor.lighter(::controlFactor));
    }
    else
    {
        colors->setProperty(::sunken, m_backgroundColor.darker(::sunkenFactor - 10));

        colors->setProperty(::raised, m_backgroundColor.darker(::raisedFactor));

        colors->setProperty(::disabled, m_textColor.darker(::disabledFactor));

        colors->setProperty(::control, m_backgroundColor.darker(::controlFactor + 20));
    }

    // set other colors
    colors->setProperty(::controlText, m_textColor);

    colors->setProperty(::tip, m_selectionColor);
    colors->setProperty(::tipText, m_textColor);

    colors->setProperty(::highlight, m_selectionColor);
    colors->setProperty(::highlightedText, m_selectedTextColor);

    colors->setProperty(::link, linkColor);
    colors->setProperty(::positive, positiveColor);
    colors->setProperty(::neutral, neutralColor);
    colors->setProperty(::negative, negativeColor);
    colors->setProperty(::shadow, shadowColor);
}

static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("Industrial.Controls", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)

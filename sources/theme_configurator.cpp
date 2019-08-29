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
    const double marginsFactor= 4.0;
    const double paddingFactor = 6.0;
    const double iconFactor = 1.75;
    const double fillFactor = 8.0;
    const double handleSizeFactor= 1.5;
    const double checkmarkFactor = 1.5;
    const double floatFactor = 0.75;


    // Color part
    constexpr char colorPropertyName[] = "colors";

    constexpr char lightness[] = "lightness";
    constexpr char baseColor[] = "baseColor";
    constexpr char textBaseColor[] = "textBaseColor";
    constexpr char primaryColor[] = "primaryColor";
    constexpr char textPrimaryColor[] = "textPrimaryColor";

    constexpr char background[] = "background";
    constexpr char sunken[] = "sunken";
    constexpr char raised[] = "raised";
    constexpr char disabled[] = "disabled";
    constexpr char control[] = "control";
    constexpr char text[] = "text";

    constexpr char textSunken[] = "textSunken";
    constexpr char textRaised[] = "textRaised";

    constexpr char button[] = "textSunken";
    constexpr char buttonText[] = "textRaised";

    constexpr char tip[] = "textSunken";
    constexpr char tipText[] = "textRaised";

    constexpr char selection[] = "textSunken";
    constexpr char selectionText[] = "textRaised";

    constexpr char highlight[] = "textSunken";
    constexpr char highlightText[] = "textRaised";



    const double backgroundFactor = 60;
    const double raisedFactor = 100;
    const double sunkenFactor = 80;
    const double buttonFactor = 140;
    const double disabledFactor = 40;

    const double tipFactor = 80;
    const double selectionFactor = 100;
    const double highlightFactor = 140;
    const double controlFactor = 120;
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

void ThemeConfigurator::setLightness(double lightness)
{
    if (m_lightness == lightness*100) return;

    m_lightness == lightness*100;
    this->configureColor();
}

void ThemeConfigurator::setBaseColor(QColor color)
{
    if (m_baseColor == color) return;

    m_baseColor = color;
    this->configureColor();
}


void ThemeConfigurator::setTextBaseColor(QColor color)
{
    if (m_textBaseColor == color) return;

    m_textBaseColor = color;
    this->configureColor();
}

void ThemeConfigurator::setPrimaryColor(QColor color)
{
    if (m_primaryColor == color) return;

    m_primaryColor = color;
    this->configureColor();
}

void ThemeConfigurator::setTextPrimaryColor(QColor color)
{
    if (m_textPrimarySize == color) return;

    m_textPrimarySize = color;
    this->configureColor();
}

void ThemeConfigurator::configureColor()
{
    if (!m_theme) return;
    QObject* colorObj = m_theme->property(colorPropertyName).value<QObject*>();
    if(!colorObj) return;

    colorObj->setProperty(::lightness, m_lightness / 100);
    colorObj->setProperty(::baseColor, m_baseColor);
    colorObj->setProperty(::textBaseColor, m_textBaseColor);
    colorObj->setProperty(::primaryColor, m_primaryColor);
    colorObj->setProperty(::textPrimaryColor, m_textPrimarySize);


    colorObj->setProperty(::background,
                          m_baseColor.lighter(m_lightness).lighter(::backgroundFactor));
    colorObj->setProperty(::sunken,
                          m_baseColor.lighter(m_lightness).lighter(::sunkenFactor));
    colorObj->setProperty(::raised,
                          m_baseColor.lighter(m_lightness).lighter(::raisedFactor));
    colorObj->setProperty(::disabled,
                          m_baseColor.lighter(m_lightness).lighter(::disabledFactor));
    colorObj->setProperty(::control,
                          m_baseColor.lighter(m_lightness).lighter(::controlFactor));


}




static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("Industrial.Controls", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)




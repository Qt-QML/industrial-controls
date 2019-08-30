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
constexpr char disabled[] = "disabled";
constexpr char control[] = "control";
constexpr char text[] = "text";
constexpr char controlText[] = "controlText";

// property color tip: "#009688" // Фон подсказки
// property color tipText: "#ffffff" // Текст подсказки

// property color selection: "#009688" // Фон выделения
// property color selectedText: "#000000" // Текст выделения

// property color highlight : "#19d6c4" // Фон подсветки (при активации)
// property color highlightedText : "#000000" // Текст подсветки

// property color link: "#51a0e7" // Ссылка (на фоне окна, утопленных и возвышенных элементов)
// property color positive : "#86c34a" // Позитивный (текст и предупреждения)

// property color neutral: "#ff9800" // Нейтральный (текст и предупреждения)
// property color negative : "#e53535" // Негативный (текст и предупреждения)
//  property color shadow : "#80000000" // Тень

const double backgroundFactor = 60;
const double raisedFactor = 100;
const double sunkenFactor = 80;
const double buttonFactor = 140;
const double disabledFactor = 40;

const double tipFactor = 80;
const double selectionFactor = 100;
const double highlightFactor = 140;
const double controlFactor = 120;
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
            //m_primaryColor = theme->property(::pr).value<QColor>();
        }
    }

    this->configure();
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

void ThemeConfigurator::setBaseColor(const QColor& color)
{
    if (m_baseColor == color)
        return;

    m_baseColor = color;
    this->configureColor();
}

void ThemeConfigurator::setTextBaseColor(const QColor& color)
{
    if (m_textBaseColor == color)
        return;

    m_textBaseColor = color;
    this->configureColor();
}

void ThemeConfigurator::setPrimaryColor(const QColor& color)
{
    if (m_primaryColor == color)
        return;

    m_primaryColor = color;
    this->configureColor();
}

void ThemeConfigurator::setTextPrimaryColor(const QColor& color)
{
    if (m_textPrimarySize == color)
        return;

    m_textPrimarySize = color;
    this->configureColor();
}

void ThemeConfigurator::configureColor()
{
    if (!m_theme)
        return;

    QObject* colors = m_theme->property(::colors).value<QObject*>();
    if (!colors)
        return;

    //    colors->setProperty(::background,
    //                          m_baseColor.lighter(m_lightness).lighter(::backgroundFactor));
    //    colors->setProperty(::sunken, m_baseColor.lighter(m_lightness).lighter(::sunkenFactor));
    //    colors->setProperty(::raised, m_baseColor.lighter(m_lightness).lighter(::raisedFactor));
    //    colors->setProperty(::disabled, m_baseColor.lighter(m_lightness).lighter(::disabledFactor));
    //    colors->setProperty(::control, m_baseColor.lighter(m_lightness).lighter(::controlFactor));
}

static void registerThemeTypes()
{
    qmlRegisterType<ThemeConfigurator>("Industrial.Controls", 1, 0, "ThemeConfigurator");
}

Q_COREAPP_STARTUP_FUNCTION(registerThemeTypes)

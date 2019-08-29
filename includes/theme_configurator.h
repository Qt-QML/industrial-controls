#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QObject>
#include <QColor>

class ThemeConfigurator: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QObject* theme WRITE setTheme)

public:
    explicit ThemeConfigurator(QObject* parent = nullptr);

public slots:
    void setTheme(QObject* theme);

    void setRounding(int rounding);
    void setBaseSize(int baseSize);
    void configure();


    void setLightness(double lightness);
    void setBaseColor(QColor color);
    void setTextBaseColor(QColor color);
    void setPrimaryColor(QColor color);
    void setTextPrimaryColor(QColor color);
    void configureColor();

private:
    QObject* m_theme = nullptr;

    int m_rounding = 0;
    int m_baseSize = 0;

    QColor m_baseColor = "#ffffff";
    QColor m_textBaseColor = "#ffffff";
    QColor m_primaryColor = "#ffffff";
    QColor m_textPrimarySize = "#ffffff";
    double m_lightness = 100;
};

#endif // THEME_CONFIGURATOR_H

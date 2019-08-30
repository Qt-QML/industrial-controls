#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QColor>
#include <QObject>

class ThemeConfigurator : public QObject
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

    void setBaseColor(const QColor& color);
    void setTextBaseColor(const QColor& color);
    void setPrimaryColor(const QColor& color);
    void setTextPrimaryColor(const QColor& color);
    void configureColor();

private:
    QObject* m_theme = nullptr;

    int m_rounding = 0;
    int m_baseSize = 0;

    QColor m_baseColor;
    QColor m_textBaseColor;
    QColor m_primaryColor;
    QColor m_textPrimarySize;
};

#endif // THEME_CONFIGURATOR_H

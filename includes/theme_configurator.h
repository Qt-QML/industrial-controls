#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

#include "export.h"

#include <QColor>
#include <QObject>

class INDUSTRIAL_CONTROLS_EXPORT ThemeConfigurator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QObject* theme WRITE setTheme)

public:
    explicit ThemeConfigurator(QObject* parent = nullptr);

public slots:
    void setTheme(QObject* theme);

    void setRounding(int rounding);
    void setBaseSize(int baseSize);
    virtual void configureSizes();

    void setBackgroundColor(const QColor& color);
    void setTextColor(const QColor& color);
    void setSelectionColor(const QColor& color);
    void setSelectionTextColor(const QColor& color);
    virtual void configureColors();

protected:
    QObject* m_theme = nullptr;

private:
    int m_rounding = 0;
    int m_baseSize = 0;

    QColor m_backgroundColor;
    QColor m_textColor;
    QColor m_selectionColor;
    QColor m_selectedTextColor;
};

#endif // THEME_CONFIGURATOR_H

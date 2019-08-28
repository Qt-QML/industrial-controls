#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QObject>

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

private:
    QObject* m_theme = nullptr;

    int m_rounding = 0;
    int m_baseSize = 0;
};

#endif // THEME_CONFIGURATOR_H

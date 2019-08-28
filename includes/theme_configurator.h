#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QObject>
#include <QColor>

class Theme;

class ThemeConfigurator: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QObject* theme WRITE setTheme)


public:
    explicit ThemeConfigurator(QObject* parent = nullptr);



public slots:
    void setTheme(QObject* theme);

};





#endif // THEME_CONFIGURATOR_H

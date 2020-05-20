#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

#include "export.h"

#include <QColor>
#include <QObject>
#include <QJsonObject>

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
    void configureSizes();

    void setDark(bool dark);
    void configureColors();

    void configureThemeFromConfig();
    void configureColorsFromConfig();

    void setPathToConfig(const QString &path);

    void saveThemeToJson();

protected:
    QObject* m_theme = nullptr;

private:
    int m_rounding = 0;
    int m_baseSize = 0;
    bool m_dark = false;
    QString m_pathToConfig;

    bool checkConfig();
    QJsonObject saveObjectToJson(QObject* obj);
    QJsonDocument loadJson(QString fileName);
    void saveJson(QJsonDocument document, QString fileName);
};

#endif // THEME_CONFIGURATOR_H

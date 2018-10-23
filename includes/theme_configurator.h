#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QObject>
#include <QColor>

class Theme;

class ThemeConfigurator: public QObject
{
    Q_OBJECT

    Q_PROPERTY(Theme* theme READ theme CONSTANT)

    Q_PROPERTY(QColor baseColor READ baseColor WRITE setBaseColor NOTIFY baseColorChanged)
    Q_PROPERTY(QColor primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(int lightness READ lightness WRITE setLightness NOTIFY lightnessChanged)

public:
    explicit ThemeConfigurator(QObject* parent = nullptr);

    Theme* theme() const;

    QColor baseColor() const;
    QColor primaryColor() const;
    int lightness() const;

public slots:
    void setBaseColor(QColor baseColor);
    void setPrimaryColor(const QColor& primaryColor);
    void setLightness(int lightness);

    void rebuild();

signals:
    void baseColorChanged();
    void primaryColorChanged();
    void lightnessChanged();

private:
    Theme* const m_theme;
    QColor m_baseColor;
    QColor m_primaryColor;
    int m_lightness;
};

#endif // THEME_CONFIGURATOR_H

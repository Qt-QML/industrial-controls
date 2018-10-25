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
    Q_PROPERTY(QColor onBaseColor READ onBaseColor WRITE setOnBaseColor NOTIFY onBaseColorChanged)
    Q_PROPERTY(QColor primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(QColor onPrimaryColor READ onPrimaryColor WRITE setOnPrimaryColor NOTIFY onPrimaryColorChanged)
    Q_PROPERTY(int lightness READ lightness WRITE setLightness NOTIFY lightnessChanged)

    Q_PROPERTY(int baseSize READ baseSize WRITE setBaseSize NOTIFY baseSizeChanged)

public:
    explicit ThemeConfigurator(QObject* parent = nullptr);

    Theme* theme() const;

    QColor baseColor() const;
    QColor onBaseColor() const;
    QColor primaryColor() const;
    QColor onPrimaryColor() const;
    int lightness() const;

    int baseSize() const;

public slots:
    void setBaseColor(const QColor& baseColor);
    void setOnBaseColor(const QColor& onBaseColor);
    void setPrimaryColor(const QColor& primaryColor);
    void setOnPrimaryColor(const QColor& onPrimaryColor);
    void setLightness(int lightness);

    void setBaseSize(int baseSize);

    void rebuildColors();
    void rebuildSizes();

signals:
    void baseColorChanged();
    void onBaseColorChanged();
    void primaryColorChanged();
    void onPrimaryColorChanged();
    void lightnessChanged();
    void baseSizeChanged();

private:
    Theme* const m_theme;
    QColor m_baseColor;
    QColor m_onBaseColor;
    QColor m_primaryColor;
    QColor m_onPrimaryColor;
    int m_lightness;
    int m_baseSize;
};

#endif // THEME_CONFIGURATOR_H

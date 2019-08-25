#ifndef THEME_CONFIGURATOR_H
#define THEME_CONFIGURATOR_H

// Qt
#include <QObject>
#include <QColor>

class Theme;

class ThemeConfigurator: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor baseColor READ baseColor WRITE setBaseColor NOTIFY baseColorChanged)
    Q_PROPERTY(QColor textBaseColor READ textBaseColor WRITE setTextBaseColor NOTIFY textBaseColorChanged)
    Q_PROPERTY(QColor primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(QColor textPrimaryColor READ textPrimaryColor WRITE setTextPrimaryColor NOTIFY textPrimaryColorChanged)

    Q_PROPERTY(double lightness READ lightness WRITE setLightness NOTIFY lightnessChanged)
    Q_PROPERTY(int rounding READ rounding WRITE setRounding NOTIFY roundingChanged)
    Q_PROPERTY(int baseSize READ baseSize WRITE setBaseSize NOTIFY baseSizeChanged)

public:
    enum PaletteStyle
    {
        Night,
        Day
    };

    explicit ThemeConfigurator(QObject* parent = nullptr);

    Theme* theme() const;

    QColor baseColor() const;
    QColor textBaseColor() const;
    QColor primaryColor() const;
    QColor textPrimaryColor() const;

    double lightness() const;
    int rounding() const;
    int baseSize() const;

public slots:
    void setPaletteStyle(PaletteStyle paletteStyle);


    void setBaseColor(const QColor& baseColor);
    void setTextBaseColor(const QColor& onBaseColor);
    void setPrimaryColor(const QColor& primaryColor);
    void setTextPrimaryColor(const QColor& textPrimaryColor);

    void setLightness(double lightness);
    void setRounding(int rounding);
    void setBaseSize(int baseSize);

signals:
    void baseColorChanged();
    void textBaseColorChanged();
    void primaryColorChanged();
    void textPrimaryColorChanged();

    void lightnessChanged();
    void roundingChanged();
    void baseSizeChanged();

private:

    QColor m_baseColor;
    QColor m_textBaseColor;
    QColor m_primaryColor;
    QColor m_textPrimaryColor;

    double m_lightness;
    int m_rounding;
    int m_baseSize;
};

#endif // THEME_CONFIGURATOR_H

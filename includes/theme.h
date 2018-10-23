#ifndef THEME_H
#define THEME_H

// Qt
#include <QObject>
#include <QColor>

class Theme: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor backgroundColor MEMBER m_backgroundColor NOTIFY backgroundColorChanged)
    Q_PROPERTY(QColor onBackgroundColor MEMBER m_onBackgroundColor NOTIFY onBackgroundColorChanged)
    Q_PROPERTY(QColor surfaceColor MEMBER m_surfaceColor NOTIFY surfaceColorChanged)
    Q_PROPERTY(QColor onSurfaceColor MEMBER m_onSurfaceColor NOTIFY onSurfaceColorChanged)
    Q_PROPERTY(QColor containerColor MEMBER m_containerColor NOTIFY containerColorChanged)
    Q_PROPERTY(QColor onContainerColor MEMBER m_onContainerColor NOTIFY onContainerColorChanged)
    Q_PROPERTY(QColor buttonColor MEMBER m_buttonColor NOTIFY buttonColorChanged)
    Q_PROPERTY(QColor onButtonColor MEMBER m_onButtonColor NOTIFY onButtonColorChanged)
    Q_PROPERTY(QColor tipColor MEMBER m_tipColor NOTIFY tipColorChanged)
    Q_PROPERTY(QColor onTipColor MEMBER m_onTipColor NOTIFY onTipColorChanged)
    Q_PROPERTY(QColor selectionColor MEMBER m_selectionColor NOTIFY selectionColorChanged)
    Q_PROPERTY(QColor onSelectionColor MEMBER m_onSelectionColor NOTIFY onSelectionColorChanged)
    Q_PROPERTY(QColor highlightColor MEMBER m_highlightColor NOTIFY highlightColorChanged)
    Q_PROPERTY(QColor onHighlightColor MEMBER m_onHighlightColor NOTIFY onHighlightColorChanged)

    Q_PROPERTY(QColor controlColor MEMBER m_controlColor NOTIFY controlColorChanged)

    Q_PROPERTY(QColor positiveColor MEMBER m_positiveColor NOTIFY positiveColorChanged)
    Q_PROPERTY(QColor neutralColor MEMBER m_neutralColor NOTIFY neutralColorChanged)
    Q_PROPERTY(QColor negativeColor MEMBER m_negativeColor NOTIFY negativeColorChanged)

public:
    explicit Theme(QObject* parent = nullptr);

public slots:
    void setBackgroundColor(const QColor& backgroundColor);
    void setOnBackgroundColor(const QColor& onBackgroundColor);
    void setSurfaceColor(const QColor& surfaceColor);
    void setOnSurfaceColor(const QColor& onSurfaceColor);
    void setContainerColor(const QColor& containerColor);
    void setOnContainerColor(const QColor& onContainerColor);
    void setButtonColor(const QColor& buttonColor);
    void setOnButtonColor(const QColor& onButtonColor);
    void setTipColor(const QColor& tipColor);
    void setOnTipColor(const QColor& onTipColor);
    void setSelectionColor(const QColor& selectionColor);
    void setOnSelectionColor(const QColor& onSelectionColor);
    void setHighlightColor(const QColor& highlightColor);
    void setOnHighlightColor(const QColor& onHighlightColor);

    void setControlColor(const QColor& controlColor);

    void setPositiveColor(const QColor& positiveColor);
    void setNeutralColorr(const QColor& neutralColor);
    void setNegativeColor(const QColor& negativeColor);

signals:
    void backgroundColorChanged();
    void onBackgroundColorChanged();
    void surfaceColorChanged();
    void onSurfaceColorChanged();
    void containerColorChanged();
    void onContainerColorChanged();
    void buttonColorChanged();
    void onButtonColorChanged();
    void tipColorChanged();
    void onTipColorChanged();
    void selectionColorChanged();
    void onSelectionColorChanged();
    void highlightColorChanged();
    void onHighlightColorChanged();

    void controlColorChanged();

    void positiveColorChanged();
    void neutralColorChanged();
    void negativeColorChanged();

private:
    QColor m_backgroundColor;
    QColor m_onBackgroundColor;
    QColor m_surfaceColor;
    QColor m_onSurfaceColor;
    QColor m_containerColor;
    QColor m_onContainerColor;
    QColor m_buttonColor;
    QColor m_onButtonColor;
    QColor m_tipColor;
    QColor m_onTipColor;
    QColor m_selectionColor;
    QColor m_onSelectionColor;
    QColor m_highlightColor;
    QColor m_onHighlightColor;

    QColor m_controlColor;

    QColor m_positiveColor;
    QColor m_neutralColor;
    QColor m_negativeColor;
};

#endif // PALETTE_H

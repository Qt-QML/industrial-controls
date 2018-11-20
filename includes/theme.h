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
    Q_PROPERTY(QColor disabledColor MEMBER m_disabledColor NOTIFY disabledColorChanged)
    Q_PROPERTY(QColor linkColor MEMBER m_linkColor NOTIFY linkColorChanged)

    Q_PROPERTY(QColor positiveColor MEMBER m_positiveColor NOTIFY positiveColorChanged)
    Q_PROPERTY(QColor neutralColor MEMBER m_neutralColor NOTIFY neutralColorChanged)
    Q_PROPERTY(QColor negativeColor MEMBER m_negativeColor NOTIFY negativeColorChanged)

    Q_PROPERTY(int baseSize MEMBER m_baseSize NOTIFY baseSizeChanged)
    Q_PROPERTY(int spacing MEMBER m_spacing NOTIFY spacingChanged)
    Q_PROPERTY(int margins MEMBER m_margins NOTIFY marginsChanged)
    Q_PROPERTY(int padding MEMBER m_padding NOTIFY paddingChanged)
    Q_PROPERTY(int rounding MEMBER m_rounding NOTIFY roundingChanged)
    Q_PROPERTY(int underline MEMBER m_underline NOTIFY underlineChanged)
    Q_PROPERTY(int iconSize MEMBER m_iconSize NOTIFY iconSizeChanged)
    Q_PROPERTY(int fillSize MEMBER m_fillSize NOTIFY fillSizeChanged)
    Q_PROPERTY(int handleSize MEMBER m_handleSize NOTIFY handleSizeChanged)
    Q_PROPERTY(int checkmarkSize MEMBER m_checkmarkSize NOTIFY checkmarkSizeChanged)
    Q_PROPERTY(int floatSize MEMBER m_floatSize NOTIFY floatSizeChanged)
    Q_PROPERTY(int shadowSize MEMBER m_shadowSize NOTIFY shadowSizeChanged)

    Q_PROPERTY(int mainFontSize MEMBER m_mainFontSize NOTIFY mainFontSizeChanged)
    Q_PROPERTY(int auxFontSize MEMBER m_auxFontSize NOTIFY auxFontSizeChanged)

    Q_PROPERTY(int animationTime MEMBER m_animationTime NOTIFY animationTimeChanged)

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
    void setDisabledColor(const QColor& disabledColor);
    void setLinkColor(const QColor& linkColor);

    void setPositiveColor(const QColor& positiveColor);
    void setNeutralColorr(const QColor& neutralColor);
    void setNegativeColor(const QColor& negativeColor);

    void setBaseSize(int baseSize);
    void setSpacing(int spacing);
    void setMargins(int margins);
    void setPadding(int padding);
    void setRounding(int rounding);
    void setUnderline(int underline);
    void setIconSize(int iconSize);
    void setFillSize(int fillSize);
    void setHandleSize(int handleSize);
    void setCheckmarkSize(int checkmarkSize);
    void setFloatSize(int floatSize);
    void setShadowSize(int shadowSize);

    void setMainFontSize(int mainFontSize);
    void setAuxFontSize(int auxFontSize);

    void setAnimationTime(int animationTime);

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
    void disabledColorChanged();
    void linkColorChanged();

    void positiveColorChanged();
    void neutralColorChanged();
    void negativeColorChanged();

    void baseSizeChanged();
    void spacingChanged();
    void marginsChanged();
    void paddingChanged();
    void roundingChanged();
    void underlineChanged();
    void iconSizeChanged();
    void fillSizeChanged();
    void handleSizeChanged();
    void checkmarkSizeChanged();
    void floatSizeChanged();
    void shadowSizeChanged();

    void mainFontSizeChanged();
    void auxFontSizeChanged();

    void animationTimeChanged();

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
    QColor m_disabledColor;
    QColor m_linkColor;

    QColor m_positiveColor;
    QColor m_neutralColor;
    QColor m_negativeColor;

    int m_baseSize;
    int m_spacing;
    int m_margins;
    int m_padding;
    int m_rounding;
    int m_underline;
    int m_iconSize;
    int m_fillSize;
    int m_handleSize;
    int m_checkmarkSize;
    int m_floatSize;
    int m_shadowSize;

    int m_mainFontSize;
    int m_auxFontSize;

    int m_animationTime;
};

#endif // PALETTE_H

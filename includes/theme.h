#ifndef THEME_H
#define THEME_H

// Internal
#include "colors.h"

class Theme : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Colors* colors READ colors CONSTANT)

    //Q_PROPERTY(int baseSize MEMBER m_baseSize NOTIFY baseSizeChanged)
    Q_PROPERTY(int spacing MEMBER m_spacing NOTIFY spacingChanged)
    Q_PROPERTY(int margins MEMBER m_margins NOTIFY marginsChanged)
    Q_PROPERTY(int padding MEMBER m_padding NOTIFY paddingChanged)
    //Q_PROPERTY(int rounding MEMBER m_rounding NOTIFY roundingChanged)
    Q_PROPERTY(int underline MEMBER m_underline NOTIFY underlineChanged)
    Q_PROPERTY(int iconSize MEMBER m_iconSize NOTIFY iconSizeChanged)
    Q_PROPERTY(int fillSize MEMBER m_fillSize NOTIFY fillSizeChanged)
    Q_PROPERTY(int scrollSize MEMBER m_scrollSize NOTIFY scrollSizeChanged)
    Q_PROPERTY(int handleSize MEMBER m_handleSize NOTIFY handleSizeChanged)
    Q_PROPERTY(int checkmarkSize MEMBER m_checkmarkSize NOTIFY checkmarkSizeChanged)
    Q_PROPERTY(int floatSize MEMBER m_floatSize NOTIFY floatSizeChanged)
    Q_PROPERTY(int shadowSize MEMBER m_shadowSize NOTIFY shadowSizeChanged)

    Q_PROPERTY(int mainFontSize MEMBER m_mainFontSize NOTIFY mainFontSizeChanged)
    Q_PROPERTY(int auxFontSize MEMBER m_auxFontSize NOTIFY auxFontSizeChanged)

    Q_PROPERTY(int animationTime MEMBER m_animationTime NOTIFY animationTimeChanged)

public:
    explicit Theme(QObject* parent = nullptr);

    Colors* colors();

public slots:
    void setBaseSize(int baseSize);
    void setSpacing(int spacing);
    void setMargins(int margins);
    void setPadding(int padding);
    void setRounding(int rounding);
    void setUnderline(int underline);
    void setIconSize(int iconSize);
    void setFillSize(int fillSize);
    void setScrollSize(int scrollSize);
    void setHandleSize(int handleSize);
    void setCheckmarkSize(int checkmarkSize);
    void setFloatSize(int floatSize);
    void setShadowSize(int shadowSize);

    void setMainFontSize(int mainFontSize);
    void setAuxFontSize(int auxFontSize);

    void setAnimationTime(int animationTime);

signals:
    void baseSizeChanged();
    void spacingChanged();
    void marginsChanged();
    void paddingChanged();
    void roundingChanged();
    void underlineChanged();
    void iconSizeChanged();
    void fillSizeChanged();
    void scrollSizeChanged();
    void handleSizeChanged();
    void checkmarkSizeChanged();
    void floatSizeChanged();
    void shadowSizeChanged();

    void mainFontSizeChanged();
    void auxFontSizeChanged();

    void animationTimeChanged();

private:
    Colors m_colors;

    int m_baseSize;
    int m_spacing;
    int m_margins;
    int m_padding;
    int m_rounding;
    int m_underline;
    int m_iconSize;
    int m_fillSize;
    int m_scrollSize;
    int m_handleSize;
    int m_checkmarkSize;
    int m_floatSize;
    int m_shadowSize;

    int m_mainFontSize;
    int m_auxFontSize;

    int m_animationTime;
};

#endif // THEME_H

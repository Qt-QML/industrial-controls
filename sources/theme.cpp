#include "theme.h"

Theme::Theme(QObject* parent):
    QObject(parent)
{}

Colors* Theme::colors()
{
    return &m_colors;
}

void Theme::setBaseSize(int baseSize)
{
    m_baseSize = baseSize;
    emit baseSizeChanged();
}

void Theme::setSpacing(int spacing)
{
    m_spacing = spacing;
    emit spacingChanged();
}

void Theme::setMargins(int margins)
{
    m_margins = margins;
    emit marginsChanged();
}

void Theme::setPadding(int padding)
{
    m_padding = padding;
    emit paddingChanged();
}

void Theme::setRounding(int rounding)
{
    m_rounding = rounding;
    emit roundingChanged();
}

void Theme::setUnderline(int underline)
{
    m_underline = underline;
    emit underlineChanged();
}

void Theme::setIconSize(int iconSize)
{
    m_iconSize = iconSize;
    emit iconSizeChanged();
}

void Theme::setFillSize(int fillSize)
{
    m_fillSize = fillSize;
    emit fillSizeChanged();
}

void Theme::setScrollSize(int scrollSize)
{
    m_scrollSize = scrollSize;
    emit scrollSizeChanged();
}

void Theme::setHandleSize(int handleSize)
{
    m_handleSize = handleSize;
    emit handleSizeChanged();
}

void Theme::setCheckmarkSize(int checkmarkSize)
{
    m_checkmarkSize = checkmarkSize;
    emit checkmarkSizeChanged();
}

void Theme::setFloatSize(int floatSize)
{
    m_floatSize = floatSize;
    emit floatSizeChanged();
}

void Theme::setShadowSize(int shadowSize)
{
    m_shadowSize = shadowSize;
    emit shadowSizeChanged();
}

void Theme::setMainFontSize(int mainFontSize)
{
    m_mainFontSize = mainFontSize;
    emit mainFontSizeChanged();
}

void Theme::setAuxFontSize(int auxFontSize)
{
    m_auxFontSize = auxFontSize;
    emit auxFontSizeChanged();
}

void Theme::setAnimationTime(int animationTime)
{
    m_animationTime = animationTime;
    emit animationTimeChanged();
}

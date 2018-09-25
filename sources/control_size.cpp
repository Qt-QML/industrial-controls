#include "control_size.h"

using namespace presentation;

int ControlSize::baseSize() const
{
    return m_baseSize;
}

void ControlSize::setBaseSize(int baseSize)
{
    m_baseSize = baseSize;
}

int ControlSize::inputControlHeight() const
{
    return m_inputControlHeight;
}

void ControlSize::setInputControlHeight(int inputControlHeight)
{
    m_inputControlHeight = inputControlHeight;
}

int ControlSize::fontSize() const
{
    return m_fontSize;
}

void ControlSize::setFontSize(int fontSize)
{
    m_fontSize = fontSize;
}

int ControlSize::secondaryFontSize() const
{
    return m_secondaryFontSize;
}

void ControlSize::setSecondaryFontSize(int secondaryFontSize)
{
    m_secondaryFontSize = secondaryFontSize;
}

int ControlSize::spacing() const
{
    return m_spacing;
}

void ControlSize::setSpacing(int spacing)
{
    m_spacing = spacing;
}

int ControlSize::margins() const
{
    return m_margins;
}

void ControlSize::setMargins(int margins)
{
    m_margins = margins;
}

int ControlSize::padding() const
{
    return m_padding;
}

void ControlSize::setPadding(int padding)
{
    m_padding = padding;
}

int ControlSize::shadowSize() const
{
    return m_shadowSize;
}

void ControlSize::setShadowSize(int shadowSize)
{
    m_shadowSize = shadowSize;
}

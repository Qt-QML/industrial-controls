#include "colors.h"

Colors::Colors(QObject* parent):
    QObject(parent)
{}

void Colors::setBackground(const QColor& background)
{
    m_background = background;
    emit backgroundChanged();
}

void Colors::setOnBackground(const QColor& onBackground)
{
    m_onBackground = onBackground;
    emit onBackgroundChanged();
}

void Colors::setSurface(const QColor& surface)
{
    m_surface = surface;
    emit surfaceChanged();
}

void Colors::setOnSurface(const QColor& onSurface)
{
    m_onSurface = onSurface;
    emit onSurfaceChanged();
}

void Colors::setContainer(const QColor& container)
{
    m_container = container;
    emit containerChanged();
}

void Colors::setOnContainer(const QColor& onContainer)
{
    m_onContainer = onContainer;
    emit onContainerChanged();
}

void Colors::setButton(const QColor& button)
{
    m_button = button;
    emit buttonChanged();
}

void Colors::setOnButton(const QColor& onButton)
{
    m_onButton = onButton;
    emit onButtonChanged();
}

void Colors::setTip(const QColor& tip)
{
    m_tip = tip;
    emit tipChanged();
}

void Colors::setOnTip(const QColor& onTip)
{
    m_onTip = onTip;
    emit onTipChanged();
}

void Colors::setSelection(const QColor& selection)
{
    m_selection = selection;
    emit selectionChanged();
}

void Colors::setOnSelection(const QColor& onSelection)
{
    m_onSelection = onSelection;
    emit onSelectionChanged();
}

void Colors::setHighlight(const QColor& highlight)
{
    m_highlight = highlight;
    emit highlightChanged();
}

void Colors::setOnHighlight(const QColor& onHighlight)
{
    m_onHighlight = onHighlight;
    emit onHighlightChanged();
}

void Colors::setControl(const QColor& control)
{
    m_control = control;
    emit controlChanged();
}

void Colors::setDisabled(const QColor& disabled)
{
    m_disabled = disabled;
    emit disabledChanged();
}

void Colors::setLink(const QColor& link)
{
    m_link = link;
    emit linkChanged();
}

void Colors::setPositive(const QColor& positive)
{
    m_positive = positive;
    emit positiveChanged();
}

void Colors::setNeutral(const QColor& neutral)
{
    m_neutral = neutral;
    emit neutralChanged();
}

void Colors::setNegative(const QColor& negative)
{
    m_negative = negative;
    emit negativeChanged();
}

#include "theme.h"

Theme::Theme(QObject* parent):
    QObject(parent)
{}

void Theme::setBackgroundColor(const QColor& backgroundColor)
{
    m_backgroundColor = backgroundColor;
    emit backgroundColorChanged();
}

void Theme::setOnBackgroundColor(const QColor& onBackgroundColor)
{
    m_onBackgroundColor = onBackgroundColor;
    emit onBackgroundColorChanged();
}

void Theme::setSurfaceColor(const QColor& surfaceColor)
{
    m_surfaceColor = surfaceColor;
    emit surfaceColorChanged();
}

void Theme::setOnSurfaceColor(const QColor& onSurfaceColor)
{
    m_onSurfaceColor = onSurfaceColor;
    emit onSurfaceColorChanged();
}

void Theme::setContainerColor(const QColor& containerColor)
{
    m_containerColor = containerColor;
    emit containerColorChanged();
}

void Theme::setOnContainerColor(const QColor& onContainerColor)
{
    m_onContainerColor = onContainerColor;
    emit onContainerColorChanged();
}

void Theme::setButtonColor(const QColor& buttonColor)
{
    m_buttonColor = buttonColor;
    emit buttonColorChanged();
}

void Theme::setOnButtonColor(const QColor& onButtonColor)
{
    m_onButtonColor = onButtonColor;
    emit onButtonColorChanged();
}

void Theme::setTipColor(const QColor& tipColor)
{
    m_tipColor = tipColor;
    emit tipColorChanged();
}

void Theme::setOnTipColor(const QColor& onTipColor)
{
    m_onTipColor = onTipColor;
    emit onTipColorChanged();
}

void Theme::setSelectionColor(const QColor& selectionColor)
{
    m_selectionColor = selectionColor;
    emit selectionColorChanged();
}

void Theme::setOnSelectionColor(const QColor& onSelectionColor)
{
    m_onSelectionColor = onSelectionColor;
    emit onSelectionColorChanged();
}

void Theme::setHighlightColor(const QColor& highlightColor)
{
    m_highlightColor = highlightColor;
    emit highlightColorChanged();
}

void Theme::setOnHighlightColor(const QColor& onHighlightColor)
{
    m_onHighlightColor = onHighlightColor;
    emit onHighlightColorChanged();
}

void Theme::setControlColor(const QColor& controlColor)
{
    m_controlColor = controlColor;
    emit controlColorChanged();
}

void Theme::setDisabledColor(const QColor& disabledColor)
{
    m_disabledColor = disabledColor;
    emit disabledColorChanged();
}

void Theme::setPositiveColor(const QColor& positiveColor)
{
    m_positiveColor = positiveColor;
    emit positiveColorChanged();
}

void Theme::setNeutralColorr(const QColor& neutralColor)
{
    m_neutralColor = neutralColor;
    emit neutralColorChanged();
}

void Theme::setNegativeColor(const QColor& negativeColor)
{
    m_negativeColor = negativeColor;
    emit negativeColorChanged();
}

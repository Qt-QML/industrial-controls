#include "svg_item.h"

#include <QSvgRenderer>

namespace
{
const QString qrc = "qrc";
const QString colon = ":";
const QString slash = "/";

const QStringList colors = { "white", "#ffffff" };

QString formatSource(QString source)
{
    if (source.startsWith(qrc))
        source.remove(0, 3);

    if (source.startsWith(slash))
        source = colon + source;

    return source;
}
} // namespace

SvgItem::SvgItem(QQuickItem* parent) : QQuickPaintedItem(parent), m_color(Qt::white)
{
}

void SvgItem::paint(QPainter* painter)
{
    if (m_renderer)
    {
        m_renderer->render(painter);
    }
}

QString SvgItem::source() const
{
    return m_source;
}

QColor SvgItem::color() const
{
    return m_color;
}

void SvgItem::setSource(const QString& source)
{
    if (m_source == source)
        return;

    m_source = source;

    this->prerender();
    emit sourceChanged(m_source);
}

void SvgItem::setColor(const QColor& color)
{
    if (m_color == color)
        return;

    m_color = color;

    this->prerender();
    emit colorChanged(m_color);
}

void SvgItem::prerender()
{
    if (m_renderer)
    {
        delete m_renderer;
        m_renderer = nullptr;
    }

    if (m_source.isEmpty())
        return;

    QFile file(::formatSource(m_source));
    if (!file.open(QIODevice::ReadOnly))
        return;

    QString content = file.readAll();
    if (content.isEmpty())
        return;

    for (const QString& color : ::colors)
    {
        content = content.replace(color, m_color.name());
    }

    m_renderer = new QSvgRenderer(content.toLocal8Bit(), this);
    this->update();
}

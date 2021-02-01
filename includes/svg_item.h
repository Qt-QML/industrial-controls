#ifndef SVG_ITEM_H
#define SVG_ITEM_H

#include "export.h"

#include <QColor>
#include <QQuickPaintedItem>

class QSvgRenderer;

class INDUSTRIAL_CONTROLS_EXPORT SvgItem : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)

public:
    explicit SvgItem(QQuickItem* parent = nullptr);

    void paint(QPainter* painter) override;

    QString source() const;
    QColor color() const;

public slots:
    void setSource(const QString& source);
    void setColor(const QColor& color);

signals:
    void sourceChanged(QUrl source);
    void colorChanged(QColor color);

protected:
    virtual void prerender();

private:
    QSvgRenderer* m_renderer = nullptr;
    QString m_source;
    QColor m_color;
};

#endif // SVG_ITEM_H

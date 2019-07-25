#ifndef COLORS_H
#define COLORS_H

// Qt
#include "export.h"
#include <QColor>
#include <QObject>

class INDUSTRIAL_CONTROLS_EXPORT Colors : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor background MEMBER m_background NOTIFY backgroundChanged)
    Q_PROPERTY(QColor onBackground MEMBER m_onBackground NOTIFY onBackgroundChanged)
    Q_PROPERTY(QColor surface MEMBER m_surface NOTIFY surfaceChanged)
    Q_PROPERTY(QColor onSurface MEMBER m_onSurface NOTIFY onSurfaceChanged)
    Q_PROPERTY(QColor container MEMBER m_container NOTIFY containerChanged)
    Q_PROPERTY(QColor onContainer MEMBER m_onContainer NOTIFY onContainerChanged)
    Q_PROPERTY(QColor button MEMBER m_button NOTIFY buttonChanged)
    Q_PROPERTY(QColor onButton MEMBER m_onButton NOTIFY onButtonChanged)
    Q_PROPERTY(QColor tip MEMBER m_tip NOTIFY tipChanged)
    Q_PROPERTY(QColor onTip MEMBER m_onTip NOTIFY onTipChanged)
    Q_PROPERTY(QColor selection MEMBER m_selection NOTIFY selectionChanged)
    Q_PROPERTY(QColor onSelection MEMBER m_onSelection NOTIFY onSelectionChanged)
    Q_PROPERTY(QColor highlight MEMBER m_highlight NOTIFY highlightChanged)
    Q_PROPERTY(QColor onHighlight MEMBER m_onHighlight NOTIFY onHighlightChanged)

    Q_PROPERTY(QColor control MEMBER m_control NOTIFY controlChanged)
    Q_PROPERTY(QColor disabled MEMBER m_disabled NOTIFY disabledChanged)
    Q_PROPERTY(QColor link MEMBER m_link NOTIFY linkChanged)

    Q_PROPERTY(QColor positive MEMBER m_positive NOTIFY positiveChanged)
    Q_PROPERTY(QColor neutral MEMBER m_neutral NOTIFY neutralChanged)
    Q_PROPERTY(QColor negative MEMBER m_negative NOTIFY negativeChanged)

    Q_PROPERTY(QColor shadow MEMBER m_shadow NOTIFY shadowChanged)

public:
    explicit Colors(QObject* parent = nullptr);

public slots:
    void setBackground(const QColor& background);
    void setOnBackground(const QColor& onBackground);
    void setSurface(const QColor& surface);
    void setOnSurface(const QColor& onSurface);
    void setContainer(const QColor& container);
    void setOnContainer(const QColor& onContainer);
    void setButton(const QColor& button);
    void setOnButton(const QColor& onButton);
    void setTip(const QColor& tip);
    void setOnTip(const QColor& onTip);
    void setSelection(const QColor& selection);
    void setOnSelection(const QColor& onSelection);
    void setHighlight(const QColor& highlight);
    void setOnHighlight(const QColor& onHighlight);

    void setControl(const QColor& control);
    void setDisabled(const QColor& disabled);
    void setLink(const QColor& link);

    void setPositive(const QColor& positive);
    void setNeutral(const QColor& neutral);
    void setNegative(const QColor& negative);

    void setShadow(const QColor& shadow);

signals:
    void backgroundChanged();
    void onBackgroundChanged();
    void surfaceChanged();
    void onSurfaceChanged();
    void containerChanged();
    void onContainerChanged();
    void buttonChanged();
    void onButtonChanged();
    void tipChanged();
    void onTipChanged();
    void selectionChanged();
    void onSelectionChanged();
    void highlightChanged();
    void onHighlightChanged();

    void controlChanged();
    void disabledChanged();
    void linkChanged();

    void positiveChanged();
    void neutralChanged();
    void negativeChanged();

    void shadowChanged();

private:
    QColor m_background;
    QColor m_onBackground;
    QColor m_surface;
    QColor m_onSurface;
    QColor m_container;
    QColor m_onContainer;
    QColor m_button;
    QColor m_onButton;
    QColor m_tip;
    QColor m_onTip;
    QColor m_selection;
    QColor m_onSelection;
    QColor m_highlight;
    QColor m_onHighlight;

    QColor m_control;
    QColor m_disabled;
    QColor m_link;

    QColor m_positive;
    QColor m_neutral;
    QColor m_negative;

    QColor m_shadow;
};

#endif // COLORS_H

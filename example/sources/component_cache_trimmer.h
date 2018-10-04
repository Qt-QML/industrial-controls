#ifndef COMPONENT_CACHE_TRIMMER_H
#define COMPONENT_CACHE_TRIMMER_H

// Qt
#include <QObject>

class QQmlEngine;

class ComponentCacheTrimmer : public QObject
{
    Q_OBJECT

public:
    explicit ComponentCacheTrimmer(QQmlEngine* engine);

public slots:
    void trim();

private:
    QQmlEngine* m_engine;
};

#endif //COMPONENT_CACHE_TRIMMER_H

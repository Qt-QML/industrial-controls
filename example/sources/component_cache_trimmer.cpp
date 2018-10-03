#include "component_cache_trimmer.h"

// Qt
#include <QQmlEngine>
#include <QDebug>

ComponentCacheTrimmer::ComponentCacheTrimmer(QQmlEngine* engine):
    QObject(engine),
    m_engine(engine)
{}

void ComponentCacheTrimmer::trim()
{
    m_engine->clearComponentCache();
}

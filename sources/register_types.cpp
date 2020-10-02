#include "file_browser_model.h"

#include <QCoreApplication>
#include <QQmlEngine>

#define QML_TYPE(T) qmlRegisterType<T>("Industrial", 1, 0, #T);

static void registerTypes()
{
    QML_TYPE(FileBrowserModel)
}

Q_COREAPP_STARTUP_FUNCTION(registerTypes)

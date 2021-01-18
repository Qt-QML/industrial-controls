#include <QCoreApplication>
#include <QQmlEngine>

#include "file_browser_model.h"
#include "svg_item.h"

#define QML_TYPE(T) qmlRegisterType<T>("Industrial", 1, 0, #T);

static void registerTypes()
{
    QML_TYPE(FileBrowserModel);
    QML_TYPE(SvgItem);
}

Q_COREAPP_STARTUP_FUNCTION(registerTypes)

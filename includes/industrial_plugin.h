#ifndef INDUSTRIAL_PLUGIN_H
#define INDUSTRIAL_PLUGIN_H

#include <QQmlExtensionPlugin>

class IndustrialPlugin: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "digital.aero.Industrial")

public:
    void registerTypes(const char* uri);
};

#endif // INDUSTRIAL_PLUGIN_H

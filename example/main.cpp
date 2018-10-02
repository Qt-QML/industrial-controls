// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Internal
#include "control_size.h"
#include "palette.h"

namespace
{
    const QString controlSize = "controlSize";
    const QString palette = "customPalette";

    const QString industrialControlsPath = "qrc:/";
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath(::industrialControlsPath);

    presentation::Palette palette;
    palette.setTrackColor("#64adf6");
    palette.setMissionColor("#1ce9a5");
    palette.setActiveMissionColor("#fd00fd");

    palette.setLinkColor("#64adf6");

    palette.setDangerColor("#e53535");
    palette.setCautionColor("#ff9800");
    palette.setPositiveColor("#86c34a");
    palette.setBalloonColor("#e8ece8");
    palette.setBalloonTextColor("#000000");

    palette.setSkyColor("#00d4ff");
    palette.setGroundColor("#7b4837");

    palette.setSunkenColor("#102027");
    palette.setBackgroundColor("#2d373e");
    palette.setRaisedColor("#37474f");
    palette.setControlColor("#4f5b62");
    palette.setButtonColor("#607C88");

    palette.setTextColor("#ffffff");
    palette.setSecondaryTextColor("#e0e0e0");
    palette.setSelectedTextColor("#000000");

    palette.setHighlightColor("#02eec8");
    palette.setSelectionColor("#00c98f");

    presentation::ControlSize controlSize;
    controlSize.setBaseSize(36);
    controlSize.setInputControlHeight(42);
    controlSize.setFontSize(22);
    controlSize.setSecondaryFontSize(18);
    controlSize.setSpacing(20);
    controlSize.setMargins(12);
    controlSize.setPadding(8);
    controlSize.setShadowSize(3);

    engine.rootContext()->setContextProperty(::palette, QVariant::fromValue(palette));
    engine.rootContext()->setContextProperty(::controlSize, QVariant::fromValue(controlSize));

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}

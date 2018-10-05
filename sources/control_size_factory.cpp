#include "control_size_factory.h"

using namespace presentation;

ControlSize ControlSizeFactory::createControlSize(int baseSize)
{
    ControlSize controlSize;

    controlSize.setBaseSize(baseSize);
    controlSize.setInputControlHeight(baseSize * 1.25);
    controlSize.setFontSize(baseSize / 2);
    controlSize.setSecondaryFontSize(controlSize.fontSize() * 0.75);
    controlSize.setSpacing(baseSize / 2);
    controlSize.setMargins(baseSize / 4);
    controlSize.setPadding(baseSize / 6);
    controlSize.setRounding(6);
    controlSize.setUnderline(2);
    controlSize.setShadowSize(3);

    return controlSize;
}

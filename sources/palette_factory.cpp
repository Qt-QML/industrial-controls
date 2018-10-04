#include "palette_factory.h"

using namespace presentation;

Palette PaletteFactory::createDayPalette()
{
    Palette palette = this->defaultPalette();

    palette.setSkyColor("#00d4ff");
    palette.setGroundColor("#4bda63");

    palette.setSunkenColor("#B0BEC5");
    palette.setBackgroundColor("#F5F5F5");
    palette.setRaisedColor("#ECEFF1");
    palette.setControlColor("#CFD8DC");
    palette.setButtonColor("#CFD8DC");

    palette.setTextColor("#202020");
    palette.setSecondaryTextColor("#546e7a");
    palette.setSelectedTextColor("#ffffff");

    palette.setHighlightColor("#00c98f");
    palette.setSelectionColor("#02eec8");

    return palette;
}

Palette PaletteFactory::createNightPalette()
{
    Palette palette = this->defaultPalette();

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

    return palette;
}

Palette PaletteFactory::defaultPalette()
{
    Palette palette;

    palette.setTrackColor("#64adf6");
    palette.setMissionColor("#1ce9a5");
    palette.setActiveMissionColor("#fd00fd");

    palette.setLinkColor("#64adf6");

    palette.setDangerColor("#e53535");
    palette.setCautionColor("#ff9800");
    palette.setPositiveColor("#86c34a");
    palette.setBalloonColor("#e8ece8");
    palette.setBalloonTextColor("#000000");

    return palette;
}

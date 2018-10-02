#ifndef PALETTE_FACTORY_H
#define PALETTE_FACTORY_H

#include "palette.h"

namespace presentation
{
    class PaletteFactory
    {
    public:
        Palette createDayPalette();
        Palette createNightPalette();

    private:
        Palette defaultPalette();
    };
}

#endif // PALETTE_FACTORY_H

#ifndef CONTROL_SIZE_FACTORY_H
#define CONTROL_SIZE_FACTORY_H

// Internal
#include "control_size.h"

namespace presentation
{
    class ControlSizeFactory
    {
    public:
        ControlSize createControlSize(int baseSize);
    };
}

#endif // CONTROL_SIZE_FACTORY_H

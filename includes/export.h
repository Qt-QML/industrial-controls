#ifndef INDUSTRIAL_CONTROLS_EXPORT_H
#define INDUSTRIAL_CONTROLS_EXPORT_H

#ifdef _WIN32
#if defined INDUSTRIAL_CONTROLS_DLL
#define INDUSTRIAL_CONTROLS_EXPORT __declspec(dllexport)
#else
#define INDUSTRIAL_CONTROLS_EXPORT __declspec(dllimport)
#endif
#else
#define INDUSTRIAL_CONTROLS_EXPORT
#endif

#endif
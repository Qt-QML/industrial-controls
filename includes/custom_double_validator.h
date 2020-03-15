#ifndef CUSTOM_DOUBLE_VALIDATOR_H
#define CUSTOM_DOUBLE_VALIDATOR_H

#include "export.h"

#include <QDebug>
#include <QDoubleValidator>

class CustomDoubleValidator : public QDoubleValidator
{
public:
    CustomDoubleValidator(QObject* parent = nullptr);
    CustomDoubleValidator(double bottom, double top, int decimals, QObject* parent);
    QValidator::State validate(QString& s, int& pos) const override;
};

#endif // CUSTOM_DOUBLE_VALIDATOR_H

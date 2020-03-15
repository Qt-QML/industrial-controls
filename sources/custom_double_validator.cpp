#include "custom_double_validator.h"
#include <QCoreApplication>
#include <QQmlEngine>

void registerCustomDoubleValidator()
{
    qmlRegisterType<CustomDoubleValidator>("Industrial.Controls", 1, 0, "CustomDoubleValidator");
}

Q_COREAPP_STARTUP_FUNCTION(registerCustomDoubleValidator)

CustomDoubleValidator::CustomDoubleValidator(QObject* parent) : QDoubleValidator(parent)
{
}
CustomDoubleValidator::CustomDoubleValidator(double bottom, double top, int decimals,
                                             QObject* parent) :
    QDoubleValidator(bottom, top, decimals, parent)
{
}

QValidator::State CustomDoubleValidator::validate(QString& s, int& pos) const
{
    if (s.isEmpty() || (s.startsWith("-") && s.length() == 1))
    {
        // allow empty field or standalone minus sign
        return QValidator::Intermediate;
    }
    // check length of decimal places
    QChar point = this->locale().decimalPoint();
    if (s.indexOf(point) != -1)
    {
        int lengthDecimals = s.length() - s.indexOf(point) - 1;
        if (lengthDecimals > decimals())
        {
            return QValidator::Invalid;
        }
    }
    // check range of value
    bool isNumber;
    double value = locale().toDouble(s, &isNumber);
    if (isNumber && this->bottom() <= value && value <= this->top())
    {
        return QValidator::Acceptable;
    }
    return QValidator::Invalid;
}

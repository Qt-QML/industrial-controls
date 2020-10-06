.pragma library

function stringToReal(str, decimalPoint) {
    if (decimalPoint !== ".") return parseFloat(str.replace(decimalPoint, "."));
    return parseFloat(str);
}

function realToString(num, decimalPoint) {
    var str = num.toString();
    if (decimalPoint !== ".") return str.replace(".", decimalPoint);
    return str;
}

function pad(num, size) {
    var str = num.toString();
    while (str.length < size) str = "0" + str;
    return str;
}

function padReal(num, sizeBefore, sizeAfter, decimalPoint) {
    var split = realToString(num, decimalPoint).split(decimalPoint, 2);

    return pad(split.length > 0 ? split[0] : 0, sizeBefore) + decimalPoint +
            pad(split.length > 1 ? split[1] : 0, sizeBefore);
}

function degreesToDms(degrees, lng, secondsPrecision) {
    var sign = degrees < 0 ? -1 : 1
    var abs = Math.abs(degrees);
    var deg = Math.floor(abs);
    var frac = (abs - deg) * 60;

    if (Math.ceil(frac) - frac <= Math.pow(10, -7)) frac = Math.ceil(frac);

    var min = Math.floor(frac);
    var sec = (frac - min) * 60;

    var degLimit = (lng ? 180 : 90);
    if (deg > degLimit) deg = degLimit;

    return {
        sign: sign,
        deg: deg,
        min: min,
        sec: sec.toFixed(secondsPrecision)
    }
}

function degreesToDmsString(degrees, lng, secondsPrecision) {
    if (isNaN(degrees)) return "-"
    var dms = degreesToDms(degrees, lng, secondsPrecision);
    return pad(dms.deg, lng ? 3 : 2) + "\u00B0" + pad(dms.min, 2) + "\'" +
            pad(dms.sec, 3 + secondsPrecision) + "\"" +
            (dms.sign < 0 ? lng ? qsTr("W") : qsTr("S") : lng ? qsTr("E") : qsTr("N"));
}

function dmsToDegree(sign, deg, min, sec) {
    return sign * (deg + min / 60.0 + sec / 3600.0);
}

function roundTo125(value)
{
    var magnitude = Math.floor(Math.log(value) / Math.LN10);
    value /= Math.pow(10.0, magnitude);

    if (value < 2.0)
        value = 1.0;
    else if (value < 5.0)
        value = 2.0;
    else if (value < 10.0)
        value = 5.0;
    else
        value = 10.0;
    value *= Math.pow(10.0, magnitude);
    return value;
}

#include "theme_loader.h"

#include <QColor>
#include <QDebug>
#include <QFile>
#include <QJsonParseError>
#include <QQmlEngine>

namespace
{
constexpr char night[] = "night";
constexpr char baseSize[] = "baseSize";
constexpr char scrollInteractive[] = "scrollInteractive";
constexpr char animationTime[] = "animationTime";
constexpr char dayColors[] = "dayColors";
constexpr char nightColors[] = "nightColors";
constexpr char factors[] = "factors";

constexpr char nightPath[] = "night";
constexpr char baseSizePath[] = "base_size";
constexpr char scrollInteractivePath[] = "scroll_interactive";
constexpr char animationTimePath[] = "animation_time";
constexpr char commonColorsPath[] = "colors_common";
constexpr char dayColorsPath[] = "colors_day";
constexpr char nightColorsPath[] = "colors_night";
constexpr char factorsPath[] = "factors";

QVariantMap propertiesFromObject(QObject* object)
{
    QVariantMap properties;

    auto meta = object->metaObject();
    for (int i = meta->propertyOffset(); i < meta->propertyCount(); ++i)
    {
        properties.insert(meta->property(i).name(), meta->property(i).read(object));
    }

    return properties;
}

void propertiesToObject(QObject* object, const QVariantMap& properties)
{
    auto meta = object->metaObject();

    for (int i = meta->propertyOffset(); i < meta->propertyCount(); ++i)
    {
        if (properties.contains(meta->property(i).name()))
        {
            meta->property(i).write(object, properties[meta->property(i).name()]);
        }
    }
}
} // namespace

ThemeLoader::ThemeLoader(QObject* parent) : QObject(parent)
{
}

QString ThemeLoader::filename() const
{
    return m_filename;
}

void ThemeLoader::setTheme(QObject* theme)
{
    if (m_theme == theme)
        return;

    m_theme = theme;
}

void ThemeLoader::setFilename(const QString& filename)
{
    if (m_filename == filename)
        return;

    m_filename = filename;
    emit filenameChanged(m_filename);
}

void ThemeLoader::load()
{
    if (!m_theme)
        return;

    QFile jsonFile(m_filename);
    if (!jsonFile.open(QFile::ReadOnly))
        return;

    QJsonObject json = QJsonDocument::fromJson(jsonFile.readAll()).object();
    QObject* dayColors = m_theme->property(::dayColors).value<QObject*>();
    QObject* nightColors = m_theme->property(::nightColors).value<QObject*>();

    if (json.contains(::commonColorsPath))
    {
        QVariantMap commonColors = json.value(::commonColorsPath).toObject().toVariantMap();

        if (dayColors)
            ::propertiesToObject(dayColors, commonColors);
        if (nightColors)
            ::propertiesToObject(nightColors, commonColors);
    }

    if (dayColors && json.contains(::dayColorsPath))
        ::propertiesToObject(dayColors, json.value(::dayColorsPath).toObject().toVariantMap());
    if (nightColors && json.contains(::nightColorsPath))
        ::propertiesToObject(nightColors, json.value(::nightColorsPath).toObject().toVariantMap());

    QObject* factors = m_theme->property(::factors).value<QObject*>();
    if (factors && json.contains(::factorsPath))
        ::propertiesToObject(factors, json.value(::factorsPath).toObject().toVariantMap());

    if (json.contains(::nightPath))
        m_theme->setProperty(::night, json.value(::nightPath).toVariant());
    if (json.contains(::baseSizePath))
        m_theme->setProperty(::baseSize, json.value(::baseSizePath).toVariant());
    if (json.contains(::scrollInteractivePath))
        m_theme->setProperty(::scrollInteractive, json.value(::scrollInteractivePath).toVariant());
    if (json.contains(::animationTimePath))
        m_theme->setProperty(::animationTime, json.value(::animationTimePath).toVariant());
}

void ThemeLoader::save()
{
    QJsonObject root;

    QObject* dayColors = m_theme->property(::dayColors).value<QObject*>();
    QVariantMap dayColorsMap = dayColors ? ::propertiesFromObject(dayColors) : QVariantMap();

    QObject* nightColors = m_theme->property(::nightColors).value<QObject*>();
    QVariantMap nightColorsMap = nightColors ? ::propertiesFromObject(nightColors) : QVariantMap();

    QVariantMap commonColorsMap;
    for (const QString& key : dayColorsMap.keys())
    {
        if (nightColorsMap.contains(key) && dayColorsMap[key] == nightColorsMap[key])
        {
            commonColorsMap[key] = nightColorsMap[key];
            nightColorsMap.remove(key);
            dayColorsMap.remove(key);
        }
    }

    QObject* factors = m_theme->property(::factors).value<QObject*>();
    QVariantMap factorsMap = factors ? ::propertiesFromObject(factors) : QVariantMap();

    root[::commonColorsPath] = QJsonObject::fromVariantMap(commonColorsMap);
    root[::dayColorsPath] = QJsonObject::fromVariantMap(dayColorsMap);
    root[::nightColorsPath] = QJsonObject::fromVariantMap(nightColorsMap);
    root[::factorsPath] = QJsonObject::fromVariantMap(factorsMap);

    root[::nightPath] = QJsonValue::fromVariant(m_theme->property(::night));
    root[::baseSizePath] = QJsonValue::fromVariant(m_theme->property(::baseSize));
    root[::scrollInteractivePath] = QJsonValue::fromVariant(m_theme->property(::scrollInteractive));
    root[::animationTimePath] = QJsonValue::fromVariant(m_theme->property(::animationTime));

    QJsonDocument document;
    document.setObject(root);

    QFile jsonFile(m_filename);

    jsonFile.open(QFile::WriteOnly);
    jsonFile.write(document.toJson());
}

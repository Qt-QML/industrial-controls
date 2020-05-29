#include "theme_loader.h"

#include <QColor>
#include <QDebug>
#include <QFile>
#include <QJsonParseError>
#include <QQmlEngine>

namespace
{
constexpr char night[] = "night";

constexpr char dayColors[] = "dayColors";
constexpr char nightColors[] = "nightColors";
constexpr char factors[] = "factors";

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

    QJsonDocument doc = this->loadJson(m_filename);

    QObject* dayColors = m_theme->property(::dayColors).value<QObject*>();
    if (dayColors)
        this->updatePropertiesFromJson(dayColors, doc, ::dayColorsPath);

    QObject* nightColors = m_theme->property(::nightColors).value<QObject*>();
    if (nightColors)
        this->updatePropertiesFromJson(nightColors, doc, ::nightColorsPath);

    QObject* factors = m_theme->property(::factors).value<QObject*>();
    if (factors)
        this->updatePropertiesFromJson(factors, doc, ::factorsPath);
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

    root[::commonColorsPath] = QJsonObject::fromVariantMap(commonColorsMap);
    root[::dayColorsPath] = QJsonObject::fromVariantMap(dayColorsMap);
    root[::nightColorsPath] = QJsonObject::fromVariantMap(nightColorsMap);

    QJsonDocument document;
    document.setObject(root);

    QFile jsonFile(m_filename);

    jsonFile.open(QFile::WriteOnly);
    jsonFile.write(document.toJson());
}

void ThemeLoader::updatePropertiesFromJson(QObject* object, const QJsonDocument& doc,
                                           const QString& path)
{
    QJsonObject root = doc.object();
    QJsonObject json = root[path].toObject();

    auto meta = object->metaObject();
    for (int i = meta->propertyOffset(); i < meta->propertyCount(); ++i)
    {
        if (json.contains(meta->property(i).name()))
        {
            meta->property(i).write(object, json[meta->property(i).name()].toVariant());
        }
    }
}

QJsonDocument ThemeLoader::loadJson(const QString& fileName)
{
    QFile jsonFile(fileName);
    jsonFile.open(QFile::ReadOnly);

    return QJsonDocument().fromJson(jsonFile.readAll());
}

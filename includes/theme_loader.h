#ifndef THEME_LOADER_H
#define THEME_LOADER_H

#include "export.h"

#include <QColor>
#include <QJsonObject>
#include <QObject>

class INDUSTRIAL_CONTROLS_EXPORT ThemeLoader : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QObject* theme WRITE setTheme)
    Q_PROPERTY(QString filename READ filename WRITE setFilename NOTIFY filenameChanged)

public:
    explicit ThemeLoader(QObject* parent = nullptr);

    int baseSize() const;
    QString filename() const;

public slots:
    void setTheme(QObject* theme);
    void setFilename(const QString& filename);

    void load();
    void save();

signals:
    void filenameChanged(QString filename);

private:
    QObject* m_theme = nullptr;
    QString m_filename;

    void updatePropertiesFromJson(QObject* object, const QJsonDocument& doc, const QString& path);
    QJsonDocument loadJson(const QString& fileName);
};

#endif // THEME_LOADER_H

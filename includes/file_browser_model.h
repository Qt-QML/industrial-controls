#ifndef FILE_BROWSER_MODEL_H
#define FILE_BROWSER_MODEL_H

#include "export.h"

#include <QAbstractListModel>
#include <QUrl>

#include <QDir>
#include <QFileInfo>
#include <QFileSystemWatcher>

class INDUSTRIAL_CONTROLS_EXPORT FileBrowserModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QUrl folder READ folder WRITE setFolder NOTIFY folderChanged)
    Q_PROPERTY(
        QStringList nameFilters READ nameFilters WRITE setNameFilters NOTIFY nameFiltersChanged)
    Q_PROPERTY(QString nameFiltersFromString WRITE setNameFiltersFromString)
    Q_PROPERTY(FileRole sortField READ sortField WRITE setSortField NOTIFY sortFieldChanged)
    Q_PROPERTY(bool sortReversed READ sortReversed WRITE setSortReversed NOTIFY sortReversedChanged)
    Q_PROPERTY(bool showHidden READ showHidden WRITE setShowHidden NOTIFY showHiddenChanged)
    Q_PROPERTY(bool showFiles READ showFiles WRITE setShowFiles NOTIFY showFilesChanged)
    Q_PROPERTY(QUrl parentFolder READ parentFolder NOTIFY parentFolderChanged)
    Q_PROPERTY(QVariantList pathComponents READ pathComponents NOTIFY pathComponentsChanged)

public:
    enum FileRole
    {
        Name = Qt::UserRole + 1,
        Size,
        Type,
        ModTime,
        IsDir,
        Url
    };

    Q_ENUM(FileRole)

    explicit FileBrowserModel(QObject* parent = nullptr);

    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role) const override;

    Q_INVOKABLE QVariant get(int index, FileRole role) const;
    Q_INVOKABLE QVariantMap getShortcuts() const;

    Q_INVOKABLE QString urlToName(const QUrl& url) const;
    Q_INVOKABLE QString urlToSuffix(const QUrl& url) const;

    Q_INVOKABLE bool exists(const QString& name);
    Q_INVOKABLE bool createFolder(const QString& name);
    Q_INVOKABLE bool renameFile(const QString& oldName, const QString& newName);
    Q_INVOKABLE void deleteFile(const QString& name);

    QUrl parentFolder() const;
    QVariantList pathComponents() const;

    bool enabled() const;
    QUrl folder() const;
    QStringList nameFilters() const;
    FileRole sortField() const;
    bool sortReversed() const;
    bool showHidden() const;
    bool showFiles() const;

public slots:
    void setEnabled(bool enabled);
    void setFolder(const QUrl& folder);
    void setNameFilters(const QStringList& nameFilters);
    void setNameFiltersFromString(const QString& filterString);
    void setSortField(FileRole sortField);
    void setSortReversed(bool sortReversed);
    void setShowHidden(bool showHidden);
    void setShowFiles(bool showFiles);

    void update();

signals:
    void enabledChanged();
    void folderChanged();
    void nameFiltersChanged();
    void sortFieldChanged(FileRole sortField);
    void sortReversedChanged(bool sortReversed);
    void showHiddenChanged(bool showHidden);
    void showFilesChanged(bool showFiles);
    void parentFolderChanged();
    void pathComponentsChanged();

    void updated();

private:
    bool m_enabled;
    QDir m_dir;
    QFileSystemWatcher* m_watcher;
    QFileInfoList m_entries;
    QUrl m_oldFolder;

    FileRole m_sortField;
    bool m_sortReversed;
    bool m_showHidden;
    bool m_showFiles;
};

#endif // FILE_BROWSER_MODEL_H

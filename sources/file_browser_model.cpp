#include "file_browser_model.h"

#include <QDateTime>
#include <QStandardPaths>

FileBrowserModel::FileBrowserModel(QObject* parent) :
    QAbstractListModel(parent),
    m_enabled(false),
    m_watcher(new QFileSystemWatcher(this)),
    m_sortField(Name),
    m_sortReversed(false),
    m_showHidden(false),
    m_showFiles(true)
{
    connect(this, &FileBrowserModel::enabledChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::folderChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::nameFiltersChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::sortFieldChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::sortReversedChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::showHiddenChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::showFilesChanged, this, &FileBrowserModel::update);

    connect(m_watcher, &QFileSystemWatcher::directoryChanged, this, &FileBrowserModel::update);
    connect(this, &FileBrowserModel::enabledChanged, m_watcher, [this] {
        if (enabled())
        {
            m_watcher->addPath(folder().toLocalFile());
        }
        else
        {
            m_watcher->removePath(folder().toLocalFile());
        }
    });
}

QHash<int, QByteArray> FileBrowserModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Name] = "name";
    roles[Size] = "size";
    roles[Type] = "type";
    roles[ModTime] = "modTime";
    roles[IsDir] = "isDir";
    roles[Url] = "url";
    return roles;
}

int FileBrowserModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)
    return m_entries.size();
}

QVariant FileBrowserModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();

    return get(index.row(), static_cast<FileRole>(role));
}

QVariant FileBrowserModel::get(int index, FileRole role) const
{
    if (index < 0 || index >= m_entries.size())
        return QVariant();

    const QFileInfo& entry = m_entries[index];
    switch (role)
    {
    case Name:
        return entry.fileName();

    case Size:
        return entry.size();

    case Type:
        return entry.isDir() ? QString() : entry.suffix();

    case ModTime:
        return entry.lastModified();

    case IsDir:
        return entry.isDir();

    case Url:
        return QUrl::fromLocalFile(entry.absoluteFilePath());
    }
    return QVariant();
}

QVariantMap FileBrowserModel::getShortcuts() const
{
    const QList<QPair<QString, QStandardPaths::StandardLocation>> types{
        { QStringLiteral("home"), QStandardPaths::HomeLocation },
        { QStringLiteral("desktop"), QStandardPaths::DesktopLocation },
        { QStringLiteral("documents"), QStandardPaths::DocumentsLocation },
        { QStringLiteral("download"), QStandardPaths::DownloadLocation },
        { QStringLiteral("pictures"), QStandardPaths::PicturesLocation },
        { QStringLiteral("music"), QStandardPaths::MusicLocation },
        { QStringLiteral("movies"), QStandardPaths::MoviesLocation }
    };

    QVariantMap shortcuts;
    QVariantList displayList;

    for (auto& pair : types)
    {
        const QString& shortcutName = pair.first;
        QStandardPaths::StandardLocation type = pair.second;

        QStringList locationList = QStandardPaths::standardLocations(type);
        if (locationList.empty())
            continue;

        const QString& location = locationList.front();
        QUrl url = QUrl::fromLocalFile(location);
        shortcuts[shortcutName] = url;

        QVariantMap dict;
        dict.insert("name", QStandardPaths::displayName(type));
        dict.insert("url", url);
        displayList.append(std::move(dict));
    }

    shortcuts["displayList"] = std::move(displayList);
    return shortcuts;
}

QString FileBrowserModel::urlToName(const QUrl& url) const
{
    QString urlString = url.toLocalFile();
    int separatorPos = urlString.lastIndexOf(m_dir.separator());
    if (separatorPos != -1)
    {
        return urlString.right(urlString.length() - separatorPos - 1);
    }
    return urlString;
}

QString FileBrowserModel::urlToSuffix(const QUrl& url) const
{
    QString nameString = urlToName(url);
    int separatorPos = nameString.lastIndexOf('.');
    if (separatorPos != -1)
    {
        return nameString.right(nameString.length() - separatorPos - 1);
    }
    return QString();
}

bool FileBrowserModel::exists(const QString& name)
{
    return m_dir.exists(name);
}

bool FileBrowserModel::createFolder(const QString& name)
{
    return m_dir.mkdir(name);
}

bool FileBrowserModel::renameFile(const QString& oldName, const QString& newName)
{
    return m_dir.rename(oldName, newName);
}

void FileBrowserModel::deleteFile(const QString& name)
{
    QFileInfo file(m_dir, name);
    if (file.isDir())
    {
        QDir subDir(file.filePath());
        subDir.removeRecursively();
    }
    else
    {
        m_dir.remove(name);
    }
}

QUrl FileBrowserModel::parentFolder() const
{
    if (m_dir.isRoot())
        return folder();

    QDir parentDir = m_dir;
    if (!parentDir.cdUp())
        return folder();

    return QUrl::fromLocalFile(parentDir.absolutePath());
}

QVariantList FileBrowserModel::pathComponents() const
{
    QString path = m_dir.absolutePath();

    QVariantList comps;
    for (int pos = 0; pos < path.size();)
    {
        int n_pos = path.indexOf(m_dir.separator(), pos);
        if (n_pos == -1)
            n_pos = path.size();

        QVariantMap dict;
        if (pos != n_pos)
        {
            dict["name"] = path.mid(pos, n_pos - pos);
            dict["url"] = QUrl::fromLocalFile(path.mid(0, n_pos));
        }
        else
        {
            dict["name"] = QDir::rootPath();
            dict["url"] = QUrl::fromLocalFile(QDir::rootPath());
        }
        comps.append(std::move(dict));

        pos = n_pos + 1;
    }
    return comps;
}

bool FileBrowserModel::enabled() const
{
    return m_enabled;
}

QUrl FileBrowserModel::folder() const
{
    return QUrl::fromLocalFile(m_dir.absolutePath());
}

QStringList FileBrowserModel::nameFilters() const
{
    return m_dir.nameFilters();
}

FileBrowserModel::FileRole FileBrowserModel::sortField() const
{
    return m_sortField;
}

bool FileBrowserModel::sortReversed() const
{
    return m_sortReversed;
}

bool FileBrowserModel::showHidden() const
{
    return m_showHidden;
}

bool FileBrowserModel::showFiles() const
{
    return m_showFiles;
}

void FileBrowserModel::setEnabled(bool enabled)
{
    m_enabled = enabled;
    emit enabledChanged();
}

void FileBrowserModel::setFolder(const QUrl& folder)
{
    QUrl oldFolder = this->folder();
    if (oldFolder == folder)
        return;

    QString newDirPath = folder.toLocalFile();
    if (!QFileInfo(newDirPath).exists())
        return;

    m_dir.setPath(newDirPath);
    m_watcher->removePath(oldFolder.toLocalFile());
    m_watcher->addPath(newDirPath);

    emit folderChanged();
    emit pathComponentsChanged();
    emit parentFolderChanged();
}

void FileBrowserModel::setNameFilters(const QStringList& nameFilters)
{
    m_dir.setNameFilters(nameFilters);
    emit nameFiltersChanged();
}

void FileBrowserModel::setNameFiltersFromString(const QString& filterString)
{
    int firstPar = filterString.indexOf("(");
    int lastPar = filterString.indexOf(")");
    if (firstPar == -1 || firstPar > lastPar)
        return;

    int cutLength = lastPar - firstPar - 1;
    QStringList filters = filterString.mid(firstPar + 1, cutLength).split(" ");
    setNameFilters(filters);
}

void FileBrowserModel::setSortField(FileBrowserModel::FileRole sortField)
{
    if (m_sortField == sortField)
        return;

    m_sortField = sortField;
    emit sortFieldChanged(m_sortField);
}

void FileBrowserModel::setSortReversed(bool sortReversed)
{
    if (m_sortReversed == sortReversed)
        return;

    m_sortReversed = sortReversed;
    emit sortReversedChanged(m_sortReversed);
}

void FileBrowserModel::setShowHidden(bool showHidden)
{
    if (m_showHidden == showHidden)
        return;

    m_showHidden = showHidden;
    emit showHiddenChanged(m_showHidden);
}

void FileBrowserModel::setShowFiles(bool showFiles)
{
    if (m_showFiles == showFiles)
        return;

    m_showFiles = showFiles;
    emit showFilesChanged(m_showFiles);
}

void FileBrowserModel::update()
{
    if (!enabled())
        return;

    bool isNew = (m_oldFolder != folder());
    if (isNew)
    {
        m_oldFolder = folder();
        beginResetModel();
    }
    else
    {
        beginRemoveRows(QModelIndex(), 0, m_entries.size() - 1);
    }

    m_entries.clear();

    int sortFlags = QDir::Name;
    switch (m_sortField)
    {
    case Name:
        sortFlags = QDir::Name;
        break;

    case Size:
        sortFlags = QDir::Size;
        break;

    case Type:
        sortFlags = QDir::Type;
        break;

    case ModTime:
        sortFlags = QDir::Time;
        break;
    }
    if (m_sortReversed)
    {
        sortFlags |= QDir::Reversed;
    }
    sortFlags |= QDir::DirsFirst;
    sortFlags |= QDir::IgnoreCase;
    m_dir.setSorting(static_cast<QDir::SortFlag>(sortFlags));

    int filterFlags = QDir::NoDotAndDotDot | QDir::AllDirs;
    if (m_showHidden)
    {
        filterFlags |= QDir::Hidden;
    }
    if (m_showFiles)
    {
        filterFlags |= QDir::Files;
    }
    m_dir.setFilter(static_cast<QDir::Filters>(filterFlags));

    m_entries = m_dir.entryInfoList();

    if (m_sortField == Size || m_sortField == Type)
    {
        auto itFile = std::find_if(m_entries.begin(), m_entries.end(),
                                   [](const QFileInfo& file) { return !file.isDir(); });

        std::sort(m_entries.begin(), itFile, [](const QFileInfo& a, const QFileInfo& b) {
            return a.fileName().compare(b.fileName(), Qt::CaseInsensitive) < 0;
        });
    }

    if (isNew)
    {
        endResetModel();
    }
    else
    {
        endRemoveRows();
        beginInsertRows(QModelIndex(), 0, m_entries.size() - 1);
        endInsertRows();
    }

    //endResetModel();
    emit updated();
}

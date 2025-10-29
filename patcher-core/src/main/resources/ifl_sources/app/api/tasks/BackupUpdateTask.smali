.class public Linstafel/app/api/tasks/BackupUpdateTask;
.super Landroid/os/AsyncTask;
.source "BackupUpdateTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

.field private languageCode:Ljava/lang/String;

.field private preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Linstafel/app/managers/PreferenceManager;Linstafel/app/api/models/AutoUpdateInfo;Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 27
    iput-object p1, p0, Linstafel/app/api/tasks/BackupUpdateTask;->activity:Landroid/app/Activity;

    .line 28
    iput-object p2, p0, Linstafel/app/api/tasks/BackupUpdateTask;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 29
    iput-object p3, p0, Linstafel/app/api/tasks/BackupUpdateTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    .line 30
    iput-object p4, p0, Linstafel/app/api/tasks/BackupUpdateTask;->languageCode:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/tasks/BackupUpdateTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "Request failed with code "

    const/4 v1, 0x0

    .line 37
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 39
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 40
    const-string v2, "GET"

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 42
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 44
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 49
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 54
    :cond_1
    const-string p1, "Instafel"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    .line 57
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/tasks/BackupUpdateTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 10

    const-string v0, "https://raw.githubusercontent.com/instafel/backups/main/"

    .line 65
    const-string v1, "ifl_a11_26"

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    .line 67
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 68
    const-string p1, "manifest"

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 69
    const-string p1, "backup_version"

    invoke-virtual {v9, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    iget-object v3, p0, Linstafel/app/api/tasks/BackupUpdateTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    invoke-virtual {v3}, Linstafel/app/api/models/AutoUpdateInfo;->getCurrent_backup_version()I

    move-result v3

    if-le p1, v3, :cond_0

    .line 70
    new-instance v4, Linstafel/app/api/tasks/BackupUpdateDownloadTask;

    iget-object v5, p0, Linstafel/app/api/tasks/BackupUpdateTask;->activity:Landroid/app/Activity;

    iget-object v6, p0, Linstafel/app/api/tasks/BackupUpdateTask;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    iget-object v7, p0, Linstafel/app/api/tasks/BackupUpdateTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    iget-object v8, p0, Linstafel/app/api/tasks/BackupUpdateTask;->languageCode:Ljava/lang/String;

    invoke-direct/range {v4 .. v9}, Linstafel/app/api/tasks/BackupUpdateDownloadTask;-><init>(Landroid/app/Activity;Linstafel/app/managers/PreferenceManager;Linstafel/app/api/models/AutoUpdateInfo;Ljava/lang/String;Lorg/json/JSONObject;)V

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Linstafel/app/api/tasks/BackupUpdateTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    .line 71
    invoke-virtual {v0}, Linstafel/app/api/models/AutoUpdateInfo;->getBackup_id()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/backup.ibackup"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v2

    invoke-virtual {v4, p1}, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 74
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 75
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateTask;->activity:Landroid/app/Activity;

    iget-object v0, p0, Linstafel/app/api/tasks/BackupUpdateTask;->languageCode:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 78
    :cond_1
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateTask;->activity:Landroid/app/Activity;

    iget-object v0, p0, Linstafel/app/api/tasks/BackupUpdateTask;->languageCode:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

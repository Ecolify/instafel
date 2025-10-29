.class public Linstafel/app/api/tasks/BackupUpdateDownloadTask;
.super Landroid/os/AsyncTask;
.source "BackupUpdateDownloadTask.java"


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

.field private overridesManager:Linstafel/app/managers/OverridesManager;

.field private preferenceManager:Linstafel/app/managers/PreferenceManager;

.field private updateManifest:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Linstafel/app/managers/PreferenceManager;Linstafel/app/api/models/AutoUpdateInfo;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 32
    iput-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->activity:Landroid/app/Activity;

    .line 33
    iput-object p2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 34
    iput-object p3, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    .line 35
    iput-object p4, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->languageCode:Ljava/lang/String;

    .line 36
    iput-object p5, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->updateManifest:Lorg/json/JSONObject;

    .line 37
    new-instance p2, Linstafel/app/managers/OverridesManager;

    invoke-direct {p2, p1}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->overridesManager:Linstafel/app/managers/OverridesManager;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 22
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "Request failed with code "

    const/4 v1, 0x0

    .line 44
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 46
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 47
    const-string v2, "GET"

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 51
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 56
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 61
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

    .line 64
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 22
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4

    const/4 v0, 0x0

    .line 72
    const-string v1, "ifl_a11_26"

    if-eqz p1, :cond_0

    .line 74
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 75
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->overridesManager:Linstafel/app/managers/OverridesManager;

    const-string v3, "backup"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p1, v2}, Linstafel/app/managers/OverridesManager;->writeContentIntoOverridesFile(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 76
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    iget-object v2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->updateManifest:Lorg/json/JSONObject;

    const-string v3, "backup_version"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v2}, Linstafel/app/api/models/AutoUpdateInfo;->setCurrent_backup_version(I)V

    .line 77
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_update_value:Ljava/lang/String;

    iget-object v3, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    invoke-virtual {v3}, Linstafel/app/api/models/AutoUpdateInfo;->exportAsJsonString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->activity:Landroid/app/Activity;

    iget-object v2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->languageCode:Ljava/lang/String;

    iget-object v3, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->autoUpdateInfo:Linstafel/app/api/models/AutoUpdateInfo;

    invoke-virtual {v3}, Linstafel/app/api/models/AutoUpdateInfo;->getBackup_id()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Linstafel/app/ota/CheckUpdates;->showBackupUpdateDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 80
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 81
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->activity:Landroid/app/Activity;

    iget-object v2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->languageCode:Ljava/lang/String;

    invoke-static {p1, v2, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 84
    :cond_0
    iget-object p1, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->activity:Landroid/app/Activity;

    iget-object v2, p0, Linstafel/app/api/tasks/BackupUpdateDownloadTask;->languageCode:Ljava/lang/String;

    invoke-static {p1, v2, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

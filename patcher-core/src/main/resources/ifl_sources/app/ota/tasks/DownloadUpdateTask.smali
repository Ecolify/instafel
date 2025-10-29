.class public Linstafel/app/ota/tasks/DownloadUpdateTask;
.super Landroid/os/AsyncTask;
.source "DownloadUpdateTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final PROGRESS_UPDATE_INTERVAL:I = 0x4b0


# instance fields
.field activity:Landroid/app/Activity;

.field private currentDownloadedSizeMegabyte:D

.field private df:Ljava/text/DecimalFormat;

.field private downloadMethod:Z

.field private fileSize:J

.field private formattedFileSize:Ljava/lang/String;

.field private instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field private lastUpdateTime:J

.field private notificationBuilder:Landroid/app/Notification$Builder;

.field private notificationId:I

.field private notificationManager:Landroid/app/NotificationManager;

.field private progressBar:Landroid/widget/ProgressBar;

.field private sizeProcess:Landroid/widget/TextView;

.field private statusText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/app/Activity;Landroid/widget/ProgressBar;Landroid/widget/TextView;Linstafel/app/utils/dialog/InstafelDialog;Landroid/widget/TextView;)V
    .locals 3

    .line 45
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    const/16 v1, 0x102

    .line 62
    iput v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    const-wide/16 v1, 0x0

    .line 143
    iput-wide v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->lastUpdateTime:J

    .line 46
    iput-object p2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    .line 47
    iput-object p3, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->progressBar:Landroid/widget/ProgressBar;

    .line 48
    iput-object p4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->statusText:Landroid/widget/TextView;

    .line 49
    iput-object p6, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->sizeProcess:Landroid/widget/TextView;

    .line 50
    iput-object p5, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 51
    new-instance p2, Ljava/text/DecimalFormat;

    const-string p3, "#.##"

    invoke-direct {p2, p3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->df:Ljava/text/DecimalFormat;

    .line 53
    const-string p2, "NEW"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    return-void

    .line 56
    :cond_0
    iput-boolean v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 30
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/DownloadUpdateTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 86
    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v3, v1}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    const-string v4, "instafel_files"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 88
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 91
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 94
    :goto_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v4, "ifl_update.apk"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 96
    :try_start_1
    new-instance v0, Ljava/net/URL;

    aget-object v4, p1, v2

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 98
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 100
    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentLength()I

    move-result v4

    int-to-long v4, v4

    .line 101
    iput-wide v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->fileSize:J

    .line 102
    iget-object v6, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->df:Ljava/text/DecimalFormat;

    long-to-double v4, v4

    const-wide/high16 v7, 0x4130000000000000L    # 1048576.0

    div-double/2addr v4, v7

    invoke-virtual {v6, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->formattedFileSize:Ljava/lang/String;

    .line 103
    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    .line 104
    iget-object v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->formattedFileSize:Ljava/lang/String;

    const-string v6, "\\."

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 105
    array-length v6, v4

    if-le v6, v5, :cond_1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v4, v5, :cond_1

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->formattedFileSize:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "0"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->formattedFileSize:Ljava/lang/String;

    .line 110
    :cond_1
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v6, 0x2000

    invoke-direct {v4, v0, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 113
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x400

    .line 115
    new-array v3, v3, [B

    const-wide/16 v9, 0x0

    .line 119
    :goto_1
    invoke-virtual {v4, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v11, -0x1

    if-eq v6, v11, :cond_2

    int-to-long v11, v6

    add-long/2addr v9, v11

    long-to-double v11, v9

    div-double/2addr v11, v7

    .line 121
    iput-wide v11, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->currentDownloadedSizeMegabyte:D

    .line 122
    new-array v11, v5, [Ljava/lang/Integer;

    const-wide/16 v12, 0x64

    mul-long/2addr v12, v9

    iget-wide v7, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->fileSize:J

    div-long/2addr v12, v7

    long-to-int v7, v12

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v11, v2

    invoke-virtual {p0, v11}, Linstafel/app/ota/tasks/DownloadUpdateTask;->publishProgress([Ljava/lang/Object;)V

    .line 123
    invoke-virtual {v0, v3, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    const-wide/high16 v7, 0x4130000000000000L    # 1048576.0

    goto :goto_1

    .line 126
    :cond_2
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 128
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 129
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 132
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    .line 135
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 136
    iget-object v3, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_2
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 30
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/DownloadUpdateTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 6

    .line 173
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    const-string v1, "instafel_files"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 174
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string v1, "ifl_update.apk"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    iget-wide v3, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->fileSize:J

    cmp-long p1, v1, v3

    const v1, 0x1080078

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p1, :cond_4

    .line 177
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 178
    new-instance p1, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {p1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 179
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Linstafel/app/utils/InstafelFileProvider;->getFileUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v4, "application/vnd.android.package-archive"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    .line 180
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 181
    invoke-virtual {p1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 184
    :try_start_0
    iget-boolean v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-nez v0, :cond_0

    .line 185
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 186
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 188
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    invoke-direct {p1, v0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 189
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_success_install:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v0, v4, v5}, Linstafel/app/managers/PreferenceManager;->setPreferenceLong(Ljava/lang/String;J)V

    goto :goto_0

    .line 191
    :cond_0
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    const/high16 v4, 0xc000000

    invoke-static {v0, v3, p1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 192
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    const-string v4, "Download complete, tap to install."

    .line 193
    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const v4, 0x1080082

    .line 194
    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 195
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 196
    invoke-virtual {p1, v3, v3, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 197
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    iget-object v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v4}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 201
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 202
    iget-boolean p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-nez p1, :cond_1

    .line 203
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    sget v0, Linstafel/app/R$string;->ifl_t1_01:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 205
    :cond_1
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    const-string v0, "ERR1"

    .line 206
    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 207
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 208
    invoke-virtual {p1, v3, v3, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 209
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :goto_0
    return-void

    .line 213
    :cond_2
    iget-boolean p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-nez p1, :cond_3

    .line 214
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 215
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    sget v0, Linstafel/app/R$string;->ifl_t1_03:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 217
    :cond_3
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    const-string v0, "ERR2"

    .line 218
    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 219
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 220
    invoke-virtual {p1, v3, v3, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 221
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void

    .line 225
    :cond_4
    iget-boolean p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-nez p1, :cond_5

    .line 226
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 227
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    sget v0, Linstafel/app/R$string;->ifl_t1_03:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 229
    :cond_5
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    const-string v0, "ERR3"

    .line 230
    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 231
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 232
    invoke-virtual {p1, v3, v3, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 233
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .line 66
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 68
    iget-boolean v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    .line 70
    new-instance v0, Landroid/app/Notification$Builder;

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->activity:Landroid/app/Activity;

    sget-object v2, Linstafel/app/managers/NotificationOtaManager;->notification_channel_id:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string v1, "Instafel Update"

    .line 71
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const-string v1, "Waiting server connection.."

    .line 72
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x1080081

    .line 73
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    const/4 v1, 0x1

    .line 74
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 75
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 76
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    .line 78
    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 8

    const/4 v0, 0x0

    .line 145
    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 146
    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->df:Ljava/text/DecimalFormat;

    iget-wide v2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->currentDownloadedSizeMegabyte:D

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 147
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 149
    array-length v3, v2

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    aget-object v2, v2, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v4, :cond_0

    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 154
    :cond_0
    iget-boolean v2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->downloadMethod:Z

    if-nez v2, :cond_1

    .line 155
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 156
    iget-object v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->statusText:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "%"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->sizeProcess:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->formattedFileSize:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 159
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 160
    iget-wide v4, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->lastUpdateTime:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x4b0

    cmp-long v4, v4, v6

    const/16 v5, 0x64

    if-gez v4, :cond_3

    if-ne p1, v5, :cond_2

    goto :goto_0

    :cond_2
    return-void

    .line 161
    :cond_3
    :goto_0
    iput-wide v2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->lastUpdateTime:J

    .line 163
    iget-object v2, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "% downloaded ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " MB)"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 164
    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 165
    invoke-virtual {v1, v5, p1, v0}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 166
    iget-object p1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationManager:Landroid/app/NotificationManager;

    iget v0, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationId:I

    iget-object v1, p0, Linstafel/app/ota/tasks/DownloadUpdateTask;->notificationBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .line 30
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/DownloadUpdateTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.class public Linstafel/app/ota/tasks/ChangelogTask;
.super Landroid/os/AsyncTask;
.source "ChangelogTask.java"


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
.field private final act:Landroid/app/Activity;

.field private ifl_version:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 26
    iput p2, p0, Linstafel/app/ota/tasks/ChangelogTask;->ifl_version:I

    .line 27
    iput-object p1, p0, Linstafel/app/ota/tasks/ChangelogTask;->act:Landroid/app/Activity;

    return-void
.end method

.method private sendGetRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 75
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const/16 v0, 0x3a98

    .line 76
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 78
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 79
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 88
    throw v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/ChangelogTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 33
    :try_start_0
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Linstafel/app/ota/tasks/ChangelogTask;->sendGetRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 35
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 36
    const-string p1, "Couldn\'t connect to the server"

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 20
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/ChangelogTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 6

    const-string v0, "https://api.github.com/repos/Ecolify/instafel2/contents/clogs/clog_"

    .line 49
    :try_start_0
    new-instance v1, Linstafel/app/managers/PreferenceManager;

    iget-object v2, p0, Linstafel/app/ota/tasks/ChangelogTask;->act:Landroid/app/Activity;

    invoke-direct {v1, v2}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 50
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 51
    const-string p1, "content"

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    .line 52
    new-instance v3, Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p1}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "llog_ver"

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ".txt"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 54
    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_clog_disable_version_control:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_1

    .line 57
    iget v3, p0, Linstafel/app/ota/tasks/ChangelogTask;->ifl_version:I

    if-lt v3, p1, :cond_0

    .line 58
    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_clog_last_shown_version:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result v1

    .line 60
    iget v3, p0, Linstafel/app/ota/tasks/ChangelogTask;->ifl_version:I

    if-eq v1, v3, :cond_0

    .line 61
    new-instance v1, Linstafel/app/ota/tasks/ChangelogContentTask;

    iget-object v3, p0, Linstafel/app/ota/tasks/ChangelogTask;->act:Landroid/app/Activity;

    iget v5, p0, Linstafel/app/ota/tasks/ChangelogTask;->ifl_version:I

    invoke-direct {v1, v3, v5, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;-><init>(Landroid/app/Activity;II)V

    new-array p1, v4, [Ljava/lang/String;

    aput-object v0, p1, v2

    invoke-virtual {v1, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void

    .line 65
    :cond_1
    iget-object v1, p0, Linstafel/app/ota/tasks/ChangelogTask;->act:Landroid/app/Activity;

    const-string v3, "Disable version control is true, skipping version control."

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 66
    new-instance v1, Linstafel/app/ota/tasks/ChangelogContentTask;

    iget-object v3, p0, Linstafel/app/ota/tasks/ChangelogTask;->act:Landroid/app/Activity;

    iget v5, p0, Linstafel/app/ota/tasks/ChangelogTask;->ifl_version:I

    invoke-direct {v1, v3, v5, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;-><init>(Landroid/app/Activity;II)V

    new-array p1, v4, [Ljava/lang/String;

    aput-object v0, p1, v2

    invoke-virtual {v1, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 69
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .line 42
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    return-void
.end method

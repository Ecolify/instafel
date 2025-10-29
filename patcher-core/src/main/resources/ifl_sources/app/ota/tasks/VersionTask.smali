.class public Linstafel/app/ota/tasks/VersionTask;
.super Landroid/os/AsyncTask;
.source "VersionTask.java"


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

.field private checkType:Z

.field private ifl_type:Ljava/lang/String;

.field private ifl_version:I

.field private instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;IZ)V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 28
    iput-object p2, p0, Linstafel/app/ota/tasks/VersionTask;->ifl_type:Ljava/lang/String;

    .line 29
    iput p3, p0, Linstafel/app/ota/tasks/VersionTask;->ifl_version:I

    .line 30
    new-instance p2, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p2, p1}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 31
    iput-object p1, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    .line 32
    iput-boolean p4, p0, Linstafel/app/ota/tasks/VersionTask;->checkType:Z

    return-void
.end method

.method private sendGetRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const/16 v0, 0x3a98

    .line 81
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 83
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 84
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 93
    throw v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/VersionTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 38
    :try_start_0
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Linstafel/app/ota/tasks/VersionTask;->sendGetRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 40
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 41
    const-string p1, "Couldn\'t connect to the server"

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/VersionTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 9

    const-string v0, "https://content.api.instafel.app/content/rels/get/"

    .line 64
    :try_start_0
    iget-object v1, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    invoke-static {v1}, Linstafel/app/ota/LastCheck;->update(Landroid/app/Activity;)V

    .line 65
    iget-boolean v1, p0, Linstafel/app/ota/tasks/VersionTask;->checkType:Z

    if-eqz v1, :cond_0

    .line 66
    iget-object v1, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    invoke-static {v1}, Linstafel/app/ota/LastCheck;->updateUi(Landroid/app/Activity;)V

    .line 68
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 69
    const-string p1, "tag_name"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 70
    new-instance v2, Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object v3, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    iget v4, p0, Linstafel/app/ota/tasks/VersionTask;->ifl_version:I

    iget-object v5, p0, Linstafel/app/ota/tasks/VersionTask;->ifl_type:Ljava/lang/String;

    iget-object v7, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    iget-boolean v8, p0, Linstafel/app/ota/tasks/VersionTask;->checkType:Z

    invoke-direct/range {v2 .. v8}, Linstafel/app/ota/tasks/BuildInfoTask;-><init>(Landroid/app/Activity;ILjava/lang/String;ILinstafel/app/utils/dialog/InstafelDialog;Z)V

    new-array p1, v1, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-virtual {v2, p1}, Linstafel/app/ota/tasks/BuildInfoTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 74
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 5

    .line 47
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 48
    iget-boolean v0, p0, Linstafel/app/ota/tasks/VersionTask;->checkType:Z

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 50
    new-instance v0, Linstafel/app/ui/LoadingBar;

    iget-object v1, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    invoke-direct {v0, v1}, Linstafel/app/ui/LoadingBar;-><init>(Landroid/content/Context;)V

    .line 51
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 52
    iget-object v3, p0, Linstafel/app/ota/tasks/VersionTask;->act:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c80000    # 25.0f

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float/2addr v3, v4

    float-to-int v3, v3

    const/4 v4, 0x0

    .line 53
    invoke-virtual {v1, v3, v4, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 54
    invoke-virtual {v0, v1}, Linstafel/app/ui/LoadingBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    iget-object v1, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v3, "loading_bar"

    invoke-virtual {v1, v3, v0}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 56
    iget-object v0, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v1, "button_top_space"

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 57
    iget-object v0, p0, Linstafel/app/ota/tasks/VersionTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    :cond_0
    return-void
.end method

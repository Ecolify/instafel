.class public Linstafel/app/ota/tasks/ChangelogContentTask;
.super Landroid/os/AsyncTask;
.source "ChangelogContentTask.java"


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

.field private clog_version:I

.field private ifl_version:I

.field private instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public constructor <init>(Landroid/app/Activity;II)V
    .locals 1

    .line 32
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput v0, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->clog_version:I

    .line 33
    iput p2, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->ifl_version:I

    .line 34
    new-instance p2, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p2, p1}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 35
    iput-object p1, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    .line 36
    iput p3, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->clog_version:I

    return-void
.end method

.method static synthetic access$000(Linstafel/app/ota/tasks/ChangelogContentTask;)I
    .locals 0

    .line 25
    iget p0, p0, Linstafel/app/ota/tasks/ChangelogContentTask;->ifl_version:I

    return p0
.end method

.method private sendGetRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 104
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const/16 v0, 0x3a98

    .line 105
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 107
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 108
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 117
    throw v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 25
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 42
    :try_start_0
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;->sendGetRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 44
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 45
    const-string p1, "Couldn\'t connect to the server"

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 25
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/ChangelogContentTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, "Changelog v"

    .line 58
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v3, p1

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 59
    const-string v3, "content"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 60
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v2}, Ljava/lang/String;-><init>([B)V

    .line 62
    new-instance v2, Linstafel/app/managers/PreferenceManager;

    iget-object v4, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    invoke-direct {v2, v4}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 63
    iget-object v4, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    invoke-static {v4}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    .line 65
    new-instance v12, Linstafel/app/utils/dialog/InstafelDialog;

    iget-object v4, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    invoke-direct {v12, v4}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 66
    const-string v4, "top_space"

    const/16 v5, 0x19

    invoke-virtual {v12, v4, v5}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 67
    const-string v13, "dialog_title"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->clog_version:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    sget v17, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v0, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object v4, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    invoke-direct {v0, v4, v3, v3}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const/16 v15, 0x1e

    const/16 v16, 0x0

    move-object/from16 v18, v0

    invoke-virtual/range {v12 .. v18}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 74
    const-string v0, "mid_space"

    const/16 v3, 0x14

    invoke-virtual {v12, v0, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 75
    const-string v5, "dialog_desc_left"

    sget v9, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v10, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object v0, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    const/16 v4, 0x18

    invoke-direct {v10, v0, v4, v4}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const/16 v7, 0x10

    const/16 v8, 0x136

    move-object v4, v12

    invoke-virtual/range {v4 .. v10}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 82
    const-string v0, "button_top_space"

    invoke-virtual {v12, v0, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 83
    const-string v13, "buttons"

    iget-object v0, v1, Linstafel/app/ota/tasks/ChangelogContentTask;->act:Landroid/app/Activity;

    const-string v3, "ifl_d3_02"

    .line 85
    invoke-static {v0, v11, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    new-instance v0, Linstafel/app/ota/tasks/ChangelogContentTask$1;

    invoke-direct {v0, v1, v12, v2}, Linstafel/app/ota/tasks/ChangelogContentTask$1;-><init>(Linstafel/app/ota/tasks/ChangelogContentTask;Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;)V

    const/16 v17, 0x0

    const/4 v15, 0x0

    move-object/from16 v16, v0

    .line 83
    invoke-virtual/range {v12 .. v17}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 95
    const-string v0, "bottom_space"

    const/16 v2, 0x1b

    invoke-virtual {v12, v0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 96
    invoke-virtual {v12}, Linstafel/app/utils/dialog/InstafelDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 98
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .line 51
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    return-void
.end method

.class public Linstafel/app/ota/tasks/BuildInfoTask;
.super Landroid/os/AsyncTask;
.source "BuildInfoTask.java"


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

.field checkType:Z

.field ifl_type:Ljava/lang/String;

.field ifl_version:I

.field instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field lastVersion:I

.field versionDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILjava/lang/String;ILinstafel/app/utils/dialog/InstafelDialog;Z)V
    .locals 0

    .line 44
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 45
    iput p4, p0, Linstafel/app/ota/tasks/BuildInfoTask;->lastVersion:I

    .line 46
    iput p2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->ifl_version:I

    .line 47
    iput-object p3, p0, Linstafel/app/ota/tasks/BuildInfoTask;->ifl_type:Ljava/lang/String;

    .line 48
    iput-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    .line 49
    iput-object p5, p0, Linstafel/app/ota/tasks/BuildInfoTask;->versionDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 50
    new-instance p2, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p2, p1}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 51
    iput-boolean p6, p0, Linstafel/app/ota/tasks/BuildInfoTask;->checkType:Z

    return-void
.end method

.method static synthetic access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;
    .locals 0

    .line 33
    iget-object p0, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    return-object p0
.end method

.method private sendGetRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 226
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const/16 v0, 0x3a98

    .line 227
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 229
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 230
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 234
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 236
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 239
    throw v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 33
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/BuildInfoTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    .line 57
    :try_start_0
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Linstafel/app/ota/tasks/BuildInfoTask;->sendGetRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 59
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 60
    const-string v0, "Instafel"

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 33
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/ota/tasks/BuildInfoTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 13

    .line 67
    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask;->versionDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 70
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 72
    const-string p1, "patcherData"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "igVersion"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 74
    const-string v1, ""

    .line 75
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->ifl_type:Ljava/lang/String;

    const-string v3, "Unclone"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "/"

    const-string v4, "fileName"

    const-string v5, "fileInfos"

    const-string v6, "https://github.com/mamiiblt/instafel/releases/download/v"

    if-eqz v2, :cond_0

    .line 76
    :try_start_1
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "unclone"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->lastVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 78
    :cond_0
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->ifl_type:Ljava/lang/String;

    const-string v7, "Clone"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "clone"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->lastVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 83
    :cond_1
    :goto_0
    iget v0, p0, Linstafel/app/ota/tasks/BuildInfoTask;->lastVersion:I

    iget v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->ifl_version:I

    const/4 v3, 0x0

    if-le v0, v2, :cond_3

    .line 84
    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    invoke-static {v0}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 86
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    .line 88
    invoke-static {v2}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "ifl_d1_02"

    iget v6, p0, Linstafel/app/ota/tasks/BuildInfoTask;->lastVersion:I

    .line 90
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 86
    invoke-static {v2, v4, v5, p1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    .line 93
    const-string p1, "ifl_err"

    :cond_2
    move-object v4, p1

    .line 95
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v2, "top_space"

    const/16 v5, 0x19

    invoke-virtual {p1, v2, v5}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 96
    iget-object v6, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v7, "dialog_title"

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    const-string v2, "ifl_d1_01"

    .line 98
    invoke-static {p1, v0, v2}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    sget v11, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v12, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    invoke-direct {v12, p1, v3, v3}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const/16 v9, 0x1e

    const/4 v10, 0x0

    .line 96
    invoke-virtual/range {v6 .. v12}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 103
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v2, "mid_space"

    const/16 v9, 0x14

    invoke-virtual {p1, v2, v9}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 104
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v3, "dialog_desc"

    sget v7, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v8, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    const/16 v5, 0x18

    invoke-direct {v8, p1, v5, v5}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const/16 v5, 0x10

    const/16 v6, 0x136

    invoke-virtual/range {v2 .. v8}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 111
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v2, "button_top_space"

    invoke-virtual {p1, v2, v9}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 113
    iget-object v3, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v4, "buttons"

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    const-string v2, "ifl_d1_04"

    .line 115
    invoke-static {p1, v0, v2}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    const-string v2, "ifl_d1_03"

    .line 116
    invoke-static {p1, v0, v2}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Linstafel/app/ota/tasks/BuildInfoTask$1;

    invoke-direct {v7, p0, v1}, Linstafel/app/ota/tasks/BuildInfoTask$1;-><init>(Linstafel/app/ota/tasks/BuildInfoTask;Ljava/lang/String;)V

    new-instance v8, Linstafel/app/ota/tasks/BuildInfoTask$2;

    invoke-direct {v8, p0}, Linstafel/app/ota/tasks/BuildInfoTask$2;-><init>(Linstafel/app/ota/tasks/BuildInfoTask;)V

    .line 113
    invoke-virtual/range {v3 .. v8}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 199
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v0, "bottom_space"

    const/16 v1, 0x1b

    invoke-virtual {p1, v0, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 200
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void

    .line 202
    :cond_3
    iget-boolean p1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->checkType:Z

    if-eqz p1, :cond_4

    .line 203
    new-instance p1, Landroid/app/Dialog;

    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    invoke-direct {p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 204
    sget v0, Linstafel/app/R$layout;->ifl_dg_ota_uptodate:I

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(I)V

    .line 205
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x2

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 206
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Linstafel/app/ota/tasks/BuildInfoTask;->act:Landroid/app/Activity;

    sget v2, Linstafel/app/R$drawable;->ifl_dg_ota_background:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 207
    invoke-virtual {p1, v3}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 209
    sget v0, Linstafel/app/R$id;->ifl_dg_button_okay:I

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 210
    new-instance v1, Linstafel/app/ota/tasks/BuildInfoTask$3;

    invoke-direct {v1, p0, p1}, Linstafel/app/ota/tasks/BuildInfoTask$3;-><init>(Linstafel/app/ota/tasks/BuildInfoTask;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_4
    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 220
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

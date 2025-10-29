.class public Linstafel/app/api/requests/admin/AdminLogin;
.super Landroid/os/AsyncTask;
.source "AdminLogin.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Linstafel/app/api/models/InstafelResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field private pass:Ljava/lang/String;

.field private uname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 29
    iput-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    .line 30
    iput-object p2, p0, Linstafel/app/api/requests/admin/AdminLogin;->uname:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Linstafel/app/api/requests/admin/AdminLogin;->pass:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Linstafel/app/api/requests/admin/AdminLogin;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;
    .locals 5

    const-string v0, "Request failed with code "

    const/4 v1, 0x0

    .line 39
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 41
    const-string v2, "GET"

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 42
    const-string v2, "ifl-admin-username"

    iget-object v3, p0, Linstafel/app/api/requests/admin/AdminLogin;->uname:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-string v2, "ifl-admin-password"

    iget-object v3, p0, Linstafel/app/api/requests/admin/AdminLogin;->pass:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 46
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 50
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 53
    new-instance v0, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Linstafel/app/api/models/InstafelResponse;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 55
    :cond_1
    const-string p1, "Instafel"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->hide()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    .line 59
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 22
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/admin/AdminLogin;->doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$onPostExecute$0$instafel-app-api-requests-admin-AdminLogin(Landroid/view/View;)V
    .locals 2

    .line 77
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    invoke-direct {p1, v0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 78
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_show_admin_dash_as_tile:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 80
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 81
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    const-class v0, Linstafel/app/activity/ifl_a_menu;

    invoke-static {p1, v0}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onPostExecute$1$instafel-app-api-requests-admin-AdminLogin(Landroid/view/View;)V
    .locals 1

    .line 84
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 85
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    const-class v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;

    invoke-static {p1, v0}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method protected onPostExecute(Linstafel/app/api/models/InstafelResponse;)V
    .locals 10

    .line 66
    const-string v0, "Instafel"

    if-eqz p1, :cond_1

    .line 67
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    iget-object v1, p0, Linstafel/app/api/requests/admin/AdminLogin;->uname:Ljava/lang/String;

    iget-object v2, p0, Linstafel/app/api/requests/admin/AdminLogin;->pass:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Linstafel/app/utils/InstafelAdminUser;->login(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    iget-object v3, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Welcome "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Linstafel/app/api/requests/admin/AdminLogin;->uname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "!\n\nDo you want a shortcut created in the menu for quick access to admin dashboard?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v8, Linstafel/app/api/requests/admin/AdminLogin$$ExternalSyntheticLambda0;

    invoke-direct {v8, p0}, Linstafel/app/api/requests/admin/AdminLogin$$ExternalSyntheticLambda0;-><init>(Linstafel/app/api/requests/admin/AdminLogin;)V

    new-instance v9, Linstafel/app/api/requests/admin/AdminLogin$$ExternalSyntheticLambda1;

    invoke-direct {v9, p0}, Linstafel/app/api/requests/admin/AdminLogin$$ExternalSyntheticLambda1;-><init>(Linstafel/app/api/requests/admin/AdminLogin;)V

    const-string v4, "Welcome"

    const-string v6, "Yes"

    const-string v7, "No"

    invoke-static/range {v3 .. v9}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object v0

    .line 88
    iget-object v1, p0, Linstafel/app/api/requests/admin/AdminLogin;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v1}, Linstafel/app/utils/dialog/InstafelDialog;->hide()V

    .line 89
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AUTHENTICATION_REJECTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 91
    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminLogin;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->hide()V

    .line 92
    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminLogin;->activity:Landroid/app/Activity;

    const-string v1, "Error"

    const-string v2, "Authentication rejected, please check your credentials"

    invoke-static {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_1
    const-string v1, "instafelResponse is null on postExcute"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 22
    check-cast p1, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/admin/AdminLogin;->onPostExecute(Linstafel/app/api/models/InstafelResponse;)V

    return-void
.end method

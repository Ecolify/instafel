.class public Linstafel/app/api/requests/ApiGetAdmin;
.super Landroid/os/AsyncTask;
.source "ApiGetAdmin.java"


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
.field private apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

.field private pass:Ljava/lang/String;

.field private taskId:I

.field private uname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 20
    iput-object p1, p0, Linstafel/app/api/requests/ApiGetAdmin;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    .line 21
    iput p2, p0, Linstafel/app/api/requests/ApiGetAdmin;->taskId:I

    .line 22
    iput-object p3, p0, Linstafel/app/api/requests/ApiGetAdmin;->uname:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Linstafel/app/api/requests/ApiGetAdmin;->pass:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;
    .locals 4

    const-string v0, "Request failed with code "

    const/4 v1, 0x0

    .line 30
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 33
    const-string v2, "GET"

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 34
    const-string v2, "ifl-admin-username"

    iget-object v3, p0, Linstafel/app/api/requests/ApiGetAdmin;->uname:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v2, "ifl-admin-password"

    iget-object v3, p0, Linstafel/app/api/requests/ApiGetAdmin;->pass:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 39
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 41
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 44
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 47
    new-instance v0, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Linstafel/app/api/models/InstafelResponse;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 49
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

    .line 52
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 13
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/ApiGetAdmin;->doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Linstafel/app/api/models/InstafelResponse;)V
    .locals 2

    .line 60
    iget-object v0, p0, Linstafel/app/api/requests/ApiGetAdmin;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    if-eqz v0, :cond_0

    .line 61
    iget v1, p0, Linstafel/app/api/requests/ApiGetAdmin;->taskId:I

    invoke-interface {v0, p1, v1}, Linstafel/app/api/requests/ApiCallbackInterface;->getResponse(Linstafel/app/api/models/InstafelResponse;I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 13
    check-cast p1, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/ApiGetAdmin;->onPostExecute(Linstafel/app/api/models/InstafelResponse;)V

    return-void
.end method

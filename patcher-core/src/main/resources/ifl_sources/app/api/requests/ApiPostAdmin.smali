.class public Linstafel/app/api/requests/ApiPostAdmin;
.super Landroid/os/AsyncTask;
.source "ApiPostAdmin.java"


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

.field private requestBody:Lorg/json/JSONObject;

.field private taskId:I

.field private uname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 24
    iput-object p1, p0, Linstafel/app/api/requests/ApiPostAdmin;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    .line 25
    iput p2, p0, Linstafel/app/api/requests/ApiPostAdmin;->taskId:I

    .line 26
    iput-object p3, p0, Linstafel/app/api/requests/ApiPostAdmin;->uname:Ljava/lang/String;

    .line 27
    iput-object p4, p0, Linstafel/app/api/requests/ApiPostAdmin;->pass:Ljava/lang/String;

    .line 28
    iput-object p5, p0, Linstafel/app/api/requests/ApiPostAdmin;->requestBody:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;
    .locals 6

    const-string v0, "Request failed with code "

    const/4 v1, 0x0

    .line 35
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 37
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 38
    const-string v2, "POST"

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 39
    const-string v2, "ifl-admin-username"

    iget-object v4, p0, Linstafel/app/api/requests/ApiPostAdmin;->uname:Ljava/lang/String;

    invoke-virtual {p1, v2, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string v2, "ifl-admin-password"

    iget-object v4, p0, Linstafel/app/api/requests/ApiPostAdmin;->pass:Ljava/lang/String;

    invoke-virtual {p1, v2, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 41
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 43
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :try_start_1
    iget-object v4, p0, Linstafel/app/api/requests/ApiPostAdmin;->requestBody:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "utf-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 45
    array-length v5, v4

    invoke-virtual {v2, v4, v3, v5}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 46
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 48
    :cond_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_2

    .line 50
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 55
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 58
    new-instance v0, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Linstafel/app/api/models/InstafelResponse;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 60
    :cond_2
    const-string p1, "Instafel"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v1

    :catchall_0
    move-exception p1

    if-eqz v2, :cond_3

    .line 43
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    .line 63
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 16
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/ApiPostAdmin;->doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Linstafel/app/api/models/InstafelResponse;)V
    .locals 2

    .line 71
    iget-object v0, p0, Linstafel/app/api/requests/ApiPostAdmin;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    if-eqz v0, :cond_0

    .line 72
    iget v1, p0, Linstafel/app/api/requests/ApiPostAdmin;->taskId:I

    invoke-interface {v0, p1, v1}, Linstafel/app/api/requests/ApiCallbackInterface;->getResponse(Linstafel/app/api/models/InstafelResponse;I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 16
    check-cast p1, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/ApiPostAdmin;->onPostExecute(Linstafel/app/api/models/InstafelResponse;)V

    return-void
.end method

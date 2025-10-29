.class public Linstafel/app/api/requests/admin/AdminUploadMapping;
.super Landroid/os/AsyncTask;
.source "AdminUploadMapping.java"


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

.field private mappingFile:Ljava/io/File;

.field private pass:Ljava/lang/String;

.field private resp:Ljava/lang/String;

.field private taskId:I

.field private uname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 23
    iput-object p1, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    .line 24
    iput p2, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->taskId:I

    .line 25
    iput-object p3, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->uname:Ljava/lang/String;

    .line 26
    iput-object p4, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->pass:Ljava/lang/String;

    .line 27
    iput-object p5, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->mappingFile:Ljava/io/File;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;
    .locals 17

    move-object/from16 v1, p0

    .line 32
    const-string v0, "\""

    const-string v2, "--"

    .line 34
    :try_start_0
    const-string v4, "----WebKitFormBoundary7MA4YWxkTrZu0gW"

    .line 35
    const-string v5, "\r\n"

    .line 36
    new-instance v6, Ljava/net/URL;

    const/4 v7, 0x0

    aget-object v8, p1, v7

    invoke-direct {v6, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 38
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 39
    const-string v8, "POST"

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 40
    const-string v8, "ifl-admin-username"

    iget-object v9, v1, Linstafel/app/api/requests/admin/AdminUploadMapping;->uname:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string v8, "ifl-admin-password"

    iget-object v9, v1, Linstafel/app/api/requests/admin/AdminUploadMapping;->pass:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    const-string v8, "Content-Type"

    const-string v9, "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v8, 0x1

    .line 43
    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 45
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 46
    :try_start_1
    new-instance v10, Ljava/io/PrintWriter;

    new-instance v11, Ljava/io/OutputStreamWriter;

    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v11, v9, v12}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v10, v11, v8}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    .line 48
    :try_start_2
    invoke-virtual {v10, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 49
    const-string v11, "Content-Disposition: form-data; name=\"mapping\"; filename=\""

    invoke-virtual {v10, v11}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    iget-object v12, v1, Linstafel/app/api/requests/admin/AdminUploadMapping;->mappingFile:Ljava/io/File;

    .line 50
    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 51
    const-string v11, "Content-Type: application/json"

    invoke-virtual {v10, v11}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 52
    invoke-virtual {v10, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/PrintWriter;->flush()V

    .line 54
    new-instance v11, Ljava/io/FileInputStream;

    iget-object v12, v1, Linstafel/app/api/requests/admin/AdminUploadMapping;->mappingFile:Ljava/io/File;

    invoke-direct {v11, v12}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    const/16 v12, 0x1000

    .line 55
    :try_start_3
    new-array v12, v12, [B

    .line 57
    :goto_0
    invoke-virtual {v11, v12}, Ljava/io/FileInputStream;->read([B)I

    move-result v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/4 v14, -0x1

    if-eq v13, v14, :cond_0

    .line 58
    :try_start_4
    invoke-virtual {v9, v12, v7, v13}, Ljava/io/OutputStream;->write([BII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v2, v0

    const/16 v16, 0x0

    goto/16 :goto_3

    .line 60
    :cond_0
    :try_start_5
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 61
    :try_start_6
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V

    .line 63
    invoke-virtual {v10, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/PrintWriter;->flush()V

    const/4 v11, 0x2

    .line 65
    new-array v12, v11, [[Ljava/lang/String;

    new-array v13, v11, [Ljava/lang/String;

    const-string v14, "ig_version"

    aput-object v14, v13, v7

    sget-object v14, Linstafel/app/InstafelEnv;->IG_VERSION:Ljava/lang/String;

    aput-object v14, v13, v8

    aput-object v13, v12, v7

    new-array v13, v11, [Ljava/lang/String;

    const-string v14, "ifl_version"

    aput-object v14, v13, v7

    sget-object v14, Linstafel/app/InstafelEnv;->IFL_VERSION:Ljava/lang/String;

    aput-object v14, v13, v8

    aput-object v13, v12, v8

    move v13, v7

    :goto_1
    if-ge v13, v11, :cond_1

    .line 70
    aget-object v14, v12, v13

    .line 71
    invoke-virtual {v10, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 72
    const-string v15, "Content-Disposition: form-data; name=\""

    invoke-virtual {v10, v15}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v15
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    const/16 v16, 0x0

    :try_start_7
    aget-object v3, v14, v7

    invoke-virtual {v15, v3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 73
    invoke-virtual {v10, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 74
    aget-object v3, v14, v8

    invoke-virtual {v10, v3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    .line 77
    invoke-virtual {v10, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 78
    :try_start_8
    invoke-virtual {v10}, Ljava/io/PrintWriter;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    if-eqz v9, :cond_2

    :try_start_9
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 80
    :cond_2
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v2, 0xc8

    if-ne v0, v2, :cond_4

    .line 82
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    :goto_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 89
    :cond_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 90
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Linstafel/app/api/requests/admin/AdminUploadMapping;->resp:Ljava/lang/String;

    .line 91
    new-instance v0, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Linstafel/app/api/models/InstafelResponse;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 93
    :cond_4
    const-string v2, "Instafel"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Request failed with code "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    return-object v16

    :catchall_1
    move-exception v0

    const/16 v16, 0x0

    move-object v2, v0

    .line 54
    :goto_3
    :try_start_a
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v0

    :try_start_b
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception v0

    goto :goto_5

    :catchall_4
    move-exception v0

    const/16 v16, 0x0

    :goto_5
    move-object v2, v0

    .line 45
    :try_start_c
    invoke-virtual {v10}, Ljava/io/PrintWriter;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    goto :goto_6

    :catchall_5
    move-exception v0

    :try_start_d
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    :catchall_6
    move-exception v0

    goto :goto_7

    :catchall_7
    move-exception v0

    const/16 v16, 0x0

    :goto_7
    move-object v2, v0

    if-eqz v9, :cond_5

    :try_start_e
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    goto :goto_8

    :catchall_8
    move-exception v0

    :try_start_f
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_8
    throw v2
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    :catch_0
    move-exception v0

    goto :goto_9

    :catch_1
    move-exception v0

    const/16 v16, 0x0

    .line 96
    :goto_9
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v16
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/admin/AdminUploadMapping;->doInBackground([Ljava/lang/String;)Linstafel/app/api/models/InstafelResponse;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Linstafel/app/api/models/InstafelResponse;)V
    .locals 2

    .line 104
    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    if-eqz v0, :cond_0

    .line 105
    iget v1, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->taskId:I

    invoke-interface {v0, p1, v1}, Linstafel/app/api/requests/ApiCallbackInterface;->getResponse(Linstafel/app/api/models/InstafelResponse;I)V

    .line 106
    iget-object p1, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->apiCallbackInterface:Linstafel/app/api/requests/ApiCallbackInterface;

    iget-object v0, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->resp:Ljava/lang/String;

    iget v1, p0, Linstafel/app/api/requests/admin/AdminUploadMapping;->taskId:I

    invoke-interface {p1, v0, v1}, Linstafel/app/api/requests/ApiCallbackInterface;->getResponse(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 14
    check-cast p1, Linstafel/app/api/models/InstafelResponse;

    invoke-virtual {p0, p1}, Linstafel/app/api/requests/admin/AdminUploadMapping;->onPostExecute(Linstafel/app/api/models/InstafelResponse;)V

    return-void
.end method

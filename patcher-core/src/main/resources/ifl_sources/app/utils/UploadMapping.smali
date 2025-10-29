.class public Linstafel/app/utils/UploadMapping;
.super Ljava/lang/Object;
.source "UploadMapping.java"

# interfaces
.implements Linstafel/app/api/requests/ApiCallbackInterface;


# instance fields
.field private final BASE_URL:Ljava/lang/String;

.field private final LOG_TAG:Ljava/lang/String;

.field private aPassword:Ljava/lang/String;

.field private aUsername:Ljava/lang/String;

.field private final act:Landroid/app/Activity;

.field private newMappingHash:Ljava/lang/String;

.field private final overridesManager:Linstafel/app/managers/OverridesManager;

.field private final preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "https://api.mamii.me"

    iput-object v0, p0, Linstafel/app/utils/UploadMapping;->BASE_URL:Ljava/lang/String;

    .line 22
    const-string v0, "IFL_ADMIN_MPU"

    iput-object v0, p0, Linstafel/app/utils/UploadMapping;->LOG_TAG:Ljava/lang/String;

    .line 30
    iput-object p1, p0, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    .line 31
    new-instance v0, Linstafel/app/managers/OverridesManager;

    invoke-direct {v0, p1}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Linstafel/app/utils/UploadMapping;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 32
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p1}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/utils/UploadMapping;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 33
    invoke-direct {p0}, Linstafel/app/utils/UploadMapping;->startCheck()V

    return-void
.end method

.method private isUpdateNeeded()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 58
    iget-object v0, p0, Linstafel/app/utils/UploadMapping;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_mapping_file_hash:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 59
    iget-object v1, p0, Linstafel/app/utils/UploadMapping;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v1}, Linstafel/app/managers/OverridesManager;->getMappingFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 60
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    invoke-static {v1}, Linstafel/app/utils/GeneralFn;->getFileHash(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/utils/UploadMapping;->newMappingHash:Ljava/lang/String;

    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 61
    :cond_1
    :goto_0
    const-string v0, "IFL_ADMIN_MPU"

    const-string v1, "Mapping file isn\'t downloaded yet by MobileConfig, it will be checked in next start."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method private startCheck()V
    .locals 9

    .line 38
    const-string v0, "null"

    const-string v1, "IFL_ADMIN_MPU"

    const/4 v2, 0x1

    :try_start_0
    invoke-direct {p0}, Linstafel/app/utils/UploadMapping;->isUpdateNeeded()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 39
    const-string v3, "Mapping file uploading into repository"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    iget-object v3, p0, Linstafel/app/utils/UploadMapping;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v4, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Linstafel/app/utils/UploadMapping;->aUsername:Ljava/lang/String;

    .line 41
    iget-object v3, p0, Linstafel/app/utils/UploadMapping;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v4, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/utils/UploadMapping;->aPassword:Ljava/lang/String;

    .line 43
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 44
    const-string v0, "ig_version"

    sget-object v3, Linstafel/app/InstafelEnv;->IG_VERSION:Ljava/lang/String;

    invoke-virtual {v8, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    new-instance v3, Linstafel/app/api/requests/ApiPostAdmin;

    iget-object v6, p0, Linstafel/app/utils/UploadMapping;->aUsername:Ljava/lang/String;

    iget-object v7, p0, Linstafel/app/utils/UploadMapping;->aPassword:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v5, 0x11

    move-object v4, p0

    :try_start_1
    invoke-direct/range {v3 .. v8}, Linstafel/app/api/requests/ApiPostAdmin;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    new-array v0, v2, [Ljava/lang/String;

    const-string v5, "https://api.mamii.me/ifl/admin/user/mapping-is-exists"

    const/4 v6, 0x0

    aput-object v5, v0, v6

    invoke-virtual {v3, v0}, Linstafel/app/api/requests/ApiPostAdmin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_0
    move-object v4, p0

    return-void

    :catch_1
    move-exception v0

    move-object v4, p0

    .line 51
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 52
    const-string v0, "Error occurred while uploading mapping file into server."

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iget-object v1, v4, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method public getResponse(Linstafel/app/api/models/InstafelResponse;I)V
    .locals 8

    const/4 v0, 0x1

    if-eqz p1, :cond_6

    const/16 v1, 0xa

    if-eq p2, v1, :cond_4

    const/16 v1, 0x11

    if-eq p2, v1, :cond_0

    goto :goto_1

    .line 75
    :cond_0
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p2

    const/4 v1, 0x0

    const/4 v2, -0x1

    sparse-switch p2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string p2, "NOT_EXIST"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1
    const-string p2, "EXIST"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v0

    goto :goto_0

    :sswitch_2
    const-string p2, "FAILURE"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    const-string p1, "IFL_ADMIN_MPU"

    packed-switch v2, :pswitch_data_0

    :goto_1
    return-void

    .line 83
    :pswitch_0
    const-string p2, "Mapping uploading request is sending..."

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v2, Linstafel/app/api/requests/admin/AdminUploadMapping;

    iget-object v5, p0, Linstafel/app/utils/UploadMapping;->aUsername:Ljava/lang/String;

    iget-object v6, p0, Linstafel/app/utils/UploadMapping;->aPassword:Ljava/lang/String;

    iget-object p1, p0, Linstafel/app/utils/UploadMapping;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 85
    invoke-virtual {p1}, Linstafel/app/managers/OverridesManager;->getMappingFile()Ljava/io/File;

    move-result-object v7

    const/16 v4, 0xa

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Linstafel/app/api/requests/admin/AdminUploadMapping;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;)V

    new-array p1, v0, [Ljava/lang/String;

    const-string p2, "https://api.mamii.me/ifl/admin/user/upload-mapping"

    aput-object p2, p1, v1

    invoke-virtual {v2, p1}, Linstafel/app/api/requests/admin/AdminUploadMapping;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    :pswitch_1
    move-object v3, p0

    .line 77
    const-string p2, "Mapping already uploaded by other admin, don\'t needed."

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_2
    move-object v3, p0

    .line 80
    iget-object p1, v3, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    const-string p2, "Error while checking mapping status."

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_4
    move-object v3, p0

    .line 92
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SUCCESS"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 93
    iget-object p1, v3, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    const-string p2, "Mapping uploaded into server successfully."

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 94
    iget-object p1, v3, Linstafel/app/utils/UploadMapping;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object p2, Linstafel/app/utils/types/PreferenceKeys;->ifl_mapping_file_hash:Ljava/lang/String;

    iget-object v0, v3, Linstafel/app/utils/UploadMapping;->newMappingHash:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 96
    :cond_5
    iget-object p1, v3, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    const-string p2, "Error occurred while uploading mapping to server."

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_6
    move-object v3, p0

    .line 101
    iget-object p1, v3, Linstafel/app/utils/UploadMapping;->act:Landroid/app/Activity;

    const-string p2, "Error while parsing upload mapping response"

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x15f84296 -> :sswitch_2
        0x3f572d7 -> :sswitch_1
        0x3cf3f24b -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getResponse(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

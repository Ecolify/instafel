.class public Linstafel/app/api/models/AutoUpdateInfo;
.super Ljava/lang/Object;
.source "AutoUpdateInfo.java"


# instance fields
.field private backup_id:Ljava/lang/String;

.field private backup_name:Ljava/lang/String;

.field private current_backup_version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_id:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_name:Ljava/lang/String;

    .line 13
    iput p3, p0, Linstafel/app/api/models/AutoUpdateInfo;->current_backup_version:I

    return-void
.end method


# virtual methods
.method public exportAsJsonString()Ljava/lang/String;
    .locals 3

    .line 34
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 35
    const-string v1, "id"

    iget-object v2, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    const-string v1, "name"

    iget-object v2, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    const-string v1, "current_version"

    iget v2, p0, Linstafel/app/api/models/AutoUpdateInfo;->current_backup_version:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 38
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 40
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 41
    const-string v0, "CANNOT_BE_CONVERTED"

    return-object v0
.end method

.method public getBackup_id()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_id:Ljava/lang/String;

    return-object v0
.end method

.method public getBackup_name()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Linstafel/app/api/models/AutoUpdateInfo;->backup_name:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrent_backup_version()I
    .locals 1

    .line 21
    iget v0, p0, Linstafel/app/api/models/AutoUpdateInfo;->current_backup_version:I

    return v0
.end method

.method public setCurrent_backup_version(I)V
    .locals 0

    .line 29
    iput p1, p0, Linstafel/app/api/models/AutoUpdateInfo;->current_backup_version:I

    return-void
.end method

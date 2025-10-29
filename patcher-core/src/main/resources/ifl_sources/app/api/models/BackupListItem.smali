.class public Linstafel/app/api/models/BackupListItem;
.super Ljava/lang/Object;
.source "BackupListItem.java"


# instance fields
.field private author:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Linstafel/app/api/models/BackupListItem;->id:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Linstafel/app/api/models/BackupListItem;->name:Ljava/lang/String;

    .line 13
    iput-object p3, p0, Linstafel/app/api/models/BackupListItem;->author:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public convertForPutIntoActivity()Ljava/lang/String;
    .locals 3

    .line 30
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 31
    const-string v1, "id"

    iget-object v2, p0, Linstafel/app/api/models/BackupListItem;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    const-string v1, "author"

    iget-object v2, p0, Linstafel/app/api/models/BackupListItem;->author:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    const-string v1, "name"

    iget-object v2, p0, Linstafel/app/api/models/BackupListItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 37
    const-string v0, "CANNOT_BE_CONVERTED"

    return-object v0
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Linstafel/app/api/models/BackupListItem;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Linstafel/app/api/models/BackupListItem;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Linstafel/app/api/models/BackupListItem;->name:Ljava/lang/String;

    return-object v0
.end method

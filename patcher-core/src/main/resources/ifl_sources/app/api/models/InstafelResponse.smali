.class public Linstafel/app/api/models/InstafelResponse;
.super Ljava/lang/Object;
.source "InstafelResponse.java"


# instance fields
.field desc:Ljava/lang/String;

.field extra:Lorg/json/JSONObject;

.field parsedResult:Lorg/json/JSONObject;

.field status:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 25
    const-string v0, "extra"

    const-string v1, "desc"

    const-string v2, "status"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    .line 29
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 30
    iget-object p1, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/api/models/InstafelResponse;->status:Ljava/lang/String;

    .line 33
    :cond_0
    iget-object p1, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 34
    iget-object p1, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/api/models/InstafelResponse;->desc:Ljava/lang/String;

    .line 37
    :cond_1
    iget-object p1, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 38
    iget-object p1, p0, Linstafel/app/api/models/InstafelResponse;->parsedResult:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/api/models/InstafelResponse;->extra:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception p1

    .line 42
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Linstafel/app/api/models/InstafelResponse;->desc:Ljava/lang/String;

    return-object v0
.end method

.method public getExtra()Lorg/json/JSONObject;
    .locals 1

    .line 20
    iget-object v0, p0, Linstafel/app/api/models/InstafelResponse;->extra:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .line 12
    iget-object v0, p0, Linstafel/app/api/models/InstafelResponse;->status:Ljava/lang/String;

    return-object v0
.end method

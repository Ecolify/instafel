.class public Linstafel/app/utils/crashlog/Crashlog;
.super Ljava/lang/Object;
.source "Crashlog.java"


# instance fields
.field private appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

.field private crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

.field private date:Ljava/lang/Object;

.field private deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;


# direct methods
.method public constructor <init>(Linstafel/app/utils/crashlog/CLogDataTypes$AppData;Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;Ljava/lang/Object;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    .line 14
    iput-object p2, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    .line 15
    iput-object p3, p0, Linstafel/app/utils/crashlog/Crashlog;->crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    .line 16
    iput-object p4, p0, Linstafel/app/utils/crashlog/Crashlog;->date:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public convertToString()Ljava/lang/String;
    .locals 4

    .line 25
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 26
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 27
    const-string v2, "ifl_ver"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIfl_ver()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    const-string v2, "ig_ver"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    const-string v2, "ig_ver_code"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver_code()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    const-string v2, "ig_itype"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_itype()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    const-string v2, "appData"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 34
    const-string v2, "aver"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getAver()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v2, "sdk"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getSdk()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    const-string v2, "model"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getModel()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    const-string v2, "brand"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getBrand()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    const-string v2, "product"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getProduct()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    const-string v2, "deviceData"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 42
    const-string v2, "msg"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getMsg()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    const-string v2, "trace"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getTrace()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    const-string v2, "class"

    iget-object v3, p0, Linstafel/app/utils/crashlog/Crashlog;->crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getClassName()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    const-string v2, "crashData"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    const-string v1, "date"

    iget-object v2, p0, Linstafel/app/utils/crashlog/Crashlog;->date:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 52
    const-string v0, "ERROR_WHILE_CONVERTING_CRASHLOG"

    return-object v0
.end method

.method public getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;
    .locals 1

    .line 57
    iget-object v0, p0, Linstafel/app/utils/crashlog/Crashlog;->appData:Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    return-object v0
.end method

.method public getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;
    .locals 1

    .line 63
    iget-object v0, p0, Linstafel/app/utils/crashlog/Crashlog;->crashData:Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    return-object v0
.end method

.method public getDate()Ljava/lang/Object;
    .locals 1

    .line 20
    iget-object v0, p0, Linstafel/app/utils/crashlog/Crashlog;->date:Ljava/lang/Object;

    return-object v0
.end method

.method public getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;
    .locals 1

    .line 60
    iget-object v0, p0, Linstafel/app/utils/crashlog/Crashlog;->deviceData:Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    return-object v0
.end method

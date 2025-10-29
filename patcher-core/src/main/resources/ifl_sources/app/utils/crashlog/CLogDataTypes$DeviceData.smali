.class public Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;
.super Ljava/lang/Object;
.source "CLogDataTypes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/crashlog/CLogDataTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeviceData"
.end annotation


# instance fields
.field private aver:Ljava/lang/Object;

.field private brand:Ljava/lang/Object;

.field private model:Ljava/lang/Object;

.field private product:Ljava/lang/Object;

.field private sdk:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->aver:Ljava/lang/Object;

    .line 57
    iput-object p2, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->sdk:Ljava/lang/Object;

    .line 58
    iput-object p3, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->model:Ljava/lang/Object;

    .line 59
    iput-object p4, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->brand:Ljava/lang/Object;

    .line 60
    iput-object p5, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->product:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getAver()Ljava/lang/Object;
    .locals 1

    .line 64
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->aver:Ljava/lang/Object;

    return-object v0
.end method

.method public getBrand()Ljava/lang/Object;
    .locals 1

    .line 73
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->brand:Ljava/lang/Object;

    return-object v0
.end method

.method public getModel()Ljava/lang/Object;
    .locals 1

    .line 70
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->model:Ljava/lang/Object;

    return-object v0
.end method

.method public getProduct()Ljava/lang/Object;
    .locals 1

    .line 76
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->product:Ljava/lang/Object;

    return-object v0
.end method

.method public getSdk()Ljava/lang/Object;
    .locals 1

    .line 67
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->sdk:Ljava/lang/Object;

    return-object v0
.end method

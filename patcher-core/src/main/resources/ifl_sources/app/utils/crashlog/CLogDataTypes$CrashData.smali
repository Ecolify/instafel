.class public Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;
.super Ljava/lang/Object;
.source "CLogDataTypes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/crashlog/CLogDataTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CrashData"
.end annotation


# instance fields
.field private className:Ljava/lang/Object;

.field private date:Ljava/lang/Object;

.field private msg:Ljava/lang/Object;

.field private trace:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->msg:Ljava/lang/Object;

    .line 9
    iput-object p2, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->trace:Ljava/lang/Object;

    .line 10
    iput-object p3, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->className:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/Object;
    .locals 1

    .line 20
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->className:Ljava/lang/Object;

    return-object v0
.end method

.method public getDate()Ljava/lang/Object;
    .locals 1

    .line 23
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->date:Ljava/lang/Object;

    return-object v0
.end method

.method public getMsg()Ljava/lang/Object;
    .locals 1

    .line 14
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->msg:Ljava/lang/Object;

    return-object v0
.end method

.method public getTrace()Ljava/lang/Object;
    .locals 1

    .line 17
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->trace:Ljava/lang/Object;

    return-object v0
.end method

.class public Linstafel/app/utils/crashlog/CLogDataTypes$AppData;
.super Ljava/lang/Object;
.source "CLogDataTypes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/crashlog/CLogDataTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppData"
.end annotation


# instance fields
.field private ifl_ver:Ljava/lang/Object;

.field private ig_itype:Ljava/lang/Object;

.field private ig_ver:Ljava/lang/Object;

.field private ig_ver_code:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ifl_ver:Ljava/lang/Object;

    .line 32
    iput-object p2, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_ver:Ljava/lang/Object;

    .line 33
    iput-object p3, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_ver_code:Ljava/lang/Object;

    .line 34
    iput-object p4, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_itype:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getIfl_ver()Ljava/lang/Object;
    .locals 1

    .line 38
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ifl_ver:Ljava/lang/Object;

    return-object v0
.end method

.method public getIg_itype()Ljava/lang/Object;
    .locals 1

    .line 47
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_itype:Ljava/lang/Object;

    return-object v0
.end method

.method public getIg_ver()Ljava/lang/Object;
    .locals 1

    .line 41
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_ver:Ljava/lang/Object;

    return-object v0
.end method

.method public getIg_ver_code()Ljava/lang/Object;
    .locals 1

    .line 44
    iget-object v0, p0, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->ig_ver_code:Ljava/lang/Object;

    return-object v0
.end method

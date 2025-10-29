.class public Linstafel/app/managers/modals/FlagItem;
.super Ljava/lang/Object;
.source "FlagItem.java"


# instance fields
.field private desc:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Linstafel/app/managers/modals/FlagItem;->id:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Linstafel/app/managers/modals/FlagItem;->name:Ljava/lang/String;

    .line 11
    iput-object p3, p0, Linstafel/app/managers/modals/FlagItem;->desc:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Linstafel/app/managers/modals/FlagItem;->desc:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Linstafel/app/managers/modals/FlagItem;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Linstafel/app/managers/modals/FlagItem;->name:Ljava/lang/String;

    return-object v0
.end method

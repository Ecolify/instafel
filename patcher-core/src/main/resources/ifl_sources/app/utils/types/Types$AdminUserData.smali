.class public Linstafel/app/utils/types/Types$AdminUserData;
.super Ljava/lang/Object;
.source "Types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/types/Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdminUserData"
.end annotation


# instance fields
.field password:Ljava/lang/String;

.field username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Linstafel/app/utils/types/Types$AdminUserData;->username:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Linstafel/app/utils/types/Types$AdminUserData;->password:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Linstafel/app/utils/types/Types$AdminUserData;->password:Ljava/lang/String;

    invoke-static {v0}, Linstafel/app/utils/GeneralFn;->decodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Linstafel/app/utils/types/Types$AdminUserData;->username:Ljava/lang/String;

    invoke-static {v0}, Linstafel/app/utils/GeneralFn;->decodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

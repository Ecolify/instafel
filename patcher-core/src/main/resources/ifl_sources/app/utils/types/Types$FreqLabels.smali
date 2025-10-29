.class public Linstafel/app/utils/types/Types$FreqLabels;
.super Ljava/lang/Object;
.source "Types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/types/Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FreqLabels"
.end annotation


# static fields
.field public static EVERY_DAY:I = 0x2

.field public static EVERY_OPEN:I = 0x0

.field public static NEVER:I = 0x1

.field public static ONCE_A_WEEK:I = 0x5

.field public static ONCE_IN_FIVE_DAYS:I = 0x4

.field public static ONCE_IN_THREE_DAYS:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

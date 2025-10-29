.class public Linstafel/app/utils/dialog/InstafelDialogMargins;
.super Ljava/lang/Object;
.source "InstafelDialogMargins.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private end:I

.field private start:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;II)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->activity:Landroid/app/Activity;

    .line 24
    iput p2, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->start:I

    .line 25
    iput p3, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->end:I

    return-void
.end method

.method private convert(I)I
    .locals 2

    int-to-float p1, p1

    .line 19
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method


# virtual methods
.method public getEnd()I
    .locals 1

    .line 15
    iget v0, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->end:I

    invoke-direct {p0, v0}, Linstafel/app/utils/dialog/InstafelDialogMargins;->convert(I)I

    move-result v0

    return v0
.end method

.method public getStart()I
    .locals 1

    .line 11
    iget v0, p0, Linstafel/app/utils/dialog/InstafelDialogMargins;->start:I

    invoke-direct {p0, v0}, Linstafel/app/utils/dialog/InstafelDialogMargins;->convert(I)I

    move-result v0

    return v0
.end method

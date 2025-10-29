.class public Linstafel/app/managers/AttributeManager;
.super Ljava/lang/Object;
.source "AttributeManager.java"


# static fields
.field public static ifl_attr_ui_enableIcon:I = 0x9

.field public static ifl_attr_ui_enableSubIcon:I = 0x5

.field public static ifl_attr_ui_iconPadding:I = 0x8

.field public static ifl_attr_ui_iconRes:I = 0x2

.field public static ifl_attr_ui_iconResTint:I = 0x7

.field public static ifl_attr_ui_spaceBottom:I = 0x3

.field public static ifl_attr_ui_spaceTop:I = 0x4

.field public static ifl_attr_ui_subIconRes:I = 0x6

.field public static ifl_attr_ui_subtitleText:I = 0x1

.field public static ifl_attr_ui_titleText:I


# instance fields
.field private attrs:Landroid/util/AttributeSet;

.field private ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Linstafel/app/managers/AttributeManager;->ctx:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Linstafel/app/managers/AttributeManager;->attrs:Landroid/util/AttributeSet;

    return-void
.end method

.method private getTypedArray(I)Landroid/content/res/TypedArray;
    .locals 3

    const/4 v0, 0x1

    .line 30
    new-array v0, v0, [I

    const/16 v1, 0x72

    const/4 v2, 0x0

    .line 31
    aput v1, v0, v2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 61
    :pswitch_0
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_enableIcon:I

    aput p1, v0, v2

    goto :goto_0

    .line 58
    :pswitch_1
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_iconPadding:I

    aput p1, v0, v2

    goto :goto_0

    .line 55
    :pswitch_2
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_iconResTint:I

    aput p1, v0, v2

    goto :goto_0

    .line 52
    :pswitch_3
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_subIconRes:I

    aput p1, v0, v2

    goto :goto_0

    .line 49
    :pswitch_4
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_enableSubIcon:I

    aput p1, v0, v2

    goto :goto_0

    .line 46
    :pswitch_5
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_spaceTop:I

    aput p1, v0, v2

    goto :goto_0

    .line 43
    :pswitch_6
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_spaceBottom:I

    aput p1, v0, v2

    goto :goto_0

    .line 40
    :pswitch_7
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_iconRes:I

    aput p1, v0, v2

    goto :goto_0

    .line 37
    :pswitch_8
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_subtitleText:I

    aput p1, v0, v2

    goto :goto_0

    .line 34
    :pswitch_9
    sget p1, Linstafel/app/R$attr;->ifl_attr_ui_titleText:I

    aput p1, v0, v2

    .line 64
    :goto_0
    iget-object p1, p0, Linstafel/app/managers/AttributeManager;->ctx:Landroid/content/Context;

    iget-object v1, p0, Linstafel/app/managers/AttributeManager;->attrs:Landroid/util/AttributeSet;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getBoolean(IZ)Z
    .locals 1

    .line 85
    invoke-direct {p0, p1}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    return p1
.end method

.method public getInteger(II)I
    .locals 1

    .line 81
    invoke-direct {p0, p1}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p1

    return p1
.end method

.method public getResourceId(II)I
    .locals 1

    .line 89
    invoke-direct {p0, p1}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1

    .line 73
    invoke-direct {p0, p1}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public recycleTypedArray()V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, v0}, Linstafel/app/managers/AttributeManager;->getTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

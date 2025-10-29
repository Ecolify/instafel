.class public Linstafel/app/ui/TileCompact;
.super Landroidx/cardview/widget/CardView;
.source "TileCompact.java"


# instance fields
.field private iconView:Landroid/widget/ImageView;

.field private spaceBottom:Landroid/widget/Space;

.field private spaceTop:Landroid/widget/Space;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, v0}, Linstafel/app/ui/TileCompact;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    invoke-direct {p0, p1, p2}, Linstafel/app/ui/TileCompact;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 32
    sget v0, Linstafel/app/R$layout;->ifl_ui_tilecompact:I

    invoke-static {p1, v0, p0}, Linstafel/app/ui/TileCompact;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    sget v0, Linstafel/app/R$id;->ifl_ui_icon:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileCompact;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Linstafel/app/ui/TileCompact;->iconView:Landroid/widget/ImageView;

    .line 34
    sget v0, Linstafel/app/R$id;->ifl_ui_title:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileCompact;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/ui/TileCompact;->titleView:Landroid/widget/TextView;

    .line 35
    sget v0, Linstafel/app/R$id;->ifl_ui_space_top:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileCompact;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileCompact;->spaceTop:Landroid/widget/Space;

    .line 36
    sget v0, Linstafel/app/R$id;->ifl_ui_space_bottom:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileCompact;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileCompact;->spaceBottom:Landroid/widget/Space;

    if-eqz p2, :cond_0

    .line 38
    new-instance v0, Linstafel/app/managers/AttributeManager;

    invoke-direct {v0, p1, p2}, Linstafel/app/managers/AttributeManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_titleText:I

    const-string p2, "ifl_ui"

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileCompact;->setTitleText(Ljava/lang/String;)V

    .line 40
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconRes:I

    sget p2, Linstafel/app/R$drawable;->ifl_android:I

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getResourceId(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileCompact;->setIconRes(I)V

    .line 41
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceTop:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileCompact;->setSpaceTop(Ljava/lang/String;)V

    .line 42
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceBottom:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileCompact;->setSpaceBottom(Ljava/lang/String;)V

    .line 43
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconPadding:I

    iget-object p2, p0, Linstafel/app/ui/TileCompact;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result p2

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getInteger(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileCompact;->setIconPadding(I)V

    .line 44
    invoke-virtual {v0}, Linstafel/app/managers/AttributeManager;->recycleTypedArray()V

    :cond_0
    return-void
.end method


# virtual methods
.method public setIconPadding(I)V
    .locals 1

    .line 58
    invoke-virtual {p0}, Linstafel/app/ui/TileCompact;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    .line 60
    iget-object v0, p0, Linstafel/app/ui/TileCompact;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    return-void
.end method

.method public setIconRes(I)V
    .locals 1

    .line 64
    iget-object v0, p0, Linstafel/app/ui/TileCompact;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setSpaceBottom(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 85
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "visible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1
    const-string v0, "gone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_2
    const-string v0, "invisible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 90
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceBottom:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 87
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceBottom:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 93
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceBottom:Landroid/widget/Space;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    :cond_3
    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x715b4053 -> :sswitch_2
        0x30809f -> :sswitch_1
        0x1bd1f072 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setSpaceTop(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 69
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "visible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1
    const-string v0, "gone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_2
    const-string v0, "invisible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 74
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceTop:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 71
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceTop:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 77
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->spaceTop:Landroid/widget/Space;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    :cond_3
    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x715b4053 -> :sswitch_2
        0x30809f -> :sswitch_1
        0x1bd1f072 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setTitleText(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 50
    iget-object v0, p0, Linstafel/app/ui/TileCompact;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 52
    :cond_0
    iget-object p1, p0, Linstafel/app/ui/TileCompact;->titleView:Landroid/widget/TextView;

    const-string v0, "Title"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

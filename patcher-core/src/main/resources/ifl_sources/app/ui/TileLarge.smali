.class public Linstafel/app/ui/TileLarge;
.super Landroidx/cardview/widget/CardView;
.source "TileLarge.java"


# instance fields
.field private iconView:Landroid/widget/ImageView;

.field private spaceBottom:Landroid/widget/Space;

.field private spaceTop:Landroid/widget/Space;

.field private subIconView:Landroid/widget/ImageView;

.field private subtitleView:Landroid/widget/TextView;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, v0}, Linstafel/app/ui/TileLarge;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    invoke-direct {p0, p1, p2}, Linstafel/app/ui/TileLarge;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 32
    sget v0, Linstafel/app/R$layout;->ifl_ui_tilelarge:I

    invoke-static {p1, v0, p0}, Linstafel/app/ui/TileLarge;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    sget v0, Linstafel/app/R$id;->ifl_ui_icon:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    .line 34
    sget v0, Linstafel/app/R$id;->ifl_ui_title:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->titleView:Landroid/widget/TextView;

    .line 35
    sget v0, Linstafel/app/R$id;->ifl_ui_subtitle:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->subtitleView:Landroid/widget/TextView;

    .line 36
    sget v0, Linstafel/app/R$id;->ifl_ui_space_top:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->spaceTop:Landroid/widget/Space;

    .line 37
    sget v0, Linstafel/app/R$id;->ifl_ui_space_bottom:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->spaceBottom:Landroid/widget/Space;

    .line 38
    sget v0, Linstafel/app/R$id;->ifl_ui_subicon:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLarge;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    if-eqz p2, :cond_0

    .line 40
    new-instance v0, Linstafel/app/managers/AttributeManager;

    invoke-direct {v0, p1, p2}, Linstafel/app/managers/AttributeManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_titleText:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 42
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_subtitleText:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 43
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconRes:I

    sget p2, Linstafel/app/R$drawable;->ifl_android:I

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getResourceId(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setIconRes(I)V

    .line 44
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceTop:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setSpaceTop(Ljava/lang/String;)V

    .line 45
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceBottom:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 46
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_enableSubIcon:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 47
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_subIconRes:I

    sget p2, Linstafel/app/R$drawable;->ifl_android:I

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getResourceId(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setSubIconRes(I)V

    .line 48
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconResTint:I

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getBoolean(IZ)Z

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setIconTint(Z)V

    .line 49
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconPadding:I

    const/4 p2, 0x4

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getInteger(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setIconPadding(I)V

    .line 50
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_enableIcon:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLarge;->setIconVisibility(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Linstafel/app/managers/AttributeManager;->recycleTypedArray()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getSubtitle()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->subtitleView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onClick()V
    .locals 0

    return-void
.end method

.method public setIconPadding(I)V
    .locals 1

    .line 83
    invoke-virtual {p0}, Linstafel/app/ui/TileLarge;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    .line 85
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    return-void
.end method

.method public setIconRes(I)V
    .locals 1

    .line 148
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setIconTint(Z)V
    .locals 1

    if-nez p1, :cond_0

    .line 90
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setIconVisibility(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "visible"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1
    const-string v1, "gone"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_2
    const-string v1, "invisible"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return-void

    .line 101
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 98
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 104
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 108
    :cond_3
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

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

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 56
    new-instance v0, Linstafel/app/ui/TileLarge$1;

    invoke-direct {v0, p0, p1}, Linstafel/app/ui/TileLarge$1;-><init>(Linstafel/app/ui/TileLarge;Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v1, p0, Linstafel/app/ui/TileLarge;->subtitleView:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    invoke-super {p0, v0}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setSpaceBottom(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 173
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

    .line 178
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceBottom:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 175
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceBottom:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 181
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceBottom:Landroid/widget/Space;

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

    .line 157
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

    .line 162
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceTop:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 159
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceTop:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 165
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->spaceTop:Landroid/widget/Space;

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

.method public setSubIconRes(I)V
    .locals 1

    .line 152
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setSubtitleText(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 141
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->subtitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 143
    :cond_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->subtitleView:Landroid/widget/TextView;

    const-string v0, "Subtitle"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitleText(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 132
    iget-object v0, p0, Linstafel/app/ui/TileLarge;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 134
    :cond_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->titleView:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public setVisiblitySubIcon(Ljava/lang/String;)V
    .locals 4

    const/16 v0, 0x8

    if-eqz p1, :cond_3

    .line 114
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "visible"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_1
    const-string v1, "gone"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x1

    goto :goto_0

    :sswitch_2
    const-string v1, "invisible"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v3, v2

    :goto_0
    packed-switch v3, :pswitch_data_0

    return-void

    .line 119
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 116
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 122
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 126
    :cond_3
    iget-object p1, p0, Linstafel/app/ui/TileLarge;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

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

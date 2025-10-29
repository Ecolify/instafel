.class public Linstafel/app/ui/TileLargeEditText;
.super Landroidx/cardview/widget/CardView;
.source "TileLargeEditText.java"


# instance fields
.field private editTextView:Landroid/widget/EditText;

.field private iconView:Landroid/widget/ImageView;

.field private spaceBottom:Landroid/widget/Space;

.field private spaceTop:Landroid/widget/Space;

.field private subIconView:Landroid/widget/ImageView;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 25
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Linstafel/app/ui/TileLargeEditText;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-direct {p0, p1, p2}, Linstafel/app/ui/TileLargeEditText;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 35
    sget v0, Linstafel/app/R$layout;->ifl_ui_tilelarge_edittext:I

    invoke-static {p1, v0, p0}, Linstafel/app/ui/TileLargeEditText;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 36
    sget v0, Linstafel/app/R$id;->ifl_ui_icon:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    .line 37
    sget v0, Linstafel/app/R$id;->ifl_ui_title:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->titleView:Landroid/widget/TextView;

    .line 38
    sget v0, Linstafel/app/R$id;->ifl_ui_space_top:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->spaceTop:Landroid/widget/Space;

    .line 39
    sget v0, Linstafel/app/R$id;->ifl_ui_space_bottom:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->spaceBottom:Landroid/widget/Space;

    .line 40
    sget v0, Linstafel/app/R$id;->ifl_ui_subicon:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

    .line 41
    sget v0, Linstafel/app/R$id;->ifl_edittext:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileLargeEditText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Linstafel/app/ui/TileLargeEditText;->editTextView:Landroid/widget/EditText;

    if-eqz p2, :cond_0

    .line 43
    new-instance v0, Linstafel/app/managers/AttributeManager;

    invoke-direct {v0, p1, p2}, Linstafel/app/managers/AttributeManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_titleText:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setTitleText(Ljava/lang/String;)V

    .line 45
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_subtitleText:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setEditTextHint(Ljava/lang/String;)V

    .line 46
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconRes:I

    sget p2, Linstafel/app/R$drawable;->ifl_android:I

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getResourceId(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setIconRes(I)V

    .line 47
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceTop:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setSpaceTop(Ljava/lang/String;)V

    .line 48
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceBottom:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setSpaceBottom(Ljava/lang/String;)V

    .line 49
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_enableSubIcon:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 50
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_subIconRes:I

    sget p2, Linstafel/app/R$drawable;->ifl_android:I

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getResourceId(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setSubIconRes(I)V

    .line 51
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconResTint:I

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getBoolean(IZ)Z

    move-result p1

    invoke-direct {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setIconTint(Z)V

    .line 52
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_iconPadding:I

    const/4 p2, 0x4

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getInteger(II)I

    move-result p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setIconPadding(I)V

    .line 53
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_enableIcon:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileLargeEditText;->setIconVisibility(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v0}, Linstafel/app/managers/AttributeManager;->recycleTypedArray()V

    :cond_0
    return-void
.end method

.method private setIconTint(Z)V
    .locals 1

    if-nez p1, :cond_0

    .line 71
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getEditTextView()Landroid/widget/EditText;
    .locals 1

    .line 121
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->editTextView:Landroid/widget/EditText;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setEditTextHint(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 126
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->editTextView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    return-void

    .line 128
    :cond_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->editTextView:Landroid/widget/EditText;

    const-string v0, "Subtitle"

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setIconPadding(I)V
    .locals 1

    .line 64
    invoke-virtual {p0}, Linstafel/app/ui/TileLargeEditText;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    .line 66
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    return-void
.end method

.method public setIconRes(I)V
    .locals 1

    .line 137
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setIconViewAsBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 133
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public setIconVisibility(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 77
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

    .line 82
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 79
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 85
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 89
    :cond_3
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->iconView:Landroid/widget/ImageView;

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

.method public setSpaceBottom(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 162
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

    .line 167
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceBottom:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 164
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceBottom:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 170
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceBottom:Landroid/widget/Space;

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

    .line 146
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

    .line 151
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceTop:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 148
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceTop:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 154
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->spaceTop:Landroid/widget/Space;

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

    .line 141
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setTitleText(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 113
    iget-object v0, p0, Linstafel/app/ui/TileLargeEditText;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 115
    :cond_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->titleView:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public setVisiblitySubIcon(Ljava/lang/String;)V
    .locals 4

    const/16 v0, 0x8

    if-eqz p1, :cond_3

    .line 95
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

    .line 100
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 97
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 103
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    .line 107
    :cond_3
    iget-object p1, p0, Linstafel/app/ui/TileLargeEditText;->subIconView:Landroid/widget/ImageView;

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

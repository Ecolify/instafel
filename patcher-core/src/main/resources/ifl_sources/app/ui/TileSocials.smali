.class public Linstafel/app/ui/TileSocials;
.super Landroidx/cardview/widget/CardView;
.source "TileSocials.java"


# instance fields
.field private spaceBottom:Landroid/widget/Space;

.field private spaceTop:Landroid/widget/Space;

.field private tileChat:Landroidx/cardview/widget/CardView;

.field private tileGithub:Landroidx/cardview/widget/CardView;

.field private tileGuide:Landroidx/cardview/widget/CardView;

.field private tileInfo:Landroidx/cardview/widget/CardView;

.field private tileLanguage:Landroidx/cardview/widget/CardView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 18
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, v0}, Linstafel/app/ui/TileSocials;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-direct {p0, p1, p2}, Linstafel/app/ui/TileSocials;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 28
    sget v0, Linstafel/app/R$layout;->ifl_ui_tilesocials:I

    invoke-static {p1, v0, p0}, Linstafel/app/ui/TileSocials;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    sget v0, Linstafel/app/R$id;->ifl_ui_space_top:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->spaceTop:Landroid/widget/Space;

    .line 30
    sget v0, Linstafel/app/R$id;->ifl_ui_space_bottom:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->spaceBottom:Landroid/widget/Space;

    .line 31
    sget v0, Linstafel/app/R$id;->ifl_tiles_chat:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->tileChat:Landroidx/cardview/widget/CardView;

    .line 32
    sget v0, Linstafel/app/R$id;->ifl_tiles_language:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->tileLanguage:Landroidx/cardview/widget/CardView;

    .line 33
    sget v0, Linstafel/app/R$id;->ifl_tiles_about:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->tileInfo:Landroidx/cardview/widget/CardView;

    .line 34
    sget v0, Linstafel/app/R$id;->ifl_tiles_guide:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->tileGuide:Landroidx/cardview/widget/CardView;

    .line 35
    sget v0, Linstafel/app/R$id;->ifl_tiles_github:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileSocials;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Linstafel/app/ui/TileSocials;->tileGithub:Landroidx/cardview/widget/CardView;

    if-eqz p2, :cond_0

    .line 37
    new-instance v0, Linstafel/app/managers/AttributeManager;

    invoke-direct {v0, p1, p2}, Linstafel/app/managers/AttributeManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceTop:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileSocials;->setSpaceTop(Ljava/lang/String;)V

    .line 39
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_spaceBottom:I

    invoke-virtual {v0, p1}, Linstafel/app/managers/AttributeManager;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileSocials;->setSpaceBottom(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v0}, Linstafel/app/managers/AttributeManager;->recycleTypedArray()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getTileChat()Landroidx/cardview/widget/CardView;
    .locals 1

    .line 45
    iget-object v0, p0, Linstafel/app/ui/TileSocials;->tileChat:Landroidx/cardview/widget/CardView;

    return-object v0
.end method

.method public getTileGithub()Landroidx/cardview/widget/CardView;
    .locals 1

    .line 49
    iget-object v0, p0, Linstafel/app/ui/TileSocials;->tileGithub:Landroidx/cardview/widget/CardView;

    return-object v0
.end method

.method public getTileGuide()Landroidx/cardview/widget/CardView;
    .locals 1

    .line 61
    iget-object v0, p0, Linstafel/app/ui/TileSocials;->tileGuide:Landroidx/cardview/widget/CardView;

    return-object v0
.end method

.method public getTileInfo()Landroidx/cardview/widget/CardView;
    .locals 1

    .line 57
    iget-object v0, p0, Linstafel/app/ui/TileSocials;->tileInfo:Landroidx/cardview/widget/CardView;

    return-object v0
.end method

.method public getTileLanguage()Landroidx/cardview/widget/CardView;
    .locals 1

    .line 53
    iget-object v0, p0, Linstafel/app/ui/TileSocials;->tileLanguage:Landroidx/cardview/widget/CardView;

    return-object v0
.end method

.method public setSpaceBottom(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 82
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

    .line 87
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceBottom:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 84
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceBottom:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 90
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceBottom:Landroid/widget/Space;

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

    .line 66
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

    .line 71
    :pswitch_0
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceTop:Landroid/widget/Space;

    invoke-virtual {p1, v1}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 68
    :pswitch_1
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceTop:Landroid/widget/Space;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Space;->setVisibility(I)V

    return-void

    .line 74
    :pswitch_2
    iget-object p1, p0, Linstafel/app/ui/TileSocials;->spaceTop:Landroid/widget/Space;

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

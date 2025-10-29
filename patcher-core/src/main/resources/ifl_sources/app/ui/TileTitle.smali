.class public Linstafel/app/ui/TileTitle;
.super Landroidx/cardview/widget/CardView;
.source "TileTitle.java"


# instance fields
.field private textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 17
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Linstafel/app/ui/TileTitle;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    invoke-virtual {p0, p1, p2}, Linstafel/app/ui/TileTitle;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public getText()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 27
    sget v0, Linstafel/app/R$layout;->ifl_ui_tiletitle:I

    invoke-static {p1, v0, p0}, Linstafel/app/ui/TileTitle;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 28
    sget v0, Linstafel/app/R$id;->ifl_ui_text:I

    invoke-virtual {p0, v0}, Linstafel/app/ui/TileTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    if-eqz p2, :cond_0

    .line 30
    new-instance v0, Linstafel/app/managers/AttributeManager;

    invoke-direct {v0, p1, p2}, Linstafel/app/managers/AttributeManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    sget p1, Linstafel/app/managers/AttributeManager;->ifl_attr_ui_titleText:I

    const-string p2, "ifl_ui"

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/AttributeManager;->getString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/ui/TileTitle;->setText(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v0}, Linstafel/app/managers/AttributeManager;->recycleTypedArray()V

    :cond_0
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    .line 46
    iget-object v0, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTopPadding(Z)V
    .locals 4

    if-nez p1, :cond_0

    .line 38
    iget-object p1, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v0

    iget-object v1, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v1

    iget-object v2, p0, Linstafel/app/ui/TileTitle;->textView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    :cond_0
    return-void
.end method

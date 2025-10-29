.class public Linstafel/app/ui/PageContentArea;
.super Landroid/widget/LinearLayout;
.source "PageContentArea.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 3

    .line 28
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 30
    invoke-virtual {p0}, Linstafel/app/ui/PageContentArea;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Linstafel/app/R$layout;->ifl_ui_pagecontentarea:I

    invoke-static {v0, v1, p0}, Linstafel/app/ui/PageContentArea;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    sget v1, Linstafel/app/R$id;->ifl_ui_content_area:I

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 32
    :goto_0
    invoke-virtual {p0}, Linstafel/app/ui/PageContentArea;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    const/4 v1, 0x0

    .line 33
    invoke-virtual {p0, v1}, Linstafel/app/ui/PageContentArea;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 34
    invoke-virtual {p0, v1}, Linstafel/app/ui/PageContentArea;->removeView(Landroid/view/View;)V

    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    return-void
.end method

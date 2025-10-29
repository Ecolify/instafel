.class public Linstafel/app/utils/dialog/InstafelDialog;
.super Ljava/lang/Object;
.source "InstafelDialog.java"


# instance fields
.field private act:Landroid/app/Activity;

.field private dialog:Landroid/app/Dialog;

.field private dialogItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Linstafel/app/utils/dialog/InstafelDialogItem;",
            ">;"
        }
    .end annotation
.end field

.field private dialogMainArea:Landroid/widget/LinearLayout;

.field private dialogRoot:Landroidx/cardview/widget/CardView;

.field private dialogThemeMode:I

.field private uiMode:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->uiMode:I

    .line 34
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    .line 39
    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    .line 40
    new-instance p1, Landroid/app/Dialog;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    .line 41
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {p1, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 42
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    sget v2, Linstafel/app/R$drawable;->ifl_dg_ota_background:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 44
    invoke-direct {p0}, Linstafel/app/utils/dialog/InstafelDialog;->setBaseLayout()V

    return-void
.end method

.method static synthetic access$000(Linstafel/app/utils/dialog/InstafelDialog;)Landroid/app/Dialog;
    .locals 0

    .line 28
    iget-object p0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    return-object p0
.end method

.method private addComponentsIntoDialog()V
    .locals 3

    const/4 v0, 0x0

    .line 402
    :goto_0
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 403
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Added "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialogItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " view into dialog."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Instafel"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 404
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialogItem;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 406
    :cond_0
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->addView(Landroid/view/View;)V

    .line 407
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public static createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 149
    new-instance v5, Linstafel/app/utils/dialog/InstafelDialog$2;

    invoke-direct {v5, p0}, Linstafel/app/utils/dialog/InstafelDialog$2;-><init>(Landroid/app/Activity;)V

    const/4 v6, 0x0

    const-string v3, "Okay"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object p0

    .line 162
    invoke-virtual {p0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method

.method public static createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 166
    const-string v3, "Okay"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object p0

    .line 174
    invoke-virtual {p0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method

.method public static createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;
    .locals 8

    .line 178
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 179
    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 180
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 v1, 0x0

    invoke-direct {v6, p0, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_title"

    const/16 v3, 0x1e

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 187
    const-string p1, "mid_space"

    const/16 v7, 0x14

    invoke-virtual {v0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 188
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 p1, 0x18

    invoke-direct {v6, p0, p1, p1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_desc"

    const/16 v3, 0x10

    const/16 v4, 0x136

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    move-object p0, v0

    .line 195
    const-string p1, "button_top_space"

    invoke-virtual {p0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    if-eqz p3, :cond_0

    if-eqz p4, :cond_0

    .line 197
    const-string p1, "buttons"

    move-object p2, p3

    move-object p3, p4

    move-object p4, p5

    move-object p5, p6

    invoke-virtual/range {p0 .. p5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    move-object p2, p3

    move-object p3, p4

    move-object p4, p5

    move-object p5, p6

    if-eqz p2, :cond_1

    const/4 p3, 0x0

    const/4 p5, 0x0

    .line 199
    const-string p1, "buttons"

    invoke-virtual/range {p0 .. p5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    const/4 p2, 0x0

    const/4 p4, 0x0

    .line 201
    const-string p1, "buttons"

    invoke-virtual/range {p0 .. p5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 203
    :cond_2
    :goto_0
    const-string p1, "bottom_space"

    const/16 p2, 0x1b

    invoke-virtual {p0, p1, p2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    return-object p0
.end method

.method public static createSimpleInputDialog_String(Landroid/app/Activity;Ljava/lang/String;Z)Linstafel/app/utils/dialog/StringInputViews;
    .locals 8

    .line 84
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 85
    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 86
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7, v7}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_title"

    const/16 v3, 0x1e

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 93
    const-string p1, "mid_space"

    const/16 v1, 0x14

    invoke-virtual {v0, p1, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 94
    new-instance p1, Landroid/widget/EditText;

    invoke-direct {p1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 95
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x136

    .line 96
    invoke-static {p0, v3}, Linstafel/app/utils/GeneralFn;->convertToDp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xf

    .line 99
    invoke-virtual {v2, v3, v7, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 100
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    sget v2, Linstafel/app/R$drawable;->ifl_edittext_background:I

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 102
    const-string v2, "Enter new value"

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/16 v2, 0x1e

    const/16 v3, 0x18

    .line 103
    invoke-virtual {p1, v2, v2, v7, v3}, Landroid/widget/EditText;->setPadding(IIII)V

    const/high16 v2, 0x41700000    # 15.0f

    const/4 v3, 0x2

    .line 104
    invoke-virtual {p1, v3, v2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 105
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->getDialogThemeMode()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 106
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_black:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 107
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_white:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setHighlightColor(I)V

    .line 108
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_sub_line_light:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 109
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v2, Linstafel/app/R$color;->ifl_white:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setLinkTextColor(I)V

    goto :goto_0

    .line 111
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_white:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_black:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setHighlightColor(I)V

    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_sub_line:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 114
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v2, Linstafel/app/R$color;->ifl_black:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setLinkTextColor(I)V

    :goto_0
    if-eqz p2, :cond_1

    const p0, 0x20001

    .line 117
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setInputType(I)V

    const/4 p0, 0x5

    .line 118
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 119
    new-instance p0, Linstafel/app/utils/dialog/InstafelDialog$1;

    invoke-direct {p0, p1}, Linstafel/app/utils/dialog/InstafelDialog$1;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    goto :goto_1

    :cond_1
    const/4 p0, 0x1

    .line 133
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setInputType(I)V

    const/4 p0, 0x6

    .line 134
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 136
    :goto_1
    const-string p0, "edit_text"

    invoke-virtual {v0, p0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 144
    const-string p0, "button_top_space"

    invoke-virtual {v0, p0, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 145
    new-instance p0, Linstafel/app/utils/dialog/StringInputViews;

    invoke-direct {p0, p1, v0}, Linstafel/app/utils/dialog/StringInputViews;-><init>(Landroid/widget/EditText;Linstafel/app/utils/dialog/InstafelDialog;)V

    return-object p0
.end method

.method private generateButton(Ljava/lang/String;I)Landroid/widget/LinearLayout;
    .locals 8

    .line 260
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 261
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    .line 262
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 267
    new-instance v1, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v1, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0xc

    .line 268
    invoke-virtual {p0, v4}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v5

    invoke-virtual {p0, v4}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v6

    invoke-virtual {p0, v4}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v7

    invoke-virtual {p0, v4}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v4

    invoke-virtual {v1, v5, v6, v7, v4}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 269
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v4, 0x2

    if-nez p2, :cond_1

    .line 274
    iget v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne v5, v4, :cond_0

    .line 275
    iget-object v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Linstafel/app/R$drawable;->ifl_button_secondary_background_light:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 277
    :cond_0
    iget-object v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Linstafel/app/R$drawable;->ifl_button_secondary_background_dark:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 280
    :cond_1
    iget v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne v5, v4, :cond_2

    .line 281
    iget-object v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Linstafel/app/R$drawable;->ifl_button_primary_background_light:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 283
    :cond_2
    iget-object v5, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Linstafel/app/R$drawable;->ifl_button_primary_background_dark:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 287
    :goto_0
    new-instance v5, Landroid/widget/TextView;

    iget-object v6, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 288
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xd

    .line 293
    invoke-virtual {p0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginStart(I)V

    .line 294
    invoke-virtual {p0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    const/16 v2, 0x9

    .line 295
    invoke-virtual {p1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 296
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 p1, 0x41400000    # 12.0f

    .line 297
    invoke-virtual {v5, v4, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    if-nez p2, :cond_4

    .line 299
    iget p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne p1, v4, :cond_3

    .line 300
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Linstafel/app/R$color;->ifl_black:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 302
    :cond_3
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Linstafel/app/R$color;->ifl_white:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 305
    :cond_4
    iget p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne p1, v4, :cond_5

    .line 306
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Linstafel/app/R$color;->ifl_background_color_light:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 308
    :cond_5
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Linstafel/app/R$color;->ifl_background_color:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 312
    :goto_1
    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 313
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private setBaseLayout()V
    .locals 6

    .line 411
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-static {v0}, Linstafel/app/utils/GeneralFn;->getUiMode(Landroid/app/Activity;)I

    move-result v0

    .line 413
    new-instance v1, Landroidx/cardview/widget/CardView;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    .line 414
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    .line 419
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/cardview/widget/CardView;->setId(I)V

    .line 420
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/4 v3, 0x1

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v3, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 421
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v4, -0x1

    invoke-direct {v1, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 425
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v3, v5, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 427
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogRoot:Landroidx/cardview/widget/CardView;

    invoke-virtual {v2, v1}, Landroidx/cardview/widget/CardView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 431
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setId(I)V

    .line 432
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 433
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 434
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 440
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_tile_color_light:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    goto :goto_0

    .line 442
    :cond_0
    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogMainArea:Landroid/widget/LinearLayout;

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linstafel/app/R$color;->ifl_tile_color:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 445
    :goto_0
    iput v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    .line 447
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Content view\'in temas\u0131 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " olarak ayarlandi."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Instafel"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public addCustomView(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 342
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/View;->setId(I)V

    .line 343
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    new-instance v1, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-direct {v1, p1, p2}, Linstafel/app/utils/dialog/InstafelDialogItem;-><init>(Ljava/lang/String;Landroid/view/View;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .locals 4

    .line 209
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 210
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    const/4 v1, 0x0

    .line 211
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    if-eqz p2, :cond_1

    const/4 v2, 0x1

    .line 214
    invoke-direct {p0, p2, v2}, Linstafel/app/utils/dialog/InstafelDialog;->generateButton(Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object v2

    if-nez p4, :cond_0

    .line 216
    new-instance p4, Linstafel/app/utils/dialog/InstafelDialog$3;

    invoke-direct {p4, p0}, Linstafel/app/utils/dialog/InstafelDialog$3;-><init>(Linstafel/app/utils/dialog/InstafelDialog;)V

    invoke-virtual {v2, p4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 223
    :cond_0
    invoke-virtual {v2, p4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 229
    new-instance p2, Landroid/widget/Space;

    iget-object p4, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {p2, p4}, Landroid/widget/Space;-><init>(Landroid/content/Context;)V

    .line 230
    new-instance p4, Landroid/view/ViewGroup$LayoutParams;

    const/16 v2, 0x14

    .line 231
    invoke-virtual {p0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {p4, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 230
    invoke-virtual {p2, p4}, Landroid/widget/Space;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 234
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    if-eqz p3, :cond_4

    .line 238
    invoke-direct {p0, p3, v1}, Linstafel/app/utils/dialog/InstafelDialog;->generateButton(Ljava/lang/String;I)Landroid/widget/LinearLayout;

    move-result-object p2

    if-nez p5, :cond_3

    .line 240
    new-instance p3, Linstafel/app/utils/dialog/InstafelDialog$4;

    invoke-direct {p3, p0}, Linstafel/app/utils/dialog/InstafelDialog$4;-><init>(Linstafel/app/utils/dialog/InstafelDialog;)V

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 247
    :cond_3
    invoke-virtual {p2, p5}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    :goto_1
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 252
    :cond_4
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    new-instance p3, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-direct {p3, p1, v0}, Linstafel/app/utils/dialog/InstafelDialogItem;-><init>(Ljava/lang/String;Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addSpace(Ljava/lang/String;I)V
    .locals 4

    .line 73
    new-instance v0, Landroid/widget/Space;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Space;-><init>(Landroid/content/Context;)V

    .line 74
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float p2, p2

    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    .line 76
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3, p2, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    float-to-int p2, p2

    const/4 v2, -0x1

    invoke-direct {v1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/Space;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    new-instance v1, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-direct {v1, p1, v0}, Linstafel/app/utils/dialog/InstafelDialogItem;-><init>(Ljava/lang/String;Landroid/view/View;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V
    .locals 4

    .line 347
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 348
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    const/4 v1, 0x4

    .line 349
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 350
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p2, p3

    const/4 p3, 0x2

    .line 351
    invoke-virtual {v0, p3, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 352
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 357
    const-string v1, "dialog_desc_left"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x5

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAlignment(I)V

    :cond_0
    const/4 v1, 0x1

    if-eqz p4, :cond_1

    .line 362
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float p4, p4

    iget-object v3, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    .line 363
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, p4, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p4

    float-to-int p4, p4

    invoke-direct {p2, p4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 368
    :cond_1
    invoke-virtual {p6}, Linstafel/app/utils/dialog/InstafelDialogMargins;->getStart()I

    move-result p4

    invoke-virtual {p2, p4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 369
    invoke-virtual {p6}, Linstafel/app/utils/dialog/InstafelDialogMargins;->getEnd()I

    move-result p4

    invoke-virtual {p2, p4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 370
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    sget p2, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    if-ne p5, p2, :cond_3

    .line 373
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 375
    iget p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne p2, p3, :cond_2

    .line 376
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_black:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 378
    :cond_2
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_white:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 380
    :cond_3
    sget p2, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    if-ne p5, p2, :cond_5

    .line 381
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p2

    const/4 p4, 0x0

    invoke-virtual {v0, p2, p4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 383
    iget p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne p2, p3, :cond_4

    .line 384
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_sub_line_light:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 386
    :cond_4
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_sub_line:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 388
    :cond_5
    sget p2, Linstafel/app/utils/dialog/InstafelDialogTextType;->SUBTEXT:I

    if-ne p5, p2, :cond_7

    .line 389
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 391
    iget p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    if-ne p2, p3, :cond_6

    .line 392
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_sub_line_light:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 394
    :cond_6
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Linstafel/app/R$color;->ifl_sub_line:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 398
    :cond_7
    :goto_0
    iget-object p2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    new-instance p3, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-direct {p3, p1, v0}, Linstafel/app/utils/dialog/InstafelDialogItem;-><init>(Ljava/lang/String;Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public cancel()V
    .locals 1

    .line 48
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method public convertToDp(I)I
    .locals 2

    int-to-float p1, p1

    .line 451
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->act:Landroid/app/Activity;

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

.method public dismiss()V
    .locals 1

    .line 52
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method public getDialogThemeMode()I
    .locals 1

    .line 318
    iget v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogThemeMode:I

    return v0
.end method

.method public getTextView(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 333
    :goto_0
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 334
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialogItem;->getName()Ljava/lang/String;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 335
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialogItem;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getView(Ljava/lang/String;)Landroid/view/View;
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 323
    :goto_0
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 324
    iget-object v2, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialogItem;->getName()Ljava/lang/String;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 325
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialogItems:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/dialog/InstafelDialogItem;

    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialogItem;->getView()Landroid/view/View;

    move-result-object v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public hide()V
    .locals 1

    .line 60
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    return-void
.end method

.method public isShowing()Z
    .locals 1

    .line 56
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    return v0
.end method

.method public show()V
    .locals 1

    .line 65
    :try_start_0
    invoke-direct {p0}, Linstafel/app/utils/dialog/InstafelDialog;->addComponentsIntoDialog()V

    .line 66
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

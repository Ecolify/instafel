.class public Linstafel/app/utils/dialog/StringInputViews;
.super Ljava/lang/Object;
.source "StringInputViews.java"


# instance fields
.field private editText:Landroid/widget/EditText;

.field private instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Linstafel/app/utils/dialog/StringInputViews;->editText:Landroid/widget/EditText;

    .line 12
    iput-object p2, p0, Linstafel/app/utils/dialog/StringInputViews;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    return-void
.end method


# virtual methods
.method public getEditText()Landroid/widget/EditText;
    .locals 1

    .line 16
    iget-object v0, p0, Linstafel/app/utils/dialog/StringInputViews;->editText:Landroid/widget/EditText;

    return-object v0
.end method

.method public getInstafelDialog()Linstafel/app/utils/dialog/InstafelDialog;
    .locals 1

    .line 20
    iget-object v0, p0, Linstafel/app/utils/dialog/StringInputViews;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    return-object v0
.end method

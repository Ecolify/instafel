.class Linstafel/app/utils/dialog/InstafelDialog$1;
.super Ljava/lang/Object;
.source "InstafelDialog.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/utils/dialog/InstafelDialog;->createSimpleInputDialog_String(Landroid/app/Activity;Ljava/lang/String;Z)Linstafel/app/utils/dialog/StringInputViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$inputEditText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 119
    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog$1;->val$inputEditText:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x6

    if-eq p2, p1, :cond_1

    .line 123
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    .line 124
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 126
    :cond_1
    :goto_0
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog$1;->val$inputEditText:Landroid/widget/EditText;

    const-string p2, "\n"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    return p1
.end method

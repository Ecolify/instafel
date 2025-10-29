.class Linstafel/app/utils/dialog/InstafelDialog$4;
.super Ljava/lang/Object;
.source "InstafelDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method constructor <init>(Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0

    .line 240
    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog$4;->this$0:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 243
    iget-object p1, p0, Linstafel/app/utils/dialog/InstafelDialog$4;->this$0:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-static {p1}, Linstafel/app/utils/dialog/InstafelDialog;->access$000(Linstafel/app/utils/dialog/InstafelDialog;)Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.class public final synthetic Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda0;->f$0:Linstafel/app/utils/dialog/InstafelDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 0
    iget-object v0, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda0;->f$0:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-static {v0, p1}, Linstafel/app/ota/CheckUpdates;->lambda$showBackupUpdateDialog$1(Linstafel/app/utils/dialog/InstafelDialog;Landroid/view/View;)V

    return-void
.end method

.class public final synthetic Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/utils/dialog/InstafelDialog;

.field public final synthetic f$1:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;->f$0:Linstafel/app/utils/dialog/InstafelDialog;

    iput-object p2, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;->f$1:Linstafel/app/managers/PreferenceManager;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;->f$0:Linstafel/app/utils/dialog/InstafelDialog;

    iget-object v1, p0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;->f$1:Linstafel/app/managers/PreferenceManager;

    invoke-static {v0, v1, p1}, Linstafel/app/ota/CheckUpdates;->lambda$showWelcomeDialog$3(Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;Landroid/view/View;)V

    return-void
.end method

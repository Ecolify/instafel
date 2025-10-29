.class public final synthetic Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/activity/admin/ifl_a_admin_pref_manager;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/activity/admin/ifl_a_admin_pref_manager;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/admin/ifl_a_admin_pref_manager;

    iput-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-object p4, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$3:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 7

    .line 0
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/admin/ifl_a_admin_pref_manager;

    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-object v3, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;->f$3:Landroid/widget/EditText;

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->lambda$setEditorAction$0$instafel-app-activity-admin-ifl_a_admin_pref_manager(Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

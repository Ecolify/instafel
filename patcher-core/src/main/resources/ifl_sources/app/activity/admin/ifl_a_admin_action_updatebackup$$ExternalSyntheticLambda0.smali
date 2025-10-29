.class public final synthetic Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

.field public final synthetic f$1:Linstafel/app/api/models/BackupListItem;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;Linstafel/app/api/models/BackupListItem;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iput-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;->f$1:Linstafel/app/api/models/BackupListItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;->f$1:Linstafel/app/api/models/BackupListItem;

    invoke-virtual {v0, v1, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->lambda$listItems$0$instafel-app-activity-admin-ifl_a_admin_action_updatebackup(Linstafel/app/api/models/BackupListItem;Landroid/view/View;)V

    return-void
.end method

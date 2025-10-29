.class Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$1;
.super Ljava/lang/Object;
.source "ifl_a_admin_action_updatebackup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->getResponse(Linstafel/app/api/models/InstafelResponse;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;


# direct methods
.method constructor <init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;)V
    .locals 0

    .line 123
    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$1;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 126
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$1;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-virtual {p1}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void
.end method

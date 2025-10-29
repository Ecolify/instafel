.class Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;
.super Ljava/lang/Object;
.source "ifl_a_admin_action_approvepreview.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->showDialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;

.field final synthetic val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method constructor <init>(Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;

    iput-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 125
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 126
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;

    invoke-virtual {p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->finish()V

    return-void
.end method

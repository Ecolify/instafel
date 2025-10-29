.class public final synthetic Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

.field public final synthetic f$1:Linstafel/app/utils/crashlog/Crashlog;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/activity/crash_manager/ifl_a_crash_reports;Linstafel/app/utils/crashlog/Crashlog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    iput-object p2, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;->f$1:Linstafel/app/utils/crashlog/Crashlog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    iget-object v1, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;->f$1:Linstafel/app/utils/crashlog/Crashlog;

    invoke-virtual {v0, v1, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->lambda$onCreate$0$instafel-app-activity-crash_manager-ifl_a_crash_reports(Linstafel/app/utils/crashlog/Crashlog;Landroid/view/View;)V

    return-void
.end method

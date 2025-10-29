.class Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;
.super Ljava/lang/Object;
.source "ifl_a_crash_reports.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;


# direct methods
.method constructor <init>(Linstafel/app/activity/crash_manager/ifl_a_crash_reports;)V
    .locals 0

    .line 44
    iput-object p1, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;->this$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 47
    iget-object p1, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;->this$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    invoke-static {p1}, Linstafel/app/managers/CrashManager;->removeReports(Landroid/content/Context;)V

    .line 48
    iget-object p1, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;->this$0:Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    invoke-virtual {p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->recreate()V

    return-void
.end method

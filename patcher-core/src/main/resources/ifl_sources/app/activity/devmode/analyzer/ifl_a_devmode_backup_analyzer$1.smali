.class Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;
.super Ljava/lang/Object;
.source "ifl_a_devmode_backup_analyzer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;

.field final synthetic val$finalErrorString:Ljava/lang/String;

.field final synthetic val$finalSuccessTasks:I


# direct methods
.method constructor <init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 200
    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;

    iput p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->val$finalSuccessTasks:I

    iput-object p3, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->val$finalErrorString:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 203
    iget v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->val$finalSuccessTasks:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 204
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;

    iget-object v1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;->val$finalErrorString:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

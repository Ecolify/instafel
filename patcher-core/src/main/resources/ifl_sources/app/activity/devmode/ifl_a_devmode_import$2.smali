.class Linstafel/app/activity/devmode/ifl_a_devmode_import$2;
.super Ljava/lang/Object;
.source "ifl_a_devmode_import.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/devmode/ifl_a_devmode_import;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;


# direct methods
.method constructor <init>(Linstafel/app/activity/devmode/ifl_a_devmode_import;)V
    .locals 0

    .line 55
    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 58
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    iget-object p1, p1, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1}, Linstafel/app/managers/OverridesManager;->createMappingFileDebug()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 60
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    const-string v1, "Created"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 62
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    const-string v1, "Couldn\'t created"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return v0
.end method

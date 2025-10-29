.class Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;
.super Ljava/lang/Object;
.source "ifl_a_devmode_backup_comparator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;


# direct methods
.method constructor <init>(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)V
    .locals 0

    .line 54
    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 60
    :try_start_0
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-static {v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$000(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)Linstafel/app/managers/OverridesManager;

    move-result-object v0

    invoke-virtual {v0}, Linstafel/app/managers/OverridesManager;->existsMappingFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-virtual {v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 62
    iget-object v1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "backup1"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$102(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 63
    iget-object v1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "backup2"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$202(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 64
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-static {v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$000(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)Linstafel/app/managers/OverridesManager;

    move-result-object v1

    iget-object v2, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-static {v2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$000(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)Linstafel/app/managers/OverridesManager;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/managers/OverridesManager;->readMappingFile()Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v1, v2}, Linstafel/app/managers/OverridesManager;->parseMappingFile(Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v0, v1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->access$302(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    return-void

    .line 69
    :cond_0
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    sget v1, Linstafel/app/R$string;->ifl_a11_34:I

    invoke-virtual {v0, v1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 73
    iget-object v1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;->this$0:Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    sget v2, Linstafel/app/R$string;->ifl_a11_77:I

    invoke-virtual {v1, v2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->getString(I)Ljava/lang/String;

    .line 74
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

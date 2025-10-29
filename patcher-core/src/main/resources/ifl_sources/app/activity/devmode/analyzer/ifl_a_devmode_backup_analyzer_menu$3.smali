.class Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;
.super Ljava/lang/Object;
.source "ifl_a_devmode_backup_analyzer_menu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;


# direct methods
.method constructor <init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)V
    .locals 0

    .line 69
    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 73
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 75
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-static {v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->access$000(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Lorg/json/JSONObject;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "override"

    if-eqz v0, :cond_0

    .line 76
    :try_start_1
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-static {v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->access$000(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 78
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    :goto_0
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-static {v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->access$100(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Landroid/net/Uri;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v1, "mapping"

    if-eqz v0, :cond_1

    .line 82
    :try_start_2
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-static {v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->access$100(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 84
    :cond_1
    const-string v0, "NOT_ANY_MAPPING_SELECTED"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    :goto_1
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    const-class v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Linstafel/app/utils/GeneralFn;->startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 89
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 90
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    sget v0, Linstafel/app/R$string;->ifl_a11_37:I

    invoke-virtual {p1, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

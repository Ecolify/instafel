.class Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$2;
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

    .line 59
    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$2;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 62
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 63
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 64
    const-string v0, "application/json"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$2;->this$0:Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    const/16 v1, 0x16

    invoke-virtual {v0, p1, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

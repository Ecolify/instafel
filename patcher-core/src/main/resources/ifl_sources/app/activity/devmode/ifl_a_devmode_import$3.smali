.class Linstafel/app/activity/devmode/ifl_a_devmode_import$3;
.super Ljava/lang/Object;
.source "ifl_a_devmode_import.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 68
    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$3;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 71
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 72
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    const-string v0, "application/json"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    iget-object v0, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$3;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    const/16 v1, 0x1d

    invoke-virtual {v0, p1, v1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

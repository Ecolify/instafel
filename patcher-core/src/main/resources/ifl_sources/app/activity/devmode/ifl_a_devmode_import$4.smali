.class Linstafel/app/activity/devmode/ifl_a_devmode_import$4;
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

    .line 78
    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$4;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 81
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 82
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    iget-object v0, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import$4;->this$0:Linstafel/app/activity/devmode/ifl_a_devmode_import;

    const/16 v1, 0x16

    invoke-virtual {v0, p1, v1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

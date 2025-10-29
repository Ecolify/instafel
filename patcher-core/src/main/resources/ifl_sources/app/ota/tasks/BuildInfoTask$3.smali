.class Linstafel/app/ota/tasks/BuildInfoTask$3;
.super Ljava/lang/Object;
.source "BuildInfoTask.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/ota/tasks/BuildInfoTask;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/ota/tasks/BuildInfoTask;

.field final synthetic val$dialog1:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Linstafel/app/ota/tasks/BuildInfoTask;Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 210
    iput-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$3;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iput-object p2, p0, Linstafel/app/ota/tasks/BuildInfoTask$3;->val$dialog1:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 213
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$3;->val$dialog1:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

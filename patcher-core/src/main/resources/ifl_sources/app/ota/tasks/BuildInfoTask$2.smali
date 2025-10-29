.class Linstafel/app/ota/tasks/BuildInfoTask$2;
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


# direct methods
.method constructor <init>(Linstafel/app/ota/tasks/BuildInfoTask;)V
    .locals 0

    .line 193
    iput-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$2;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 196
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$2;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object p1, p1, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    return-void
.end method

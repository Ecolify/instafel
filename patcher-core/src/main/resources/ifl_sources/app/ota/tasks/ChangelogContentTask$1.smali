.class Linstafel/app/ota/tasks/ChangelogContentTask$1;
.super Ljava/lang/Object;
.source "ChangelogContentTask.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/ota/tasks/ChangelogContentTask;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/ota/tasks/ChangelogContentTask;

.field final synthetic val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field final synthetic val$preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method constructor <init>(Linstafel/app/ota/tasks/ChangelogContentTask;Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 87
    iput-object p1, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->this$0:Linstafel/app/ota/tasks/ChangelogContentTask;

    iput-object p2, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    iput-object p3, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->val$preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 90
    iget-object p1, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 91
    iget-object p1, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->val$preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_clog_last_shown_version:Ljava/lang/String;

    iget-object v1, p0, Linstafel/app/ota/tasks/ChangelogContentTask$1;->this$0:Linstafel/app/ota/tasks/ChangelogContentTask;

    invoke-static {v1}, Linstafel/app/ota/tasks/ChangelogContentTask;->access$000(Linstafel/app/ota/tasks/ChangelogContentTask;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceInt(Ljava/lang/String;I)V

    return-void
.end method

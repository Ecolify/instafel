.class Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;
.super Ljava/lang/Object;
.source "ifl_a_admin_action_updatebackup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->triggerEditPage(Linstafel/app/api/models/BackupListItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field requestLimit:Z

.field final synthetic this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

.field final synthetic val$backupList:Linstafel/app/api/models/BackupListItem;


# direct methods
.method constructor <init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;Linstafel/app/api/models/BackupListItem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 175
    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iput-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->val$backupList:Linstafel/app/api/models/BackupListItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 176
    iput-boolean p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->requestLimit:Z

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 181
    const-string p1, "def"

    const-string v0, "info"

    const/4 v1, 0x0

    :try_start_0
    iget-boolean v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->requestLimit:Z

    if-nez v2, :cond_1

    .line 182
    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v2, v2, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v3, v3, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->defaultBackupFile:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 183
    new-instance v8, Lorg/json/JSONObject;

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v2, v2, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->backup:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v8, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    iget-object v4, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->val$backupList:Linstafel/app/api/models/BackupListItem;

    invoke-virtual {v4}, Linstafel/app/api/models/BackupListItem;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "name"

    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "author"

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    new-instance v3, Linstafel/app/api/requests/ApiPostAdmin;

    iget-object v4, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v0, v4, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    invoke-virtual {v0, v2, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v0, v0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    invoke-virtual {v0, v2, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v5, 0x11

    invoke-direct/range {v3 .. v8}, Linstafel/app/api/requests/ApiPostAdmin;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    const/4 p1, 0x1

    .line 189
    new-array p1, p1, [Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-static {v2}, Linstafel/app/utils/GeneralFn;->getApiUrl(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/admin/user/update_backup"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v1

    invoke-virtual {v3, p1}, Linstafel/app/api/requests/ApiPostAdmin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 190
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-direct {v0, v2}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object v0, p1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    .line 191
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object p1, p1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v0, "top_space"

    const/16 v2, 0x19

    invoke-virtual {p1, v0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 192
    new-instance p1, Linstafel/app/ui/LoadingBar;

    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-direct {p1, v0}, Linstafel/app/ui/LoadingBar;-><init>(Landroid/content/Context;)V

    .line 193
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v3, -0x2

    invoke-direct {v0, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 194
    iget-object v3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-virtual {v3}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c80000    # 25.0f

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float/2addr v3, v4

    float-to-int v3, v3

    .line 195
    invoke-virtual {v0, v3, v1, v3, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 196
    invoke-virtual {p1, v0}, Linstafel/app/ui/LoadingBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object v0, v0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v3, "loading_bar"

    invoke-virtual {v0, v3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 198
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object p1, p1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v0, "button_top_space"

    invoke-virtual {p1, v0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 199
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    iget-object p1, p1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void

    .line 201
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    const-string v0, "Please select backup file"

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 204
    :cond_1
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    const-string v0, "Request already send"

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 207
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;->this$0:Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    const-string v2, "Error while sending request"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 208
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

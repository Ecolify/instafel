.class public Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_admin_action_updatebackup.java"

# interfaces
.implements Linstafel/app/api/requests/ApiCallbackInterface;


# instance fields
.field areaContent:Linstafel/app/ui/PageContentArea;

.field areaEdit:Linstafel/app/ui/PageContentArea;

.field areaLoading:Linstafel/app/ui/PageContentArea;

.field backup:Lorg/json/JSONObject;

.field buttonUpdate:Landroid/widget/LinearLayout;

.field buttonUpdateText:Landroid/widget/TextView;

.field defaultBackupFile:Ljava/lang/String;

.field instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

.field layoutBackups:Landroid/widget/LinearLayout;

.field overridesManager:Linstafel/app/managers/OverridesManager;

.field preferenceManager:Linstafel/app/managers/PreferenceManager;

.field selectionBackup:Linstafel/app/ui/TileLarge;

.field selectionChangelog:Linstafel/app/ui/TileLarge;

.field selectionVersionName:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 51
    const-string v0, "Click for select new backup file"

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->defaultBackupFile:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getResponse(Linstafel/app/api/models/InstafelResponse;I)V
    .locals 11

    const-string v0, "Unknown status, "

    const/16 v1, 0x13

    .line 80
    const-string v2, "SUCCESS"

    const/4 v3, 0x0

    if-ne p2, v1, :cond_4

    .line 81
    const-string p2, "Error while getting backups from API"

    if-eqz p1, :cond_3

    .line 83
    :try_start_0
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 84
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getExtra()Lorg/json/JSONObject;

    move-result-object p1

    .line 85
    const-string v0, "listed_backups"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move v1, v3

    .line 87
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 88
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 89
    new-instance v4, Linstafel/app/api/models/BackupListItem;

    const-string v5, "id"

    .line 91
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "name"

    .line 92
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "author"

    .line 93
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v5, v6, v2}, Linstafel/app/api/models/BackupListItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->listItems(Ljava/util/List;)V

    return-void

    .line 99
    :cond_1
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object v1

    const-string v2, "INSUFFICIENT_AUTHORITY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 100
    const-string p1, "You don\'t have UPDATE_BACKUP permission"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 101
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void

    .line 103
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 104
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 107
    invoke-static {p0, p2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 108
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 109
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void

    .line 112
    :cond_3
    invoke-static {p0, p2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 113
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void

    :cond_4
    const/16 v0, 0x11

    if-ne p2, v0, :cond_7

    if-eqz p1, :cond_6

    .line 117
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 118
    new-instance v9, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$1;

    invoke-direct {v9, p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$1;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;)V

    const/4 v10, 0x0

    const-string v5, "Request Send"

    const-string v6, "Request send to Instafel API, you can check TG Admin group for more details."

    const-string v7, "Okay"

    const/4 v8, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v10}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object p1

    .line 131
    iget-object p2, v4, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->instafelDialogMain:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p2}, Linstafel/app/utils/dialog/InstafelDialog;->hide()V

    .line 132
    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void

    :cond_5
    move-object v4, p0

    .line 134
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Error: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 135
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void

    :cond_6
    move-object v4, p0

    .line 138
    const-string p1, "Error while sending request to API"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 139
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->finish()V

    return-void

    :cond_7
    move-object v4, p0

    return-void
.end method

.method public getResponse(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method synthetic lambda$listItems$0$instafel-app-activity-admin-ifl_a_admin_action_updatebackup(Linstafel/app/api/models/BackupListItem;Landroid/view/View;)V
    .locals 0

    .line 152
    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->triggerEditPage(Linstafel/app/api/models/BackupListItem;)V

    return-void
.end method

.method synthetic lambda$triggerEditPage$1$instafel-app-activity-admin-ifl_a_admin_action_updatebackup(Landroid/view/View;)V
    .locals 1

    .line 169
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 170
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 171
    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0xf

    .line 172
    invoke-virtual {p0, p1, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public listItems(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Linstafel/app/api/models/BackupListItem;",
            ">;)V"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x0

    move v1, v0

    .line 146
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 147
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/api/models/BackupListItem;

    .line 149
    new-instance v3, Linstafel/app/ui/TileCompact;

    invoke-direct {v3, p0}, Linstafel/app/ui/TileCompact;-><init>(Landroid/content/Context;)V

    .line 150
    sget v4, Linstafel/app/R$drawable;->ifl_backup:I

    invoke-virtual {v3, v4}, Linstafel/app/ui/TileCompact;->setIconRes(I)V

    .line 151
    invoke-virtual {v2}, Linstafel/app/api/models/BackupListItem;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Linstafel/app/ui/TileCompact;->setTitleText(Ljava/lang/String;)V

    .line 152
    new-instance v4, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v2}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;Linstafel/app/api/models/BackupListItem;)V

    invoke-virtual {v3, v4}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 156
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaLoading:Linstafel/app/ui/PageContentArea;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 157
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaContent:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p1, v0}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 216
    const-string v0, "info"

    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0xf

    if-eq p1, p2, :cond_0

    return-void

    :cond_0
    if-eqz p3, :cond_1

    .line 221
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    const/4 p2, 0x0

    if-nez p1, :cond_2

    .line 227
    const-string p1, "Please select a backup file for upload"

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 232
    :cond_2
    :try_start_0
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p3, p1}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 234
    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->backup:Lorg/json/JSONObject;

    .line 235
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    const-string v1, "Selected"

    invoke-virtual {p3, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 236
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionVersionName:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 237
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionChangelog:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "changelog"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void

    .line 239
    :cond_3
    const-string p1, "Error while reading backup file"

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 240
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->defaultBackupFile:Ljava/lang/String;

    invoke-virtual {p1, p3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 243
    const-string p3, "Error while selecting backup file"

    invoke-static {p0, p3, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 244
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->defaultBackupFile:Ljava/lang/String;

    invoke-virtual {p2, p3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 55
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 57
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 58
    sget v0, Linstafel/app/R$layout;->ifl_at_admin_action_updatebackup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->setContentView(I)V

    .line 59
    new-instance v0, Linstafel/app/managers/OverridesManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 60
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 61
    sget v0, Linstafel/app/R$id;->ifl_loading_page:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageContentArea;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaLoading:Linstafel/app/ui/PageContentArea;

    .line 62
    sget v0, Linstafel/app/R$id;->ifl_page_area_backup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageContentArea;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaContent:Linstafel/app/ui/PageContentArea;

    .line 63
    sget v0, Linstafel/app/R$id;->ifl_page_area_edit:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageContentArea;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaEdit:Linstafel/app/ui/PageContentArea;

    .line 64
    sget v0, Linstafel/app/R$id;->ifl_backups_layout:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->layoutBackups:Landroid/widget/LinearLayout;

    .line 65
    sget v0, Linstafel/app/R$id;->ifl_tile_selectbackupfile:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    .line 66
    sget v0, Linstafel/app/R$id;->ifl_tile_setchangelog:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionChangelog:Linstafel/app/ui/TileLarge;

    .line 67
    sget v0, Linstafel/app/R$id;->ifl_tile_setversionname:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionVersionName:Linstafel/app/ui/TileLarge;

    .line 68
    sget v0, Linstafel/app/R$id;->ifl_button_updatebackup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->buttonUpdate:Landroid/widget/LinearLayout;

    .line 69
    sget v0, Linstafel/app/R$id;->ifl_text_button:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->buttonUpdateText:Landroid/widget/TextView;

    .line 71
    new-instance v0, Linstafel/app/api/requests/ApiGetAdmin;

    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    .line 74
    const-string v3, "null"

    invoke-virtual {v1, v2, v3}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v4, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    .line 75
    invoke-virtual {v2, v4, v3}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x13

    invoke-direct {v0, p0, v3, v1, v2}, Linstafel/app/api/requests/ApiGetAdmin;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getApiUrl(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/admin/user/list_user_backups"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, p1

    invoke-virtual {v0, v1}, Linstafel/app/api/requests/ApiGetAdmin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public triggerEditPage(Linstafel/app/api/models/BackupListItem;)V
    .locals 3

    .line 161
    sget v0, Linstafel/app/R$id;->ifl_page_title:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageTitle;

    .line 162
    const-string v1, "Edit Backup"

    invoke-virtual {v0, v1}, Linstafel/app/ui/PageTitle;->setText(Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaContent:Linstafel/app/ui/PageContentArea;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 164
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->areaEdit:Linstafel/app/ui/PageContentArea;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 165
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->buttonUpdate:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 166
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->buttonUpdateText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Update "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Linstafel/app/api/models/BackupListItem;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->selectionBackup:Linstafel/app/ui/TileLarge;

    new-instance v1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;->buttonUpdate:Landroid/widget/LinearLayout;

    new-instance v1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;

    invoke-direct {v1, p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup$2;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;Linstafel/app/api/models/BackupListItem;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

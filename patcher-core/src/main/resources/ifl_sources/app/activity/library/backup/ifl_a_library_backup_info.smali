.class public Linstafel/app/activity/library/backup/ifl_a_library_backup_info;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_library_backup_info.java"

# interfaces
.implements Linstafel/app/api/requests/ApiCallbackInterface;


# instance fields
.field private areaContent:Linstafel/app/ui/PageContentArea;

.field private areaLoading:Linstafel/app/ui/PageContentArea;

.field private backup:Linstafel/app/api/models/Backup;

.field private loadingDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field private overridesManager:Linstafel/app/managers/OverridesManager;

.field private preferenceManager:Linstafel/app/managers/PreferenceManager;

.field private tileAboutAuthor:Linstafel/app/ui/TileLarge;

.field private tileApplyBackup:Linstafel/app/ui/TileLarge;

.field private tileChangelog:Linstafel/app/ui/TileLarge;

.field private tileDescription:Linstafel/app/ui/TileLarge;

.field private tileLastUpdated:Linstafel/app/ui/TileLarge;

.field private tileName:Linstafel/app/ui/TileLarge;

.field private tileVersion:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public applyBackup(Ljava/lang/String;)V
    .locals 6

    const/4 v0, 0x0

    .line 165
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 166
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v1}, Linstafel/app/managers/OverridesManager;->writeContentIntoOverridesFile(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 167
    const-string v1, "SUCCESS"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 168
    sget p1, Linstafel/app/R$string;->ifl_a11_44:I

    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v1}, Linstafel/app/api/models/Backup;->getName()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 169
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_update_value:Ljava/lang/String;

    new-instance v2, Linstafel/app/api/models/AutoUpdateInfo;

    iget-object v3, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    .line 171
    invoke-virtual {v3}, Linstafel/app/api/models/Backup;->getId()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v4}, Linstafel/app/api/models/Backup;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v5}, Linstafel/app/api/models/Backup;->getBackupVersion()I

    move-result v5

    invoke-direct {v2, v3, v4, v5}, Linstafel/app/api/models/AutoUpdateInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v2}, Linstafel/app/api/models/AutoUpdateInfo;->exportAsJsonString()Ljava/lang/String;

    move-result-object v2

    .line 169
    invoke-virtual {p1, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 173
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Linstafel/app/R$string;->ifl_a11_22:I

    invoke-virtual {p0, v2}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 176
    sget v1, Linstafel/app/R$string;->ifl_a11_22:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 177
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public getResponse(Linstafel/app/api/models/InstafelResponse;I)V
    .locals 0

    return-void
.end method

.method public getResponse(Ljava/lang/String;I)V
    .locals 9

    .line 92
    const-string v0, "x"

    const-string v1, "medium"

    const-string v2, "instagram"

    const-string v3, "github"

    .line 0
    const-string v4, "This backup requires newer version of Instafel (manifest: "

    const/16 v5, 0xb

    const/4 v6, 0x0

    if-ne p2, v5, :cond_7

    if-eqz p1, :cond_6

    .line 95
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 96
    const-string p1, "manifest"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 97
    const-string v5, "optional"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 98
    iget-object v7, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v8, "manifest_version"

    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {v7, p2}, Linstafel/app/api/models/Backup;->setManifestVersion(I)V

    .line 99
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v7, "backup_version"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {p2, v7}, Linstafel/app/api/models/Backup;->setBackupVersion(I)V

    .line 100
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v7, "changelog"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Linstafel/app/api/models/Backup;->setChangelog(Ljava/lang/String;)V

    .line 101
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v7, "last_updated"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Linstafel/app/api/models/Backup;->setLastEdit(Ljava/lang/String;)V

    .line 102
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v7, "description"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Linstafel/app/api/models/Backup;->setDescription(Ljava/lang/String;)V

    .line 103
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v7, "show_author_socials"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {p2, v5}, Linstafel/app/api/models/Backup;->setOptionalShowAuthorSocials(Z)V

    .line 104
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    const-string v5, "version_name"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Linstafel/app/api/models/Backup;->setVersionName(Ljava/lang/String;)V

    .line 106
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->isOptionalShowAuthorSocials()Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v5, 0x8

    const-string v7, "gone"

    if-eqz p2, :cond_4

    .line 107
    :try_start_1
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileAboutAuthor:Linstafel/app/ui/TileLarge;

    invoke-virtual {p2, v7}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 108
    const-string p2, "optional_values"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "author_socials"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 109
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 110
    const-string v7, "name"

    iget-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v8}, Linstafel/app/api/models/Backup;->getAuthor()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 112
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p2, v3, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    :cond_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    :cond_1
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 118
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    :cond_2
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 121
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    :cond_3
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p1, p2}, Linstafel/app/api/models/Backup;->setAuthorSocials(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 126
    :cond_4
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileLastUpdated:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1, v7}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 127
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileAboutAuthor:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1, v5}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 130
    :goto_0
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p1}, Linstafel/app/api/models/Backup;->getManifestVersion()I

    move-result p1

    const/4 p2, 0x3

    if-gt p1, p2, :cond_5

    .line 131
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileName:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 132
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileDescription:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getDescription()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 133
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileLastUpdated:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getLastEdit()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 134
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileVersion:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getVersionName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 135
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileChangelog:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getChangelog()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 136
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileAboutAuthor:Linstafel/app/ui/TileLarge;

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getAuthor()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 137
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileAboutAuthor:Linstafel/app/ui/TileLarge;

    new-instance p2, Linstafel/app/activity/library/backup/ifl_a_library_backup_info$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info;)V

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileApplyBackup:Linstafel/app/ui/TileLarge;

    new-instance p2, Linstafel/app/activity/library/backup/ifl_a_library_backup_info$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info;)V

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->areaContent:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p1, v6}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 143
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->areaLoading:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p1, v5}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    return-void

    .line 145
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {p2}, Linstafel/app/api/models/Backup;->getManifestVersion()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 148
    sget p2, Linstafel/app/R$string;->ifl_a11_17:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 149
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void

    .line 152
    :cond_6
    sget p1, Linstafel/app/R$string;->ifl_a11_17:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_7
    const/16 v0, 0xe

    if-ne p2, v0, :cond_9

    if-eqz p1, :cond_8

    .line 156
    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->applyBackup(Ljava/lang/String;)V

    return-void

    .line 158
    :cond_8
    sget p1, Linstafel/app/R$string;->ifl_a11_22:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_9
    return-void
.end method

.method synthetic lambda$getResponse$0$instafel-app-activity-library-backup-ifl_a_library_backup_info(Landroid/view/View;)V
    .locals 1

    .line 137
    const-class p1, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;

    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v0}, Linstafel/app/api/models/Backup;->getAuthorSocials()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Linstafel/app/utils/GeneralFn;->startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$getResponse$1$instafel-app-activity-library-backup-ifl_a_library_backup_info(Landroid/view/View;)V
    .locals 3

    .line 139
    new-instance p1, Linstafel/app/api/requests/ApiGetString;

    const/16 v0, 0xe

    invoke-direct {p1, p0, v0}, Linstafel/app/api/requests/ApiGetString;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;I)V

    const/4 v0, 0x1

    .line 140
    new-array v0, v0, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://raw.githubusercontent.com/instafel/backups/main/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v2}, Linstafel/app/api/models/Backup;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/backup.ibackup"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Linstafel/app/api/requests/ApiGetString;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    const-string v0, "https://raw.githubusercontent.com/instafel/backups/main/"

    .line 42
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 44
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0, v1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 45
    sget v1, Linstafel/app/R$layout;->ifl_at_library_backup_info:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->setContentView(I)V

    .line 47
    new-instance v1, Linstafel/app/managers/OverridesManager;

    invoke-direct {v1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 48
    new-instance v1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 49
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_name:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileName:Linstafel/app/ui/TileLarge;

    .line 50
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_desc:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileDescription:Linstafel/app/ui/TileLarge;

    .line 51
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_lastUpdated:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileLastUpdated:Linstafel/app/ui/TileLarge;

    .line 52
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_aboutAuthor:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileAboutAuthor:Linstafel/app/ui/TileLarge;

    .line 53
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_applyBackup:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileApplyBackup:Linstafel/app/ui/TileLarge;

    .line 54
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_changelog:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileChangelog:Linstafel/app/ui/TileLarge;

    .line 55
    sget v1, Linstafel/app/R$id;->ifl_tile_backup_library_version:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLarge;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->tileVersion:Linstafel/app/ui/TileLarge;

    .line 56
    sget v1, Linstafel/app/R$id;->ifl_content_area:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/PageContentArea;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->areaContent:Linstafel/app/ui/PageContentArea;

    .line 57
    sget v1, Linstafel/app/R$id;->ifl_loading_page:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/PageContentArea;

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->areaLoading:Linstafel/app/ui/PageContentArea;

    .line 59
    new-instance v1, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v1, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 60
    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->loadingDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 61
    const-string v2, "top_space"

    const/16 v3, 0x19

    invoke-virtual {v1, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 62
    new-instance v1, Linstafel/app/ui/LoadingBar;

    invoke-direct {v1, p0}, Linstafel/app/ui/LoadingBar;-><init>(Landroid/content/Context;)V

    .line 63
    new-instance v2, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v4, -0x2

    invoke-direct {v2, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 64
    invoke-virtual {p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x41c80000    # 25.0f

    mul-float/2addr v4, v5

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    float-to-int v4, v4

    .line 65
    invoke-virtual {v2, v4, p1, v4, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 66
    invoke-virtual {v1, v2}, Linstafel/app/ui/LoadingBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    iget-object v2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->loadingDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v4, "loading_bar"

    invoke-virtual {v2, v4, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 68
    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->loadingDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v2, "button_top_space"

    invoke-virtual {v1, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 71
    :try_start_0
    invoke-virtual {p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 72
    const-string v2, "data"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 74
    const-string v2, "CANNOT_BE_CONVERTED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 75
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 76
    new-instance v1, Linstafel/app/api/models/Backup;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "name"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "author"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v4, v2}, Linstafel/app/api/models/Backup;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    .line 78
    new-instance v1, Linstafel/app/api/requests/ApiGetString;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Linstafel/app/api/requests/ApiGetString;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;I)V

    const/4 v2, 0x1

    .line 79
    new-array v2, v2, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->backup:Linstafel/app/api/models/Backup;

    invoke-virtual {v0}, Linstafel/app/api/models/Backup;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/manifest.json"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, p1

    invoke-virtual {v1, v2}, Linstafel/app/api/requests/ApiGetString;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 82
    :cond_0
    sget v0, Linstafel/app/R$string;->ifl_a11_17:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 85
    sget v1, Linstafel/app/R$string;->ifl_a11_17:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 86
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

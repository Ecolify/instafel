.class public Linstafel/app/ota/CheckUpdates;
.super Ljava/lang/Object;
.source "CheckUpdates.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static check(Landroid/app/Activity;Z)V
    .locals 3

    .line 130
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIflVersion(Landroid/content/Context;)I

    move-result v0

    .line 131
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getType(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 132
    new-instance v2, Linstafel/app/ota/tasks/VersionTask;

    invoke-direct {v2, p0, v1, v0, p1}, Linstafel/app/ota/tasks/VersionTask;-><init>(Landroid/app/Activity;Ljava/lang/String;IZ)V

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    const/4 p1, 0x0

    const-string v0, "https://api.github.com/repos/Ecolify/instafel2/releases/latest"

    aput-object v0, p0, p1

    invoke-virtual {v2, p0}, Linstafel/app/ota/tasks/VersionTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkBackupUpdate(Landroid/app/Activity;)V
    .locals 11

    .line 105
    const-string v0, "current_version"

    const-string v1, "name"

    const-string v2, "id"

    const-string v3, "ifl_a11_26"

    .line 0
    const-string v4, "https://raw.githubusercontent.com/instafel/backups/main/"

    .line 105
    invoke-static {p0}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 106
    new-instance v6, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v6, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    const/4 v7, 0x0

    .line 108
    :try_start_0
    new-instance v8, Lorg/json/JSONObject;

    sget-object v9, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_update_value:Ljava/lang/String;

    const-string v10, "[]"

    invoke-virtual {v6, v9, v10}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 110
    new-instance v9, Linstafel/app/api/models/AutoUpdateInfo;

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {v9, v2, v1, v0}, Linstafel/app/api/models/AutoUpdateInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 111
    new-instance v0, Linstafel/app/api/tasks/BackupUpdateTask;

    invoke-direct {v0, p0, v6, v9, v5}, Linstafel/app/api/tasks/BackupUpdateTask;-><init>(Landroid/app/Activity;Linstafel/app/managers/PreferenceManager;Linstafel/app/api/models/AutoUpdateInfo;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v9}, Linstafel/app/api/models/AutoUpdateInfo;->getBackup_id()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "/manifest.json"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Linstafel/app/api/tasks/BackupUpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 114
    :cond_0
    invoke-static {p0, v5, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 117
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 118
    invoke-static {p0, v5, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private static checkChangelog(Landroid/app/Activity;JJ)V
    .locals 1

    .line 123
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIflVersion(Landroid/content/Context;)I

    move-result v0

    sub-long/2addr p1, p3

    const-wide/32 p3, 0x36ee80

    cmp-long p1, p1, p3

    if-ltz p1, :cond_1

    const/16 p1, 0xcc

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 125
    :cond_1
    :goto_0
    new-instance p1, Linstafel/app/ota/tasks/ChangelogTask;

    invoke-direct {p1, p0, v0}, Linstafel/app/ota/tasks/ChangelogTask;-><init>(Landroid/app/Activity;I)V

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    const/4 p2, 0x0

    const-string p3, "https://api.github.com/repos/Ecolify/instafel2/contents/mcq.json"

    aput-object p3, p0, p2

    invoke-virtual {p1, p0}, Linstafel/app/ota/tasks/ChangelogTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkUpdates(Landroid/app/Activity;)V
    .locals 12

    .line 36
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 37
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_welcome_message:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 38
    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v1, :cond_0

    .line 40
    invoke-static {p0}, Linstafel/app/ota/CheckUpdates;->showWelcomeDialog(Landroid/app/Activity;)V

    return-void

    .line 42
    :cond_0
    sget-boolean v1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz v1, :cond_9

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    const-wide/32 v8, 0x5265c00

    if-eqz v3, :cond_1

    .line 47
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_last_check:Ljava/lang/String;

    invoke-virtual {v0, v1, v6, v7}, Linstafel/app/managers/PreferenceManager;->getPreferenceLong(Ljava/lang/String;J)J

    move-result-wide v10

    sub-long v10, v4, v10

    cmp-long v1, v10, v8

    if-ltz v1, :cond_1

    .line 50
    invoke-static {p0}, Linstafel/app/ota/CheckUpdates;->checkBackupUpdate(Landroid/app/Activity;)V

    .line 54
    :cond_1
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_success_install:Ljava/lang/String;

    invoke-virtual {v0, v1, v6, v7}, Linstafel/app/managers/PreferenceManager;->getPreferenceLong(Ljava/lang/String;J)J

    move-result-wide v10

    cmp-long v1, v10, v6

    if-eqz v1, :cond_2

    .line 56
    invoke-static {p0, v4, v5, v10, v11}, Linstafel/app/ota/CheckUpdates;->checkChangelog(Landroid/app/Activity;JJ)V

    .line 59
    :cond_2
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 60
    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_freq:Ljava/lang/String;

    sget v10, Linstafel/app/utils/types/Types$FreqLabels;->EVERY_OPEN:I

    invoke-virtual {v0, v3, v10}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result v3

    .line 61
    sget-object v10, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    invoke-virtual {v0, v10, v6, v7}, Linstafel/app/managers/PreferenceManager;->getPreferenceLong(Ljava/lang/String;J)J

    move-result-wide v6

    if-eqz v1, :cond_9

    sub-long/2addr v4, v6

    if-eqz v3, :cond_8

    const/4 v0, 0x1

    if-eq v3, v0, :cond_7

    const/4 v0, 0x2

    if-eq v3, v0, :cond_6

    const/4 v0, 0x3

    if-eq v3, v0, :cond_5

    const/4 v0, 0x4

    if-eq v3, v0, :cond_4

    const/4 v0, 0x5

    if-eq v3, v0, :cond_3

    goto :goto_1

    :cond_3
    const-wide/32 v0, 0x240c8400

    cmp-long v0, v4, v0

    if-ltz v0, :cond_9

    goto :goto_0

    :cond_4
    const-wide/32 v0, 0x19bfcc00

    cmp-long v0, v4, v0

    if-ltz v0, :cond_9

    goto :goto_0

    :cond_5
    const-wide/32 v0, 0xf731400

    cmp-long v0, v4, v0

    if-ltz v0, :cond_9

    goto :goto_0

    :cond_6
    cmp-long v0, v4, v8

    if-ltz v0, :cond_9

    goto :goto_0

    :cond_7
    return-void

    .line 97
    :cond_8
    :goto_0
    invoke-static {p0, v2}, Linstafel/app/ota/CheckUpdates;->check(Landroid/app/Activity;Z)V

    :cond_9
    :goto_1
    return-void
.end method

.method static synthetic lambda$set$0(Landroid/app/Activity;Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x1

    .line 28
    :try_start_0
    invoke-static {p0, p1}, Linstafel/app/ota/CheckUpdates;->check(Landroid/app/Activity;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 30
    :catch_0
    const-string p1, "Error while checking updates."

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$showBackupUpdateDialog$1(Linstafel/app/utils/dialog/InstafelDialog;Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x0

    .line 159
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    .line 160
    invoke-virtual {p0}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$showBackupUpdateDialog$2(Landroid/app/Activity;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 162
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "https://instafel.app/backup?id="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$showWelcomeDialog$3(Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;Landroid/view/View;)V
    .locals 0

    .line 194
    invoke-virtual {p0}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 195
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_welcome_message:Ljava/lang/String;

    const/4 p2, 0x1

    invoke-virtual {p1, p0, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static set(Landroid/app/Activity;Linstafel/app/ui/TileLarge;)V
    .locals 1

    .line 26
    new-instance v0, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static showBackupUpdateDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 136
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 137
    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 138
    const-string v1, "ifl_a11_27"

    .line 140
    invoke-static {p0, p1, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 v1, 0x0

    invoke-direct {v6, p0, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 138
    const-string v1, "dialog_title"

    const/16 v3, 0x1e

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 145
    const-string v1, "mid_space"

    const/16 v7, 0x14

    invoke-virtual {v0, v1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 146
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 v1, 0x18

    invoke-direct {v6, p0, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_desc"

    const-string v2, "You can see changelog from website."

    const/16 v3, 0x10

    const/16 v4, 0x136

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 153
    const-string v1, "button_top_space"

    invoke-virtual {v0, v1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 154
    const-string v1, "ifl_a11_28"

    .line 156
    invoke-static {p0, p1, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda0;

    invoke-direct {v4, v0}, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda0;-><init>(Linstafel/app/utils/dialog/InstafelDialog;)V

    new-instance v5, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0, p2}, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 154
    const-string v1, "buttons"

    const-string v3, "View Changelog"

    invoke-virtual/range {v0 .. v5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 163
    const-string p0, "bottom_space"

    const/16 p1, 0x1b

    invoke-virtual {v0, p0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 164
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method

.method private static showWelcomeDialog(Landroid/app/Activity;)V
    .locals 10

    .line 168
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 169
    invoke-static {p0}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 171
    new-instance v2, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v2, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 172
    const-string v3, "top_space"

    const/16 v4, 0x19

    invoke-virtual {v2, v3, v4}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 173
    const-string v3, "ifl_d4_01"

    .line 175
    invoke-static {p0, v1, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget v7, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v8, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 v3, 0x0

    invoke-direct {v8, p0, v3, v3}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 173
    const-string v3, "dialog_title"

    const/16 v5, 0x1e

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v8}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 180
    const-string v3, "mid_space"

    const/16 v9, 0x14

    invoke-virtual {v2, v3, v9}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 181
    const-string v3, "ifl_d4_02"

    .line 183
    invoke-static {p0, v1, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget v7, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v8, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 v3, 0x18

    invoke-direct {v8, p0, v3, v3}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 181
    const-string v3, "dialog_desc"

    const/16 v5, 0x10

    const/16 v6, 0x136

    invoke-virtual/range {v2 .. v8}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 188
    const-string v3, "button_top_space"

    invoke-virtual {v2, v3, v9}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 189
    const-string v3, "ifl_d3_02"

    .line 191
    invoke-static {p0, v1, v3}, Linstafel/app/utils/localization/LocalizedStringGetter;->getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;

    invoke-direct {v6, v2, v0}, Linstafel/app/ota/CheckUpdates$$ExternalSyntheticLambda3;-><init>(Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/managers/PreferenceManager;)V

    const/4 v7, 0x0

    .line 189
    const-string v3, "buttons"

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 198
    const-string p0, "bottom_space"

    const/16 v0, 0x1b

    invoke-virtual {v2, p0, v0}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 199
    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method

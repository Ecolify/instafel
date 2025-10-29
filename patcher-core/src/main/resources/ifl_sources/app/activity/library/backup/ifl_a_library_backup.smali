.class public Linstafel/app/activity/library/backup/ifl_a_library_backup;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_library_backup.java"

# interfaces
.implements Linstafel/app/api/requests/ApiCallbackInterface;


# instance fields
.field private backups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Linstafel/app/api/models/BackupListItem;",
            ">;"
        }
    .end annotation
.end field

.field private editText:Landroid/widget/EditText;

.field private isUserChangedStatus:Z

.field private layoutBackups:Landroid/widget/LinearLayout;

.field private layoutContent:Linstafel/app/ui/PageContentArea;

.field private layoutLoading:Linstafel/app/ui/PageContentArea;

.field private layoutSearch:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private preferenceManager:Linstafel/app/managers/PreferenceManager;

.field private tileAutoUpdate:Linstafel/app/ui/TileLargeSwitch;

.field private tileAutoUpdateSwitch:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->isUserChangedStatus:Z

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->backups:Ljava/util/List;

    return-void
.end method

.method private buildLayout(Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Linstafel/app/api/models/BackupListItem;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutContent:Linstafel/app/ui/PageContentArea;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 170
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 171
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutSearch:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    .line 172
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutLoading:Linstafel/app/ui/PageContentArea;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 174
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    if-nez p2, :cond_0

    move p2, v2

    .line 176
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_2

    .line 177
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Linstafel/app/api/models/BackupListItem;

    invoke-virtual {p0, v3}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->createBackupTile(Linstafel/app/api/models/BackupListItem;)Linstafel/app/ui/TileLarge;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 180
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 181
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Linstafel/app/api/models/BackupListItem;

    .line 182
    invoke-virtual {v3}, Linstafel/app/api/models/BackupListItem;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 183
    iget-object v4, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->createBackupTile(Linstafel/app/api/models/BackupListItem;)Linstafel/app/ui/TileLarge;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 188
    :cond_2
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutContent:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p1, v2}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 189
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 190
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutSearch:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    .line 191
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutLoading:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p1, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public createBackupTile(Linstafel/app/api/models/BackupListItem;)Linstafel/app/ui/TileLarge;
    .locals 3

    .line 195
    new-instance v0, Linstafel/app/ui/TileLarge;

    invoke-direct {v0, p0}, Linstafel/app/ui/TileLarge;-><init>(Landroid/content/Context;)V

    .line 196
    invoke-virtual {p1}, Linstafel/app/api/models/BackupListItem;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 197
    sget v1, Linstafel/app/R$string;->ifl_a11_04:I

    invoke-virtual {p1}, Linstafel/app/api/models/BackupListItem;->getAuthor()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 198
    sget v1, Linstafel/app/R$drawable;->ifl_backup:I

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setIconRes(I)V

    .line 199
    const-string v1, "gone"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 200
    const-string v1, "visible"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 201
    new-instance v1, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;

    invoke-direct {v1, p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup;Linstafel/app/api/models/BackupListItem;)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public getResponse(Linstafel/app/api/models/InstafelResponse;I)V
    .locals 0

    return-void
.end method

.method public getResponse(Ljava/lang/String;I)V
    .locals 7

    const/16 v0, 0xb

    if-ne p2, v0, :cond_2

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 141
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 142
    const-string p1, "backups"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 143
    const-string v0, "Instafel"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v0, p2

    .line 144
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 145
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 146
    iget-object v2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->backups:Ljava/util/List;

    new-instance v3, Linstafel/app/api/models/BackupListItem;

    const-string v4, "id"

    .line 148
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "name"

    .line 149
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "author"

    .line 150
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v4, v5, v1}, Linstafel/app/api/models/BackupListItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 155
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->backups:Ljava/util/List;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->buildLayout(Ljava/util/List;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 157
    sget v0, Linstafel/app/R$string;->ifl_a11_03:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 158
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 159
    invoke-virtual {p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->finish()V

    return-void

    .line 162
    :cond_1
    sget p1, Linstafel/app/R$string;->ifl_a11_03:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 163
    invoke-virtual {p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->finish()V

    :cond_2
    return-void
.end method

.method synthetic lambda$onCreate$0$instafel-app-activity-library-backup-ifl_a_library_backup(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 74
    sget-boolean p1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz p1, :cond_1

    .line 75
    iget-boolean p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->isUserChangedStatus:Z

    if-nez p1, :cond_0

    .line 76
    invoke-virtual {p0, p2}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->setAutoUpdateState(Z)V

    :cond_0
    return-void

    .line 79
    :cond_1
    const-string p1, "This feauture isn\'t available on custom generations."

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-library-backup-ifl_a_library_backup(Landroid/view/View;)V
    .locals 2

    .line 84
    sget-boolean p1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 85
    iput-boolean p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->isUserChangedStatus:Z

    .line 86
    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {v1}, Landroid/widget/Switch;->isChecked()Z

    move-result v1

    xor-int/2addr p1, v1

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->setAutoUpdateState(Z)V

    .line 87
    iput-boolean v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->isUserChangedStatus:Z

    return-void

    .line 89
    :cond_0
    const-string p1, "This feauture isn\'t available on custom generations."

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-library-backup-ifl_a_library_backup(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 0
    const/4 p1, 0x3

    if-eq p2, p1, :cond_0

    if-eqz p3, :cond_2

    .line 95
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_2

    .line 96
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    .line 98
    iget-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->backups:Ljava/util/List;

    invoke-direct {p0, p2, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->buildLayout(Ljava/util/List;Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :cond_1
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->backups:Ljava/util/List;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->buildLayout(Ljava/util/List;Ljava/lang/String;)V

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 53
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 55
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 56
    sget v0, Linstafel/app/R$layout;->ifl_at_library_backup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->setContentView(I)V

    .line 58
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 59
    sget v0, Linstafel/app/R$id;->ifl_tile_backup_library_enableAutoUpdates:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdate:Linstafel/app/ui/TileLargeSwitch;

    .line 60
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    .line 61
    sget v0, Linstafel/app/R$id;->ifl_search_layout:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutSearch:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 62
    sget v0, Linstafel/app/R$id;->ifl_loading_page:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageContentArea;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutLoading:Linstafel/app/ui/PageContentArea;

    .line 63
    sget v0, Linstafel/app/R$id;->ifl_backups_layout:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutBackups:Landroid/widget/LinearLayout;

    .line 64
    sget v0, Linstafel/app/R$id;->ifl_page_area_backup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/PageContentArea;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->layoutContent:Linstafel/app/ui/PageContentArea;

    .line 65
    sget v0, Linstafel/app/R$id;->ifl_backup_editText:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->editText:Landroid/widget/EditText;

    .line 67
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0

    .line 70
    :cond_0
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 73
    :goto_0
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    new-instance v2, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup;)V

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 83
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdate:Linstafel/app/ui/TileLargeSwitch;

    new-instance v2, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup;)V

    invoke-virtual {v0, v2}, Linstafel/app/ui/TileLargeSwitch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->editText:Landroid/widget/EditText;

    new-instance v2, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 106
    new-instance v0, Linstafel/app/api/requests/ApiGetString;

    const/16 v2, 0xb

    invoke-direct {v0, p0, v2}, Linstafel/app/api/requests/ApiGetString;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;I)V

    .line 107
    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "https://raw.githubusercontent.com/instafel/backups/main/backups.json"

    aput-object v2, v1, p1

    invoke-virtual {v0, v1}, Linstafel/app/api/requests/ApiGetString;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setAutoUpdateState(Z)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 112
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_update_value:Ljava/lang/String;

    const-string v2, "def"

    invoke-virtual {p1, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 113
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "CANNOT_BE_CONVERTED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 115
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 116
    sget p1, Linstafel/app/R$string;->ifl_a11_24:I

    const-string v2, "name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 117
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 118
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v2}, Landroid/widget/Switch;->setChecked(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    :catch_0
    sget p1, Linstafel/app/R$string;->ifl_a11_23:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 121
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 122
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0

    .line 125
    :cond_0
    sget p1, Linstafel/app/R$string;->ifl_a11_23:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 126
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 127
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    :goto_0
    return-void

    .line 130
    :cond_1
    sget p1, Linstafel/app/R$string;->ifl_a11_25:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 131
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 132
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->tileAutoUpdateSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    return-void
.end method

.method public showExample(Landroid/view/View;)V
    .locals 3

    .line 211
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "s"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.class public Linstafel/app/activity/devmode/backup/ifl_a_export_backup;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_export_backup.java"


# instance fields
.field backupFile:Lorg/json/JSONObject;

.field exportButton:Landroid/widget/LinearLayout;

.field overridesManager:Linstafel/app/managers/OverridesManager;

.field preferenceManager:Linstafel/app/managers/PreferenceManager;

.field tileAuthorName:Linstafel/app/ui/TileLargeEditText;

.field tileAuthorNameEditText:Landroid/widget/EditText;

.field tileBackupName:Linstafel/app/ui/TileLargeEditText;

.field tileBackupNameEditText:Landroid/widget/EditText;

.field tileChangelog:Linstafel/app/ui/TileLargeEditText;

.field tileChangelogEditText:Landroid/widget/EditText;

.field tileVersion:Linstafel/app/ui/TileLargeEditText;

.field tileVersionEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private createFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 203
    sget-object v0, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-static {p1, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p1

    .line 204
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 205
    const-string v0, "[^\\p{L}\\p{N}\\s]"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 206
    const-string v2, "\\s+"

    const-string v3, "_"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 207
    const-string v4, "[\\\\/:*?\"<>|]"

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 208
    const-string v5, "^_+|_+$"

    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 211
    const-string p1, "ifl_backup"

    .line 214
    :cond_0
    sget-object v6, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-static {p2, v6}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p2

    .line 215
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    .line 216
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 217
    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 218
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 219
    invoke-virtual {p2, v5, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 221
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 222
    const-string p2, "v1"

    .line 225
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private fixVersionNameCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 188
    sget-object v0, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-static {p1, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p1

    .line 189
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 190
    const-string v0, "[^\\p{L}\\p{N}\\s]"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 191
    const-string v0, "\\s+"

    const-string v2, "_"

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 192
    const-string v0, "[\\\\/:*?\"<>|]"

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 193
    const-string v0, "^_+|_+$"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 195
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    const-string p1, "null"

    :cond_0
    return-object p1
.end method

.method private fixVersionNameString(Landroid/widget/EditText;)V
    .locals 3

    .line 174
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 176
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x76

    if-ne v1, v2, :cond_0

    .line 178
    invoke-direct {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->fixVersionNameCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 180
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->fixVersionNameCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 183
    :cond_1
    sget p1, Linstafel/app/R$string;->ifl_a11_50:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-devmode-backup-ifl_a_export_backup(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 0
    const/4 p1, 0x6

    if-ne p2, p1, :cond_0

    .line 66
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->fixVersionNameString(Landroid/widget/EditText;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-devmode-backup-ifl_a_export_backup(Landroid/view/View;Z)V
    .locals 0

    .line 0
    if-nez p2, :cond_0

    .line 73
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->fixVersionNameString(Landroid/widget/EditText;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-devmode-backup-ifl_a_export_backup(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 0
    const/4 p1, 0x6

    if-eq p2, p1, :cond_1

    .line 93
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-eq p1, p2, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 96
    :cond_1
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    const-string p2, "\n"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-devmode-backup-ifl_a_export_backup(Landroid/view/View;)V
    .locals 3

    .line 101
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    .line 102
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 103
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->createFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".ibackup"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.extra.TITLE"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 105
    const-string v0, "application/x-ibackup"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x12

    .line 106
    invoke-virtual {p0, p1, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 108
    :cond_0
    sget p1, Linstafel/app/R$string;->ifl_a11_49:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Alert"

    invoke-static {p0, v0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 115
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x12

    if-eq p1, v0, :cond_0

    goto/16 :goto_2

    :cond_0
    if-eqz p3, :cond_1

    .line 120
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 125
    :goto_0
    const-string p3, "Alert"

    if-nez p1, :cond_2

    .line 126
    sget p1, Linstafel/app/R$string;->ifl_a4_04:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const/4 v0, -0x1

    if-ne p2, v0, :cond_7

    .line 133
    :try_start_0
    iget-object p2, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p2}, Linstafel/app/managers/OverridesManager;->readOverrideFile()Lorg/json/JSONObject;

    move-result-object p2

    if-nez p2, :cond_3

    .line 135
    sget p1, Linstafel/app/R$string;->ifl_a4_39:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 137
    :cond_3
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 138
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->backupFile:Lorg/json/JSONObject;

    .line 139
    const-string v1, "manifest_version"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 140
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 141
    const-string v1, "id"

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 142
    const-string v1, "name"

    iget-object v2, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 143
    const-string v1, "author"

    iget-object v2, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    const-string v1, "version"

    iget-object v2, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 146
    iget-object v1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "changelog"

    if-eqz v1, :cond_4

    .line 147
    :try_start_1
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 149
    :cond_4
    iget-object v1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 152
    :goto_1
    iget-object v1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->backupFile:Lorg/json/JSONObject;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->backupFile:Lorg/json/JSONObject;

    const-string v1, "backup"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->overridesManager:Linstafel/app/managers/OverridesManager;

    iget-object v1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->backupFile:Lorg/json/JSONObject;

    invoke-virtual {v0, p1, v1}, Linstafel/app/managers/OverridesManager;->writeContentIntoBackupFile(Landroid/net/Uri;Lorg/json/JSONObject;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 156
    const-string p1, "Success"

    sget v0, Linstafel/app/R$string;->ifl_a4_40:I

    invoke-virtual {p2}, Lorg/json/JSONObject;->length()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, v0, p2}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 158
    :cond_5
    sget p1, Linstafel/app/R$string;->ifl_a4_41:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 161
    :cond_6
    sget p1, Linstafel/app/R$string;->ifl_a11_49:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 165
    sget p2, Linstafel/app/R$string;->ifl_a4_42:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p3, p2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_7
    :goto_2
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 40
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 42
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 43
    sget v0, Linstafel/app/R$layout;->ifl_at_export_backup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->setContentView(I)V

    .line 45
    new-instance v0, Linstafel/app/managers/OverridesManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 46
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 48
    sget v0, Linstafel/app/R$id;->ifl_tile_export_backup_name:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeEditText;

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupName:Linstafel/app/ui/TileLargeEditText;

    .line 49
    sget v0, Linstafel/app/R$id;->ifl_tile_export_author_name:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeEditText;

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorName:Linstafel/app/ui/TileLargeEditText;

    .line 50
    sget v0, Linstafel/app/R$id;->ifl_tile_export_backup_version:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeEditText;

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersion:Linstafel/app/ui/TileLargeEditText;

    .line 51
    sget v0, Linstafel/app/R$id;->ifl_tile_export_backup_changelog:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeEditText;

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelog:Linstafel/app/ui/TileLargeEditText;

    .line 52
    sget v0, Linstafel/app/R$id;->ifl_button_exportbackup:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->exportButton:Landroid/widget/LinearLayout;

    .line 54
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersion:Linstafel/app/ui/TileLargeEditText;

    invoke-virtual {v0}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    .line 55
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorName:Linstafel/app/ui/TileLargeEditText;

    invoke-virtual {v0}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    .line 56
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupName:Linstafel/app/ui/TileLargeEditText;

    invoke-virtual {v0}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    .line 57
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelog:Linstafel/app/ui/TileLargeEditText;

    invoke-virtual {v0}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    .line 59
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    const/4 v1, 0x1

    new-array v2, v1, [Landroid/text/InputFilter;

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v2, p1

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 60
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    const v2, 0x20001

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 61
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 62
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 63
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    const/4 v3, 0x6

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 64
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    new-instance v4, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/devmode/backup/ifl_a_export_backup;)V

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 71
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileVersionEditText:Landroid/widget/EditText;

    new-instance v4, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/devmode/backup/ifl_a_export_backup;)V

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 77
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    new-array v4, v1, [Landroid/text/InputFilter;

    new-instance v5, Landroid/text/InputFilter$LengthFilter;

    const/16 v6, 0x28

    invoke-direct {v5, v6}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v5, v4, p1

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 78
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 79
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 80
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 81
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileAuthorNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 83
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    new-array v4, v1, [Landroid/text/InputFilter;

    new-instance v5, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v5, v6}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v5, v4, p1

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 84
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 85
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 86
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 87
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileBackupNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 89
    iget-object v0, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x9c4

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 90
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 91
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 92
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->tileChangelogEditText:Landroid/widget/EditText;

    new-instance v0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/devmode/backup/ifl_a_export_backup;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 100
    iget-object p1, p0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;->exportButton:Landroid/widget/LinearLayout;

    new-instance v0, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/backup/ifl_a_export_backup$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/devmode/backup/ifl_a_export_backup;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

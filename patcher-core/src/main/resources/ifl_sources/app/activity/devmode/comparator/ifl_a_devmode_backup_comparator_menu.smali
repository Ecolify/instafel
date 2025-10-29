.class public Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode_backup_comparator_menu.java"


# instance fields
.field private backupContent1:Lorg/json/JSONObject;

.field private backupContent2:Lorg/json/JSONObject;

.field private overridesManager:Linstafel/app/managers/OverridesManager;

.field private startCompare:Landroid/widget/LinearLayout;

.field private tileBackup1:Linstafel/app/ui/TileLarge;

.field private tileBackup2:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent1:Lorg/json/JSONObject;

    iput-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-devmode-comparator-ifl_a_devmode_backup_comparator_menu(Landroid/view/View;)V
    .locals 1

    .line 43
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 44
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0xb

    .line 46
    invoke-virtual {p0, p1, v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-devmode-comparator-ifl_a_devmode_backup_comparator_menu(Landroid/view/View;)V
    .locals 1

    .line 50
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 51
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x16

    .line 53
    invoke-virtual {p0, p1, v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-devmode-comparator-ifl_a_devmode_backup_comparator_menu(Landroid/view/View;)V
    .locals 3

    .line 0
    const/4 p1, 0x0

    .line 58
    :try_start_0
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent1:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent2:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 59
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 60
    const-string v1, "backup1"

    iget-object v2, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent1:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    const-string v1, "backup2"

    iget-object v2, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent2:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    const-class v1, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0}, Linstafel/app/utils/GeneralFn;->startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V

    return-void

    .line 65
    :cond_0
    sget v0, Linstafel/app/R$string;->ifl_a11_72:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    sget v0, Linstafel/app/R$string;->ifl_a11_70:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 76
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0xb

    .line 78
    const-string v0, "backup"

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eq p1, p2, :cond_4

    const/16 p2, 0x16

    if-eq p1, p2, :cond_0

    goto/16 :goto_0

    :cond_0
    if-eqz p3, :cond_1

    .line 82
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    :cond_1
    if-nez v1, :cond_2

    .line 88
    sget p1, Linstafel/app/R$string;->ifl_a11_38:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 93
    :cond_2
    :try_start_0
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v1}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 95
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent1:Lorg/json/JSONObject;

    .line 96
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup2:Linstafel/app/ui/TileLarge;

    sget p2, Linstafel/app/R$string;->ifl_a11_71:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void

    .line 98
    :cond_3
    sget p1, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 101
    sget p2, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 102
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_4
    if-eqz p3, :cond_5

    .line 109
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    :cond_5
    if-nez v1, :cond_6

    .line 115
    sget p1, Linstafel/app/R$string;->ifl_a11_38:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 120
    :cond_6
    :try_start_1
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v1}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 122
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->backupContent1:Lorg/json/JSONObject;

    .line 123
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup1:Linstafel/app/ui/TileLarge;

    sget p2, Linstafel/app/R$string;->ifl_a11_71:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void

    .line 125
    :cond_7
    sget p1, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception p1

    .line 128
    sget p2, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 129
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 31
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 33
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 34
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode_backup_comparator_menu:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->setContentView(I)V

    .line 36
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 38
    sget p1, Linstafel/app/R$id;->ifl_tile_backup_1:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup1:Linstafel/app/ui/TileLarge;

    .line 39
    sget p1, Linstafel/app/R$id;->ifl_tile_backup_2:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup2:Linstafel/app/ui/TileLarge;

    .line 40
    sget p1, Linstafel/app/R$id;->ifl_start_compare:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->startCompare:Landroid/widget/LinearLayout;

    .line 42
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup1:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->tileBackup2:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;->startCompare:Landroid/widget/LinearLayout;

    new-instance v0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.class public Linstafel/app/activity/devmode/ifl_a_devmode;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode.java"


# instance fields
.field overridesManager:Linstafel/app/managers/OverridesManager;

.field preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$5(Linstafel/app/utils/dialog/InstafelDialog;Landroid/view/View;)V
    .locals 0

    .line 81
    invoke-virtual {p0}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-devmode-ifl_a_devmode(Landroid/view/View;)V
    .locals 0

    .line 39
    const-class p1, Linstafel/app/activity/devmode/ifl_a_devmode_import;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-devmode-ifl_a_devmode(Landroid/view/View;)V
    .locals 0

    .line 40
    const-class p1, Linstafel/app/activity/devmode/backup/ifl_a_export_backup;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-devmode-ifl_a_devmode(Landroid/view/View;)V
    .locals 0

    .line 41
    const-class p1, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator_menu;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-devmode-ifl_a_devmode(Landroid/view/View;)V
    .locals 1

    .line 44
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1}, Linstafel/app/managers/OverridesManager;->readOverrideFile()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 46
    const-class p1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void

    .line 48
    :cond_0
    sget p1, Linstafel/app/R$string;->ifl_a4_34:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Alert"

    invoke-static {p0, v0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$4$instafel-app-activity-devmode-ifl_a_devmode(Linstafel/app/utils/dialog/InstafelDialog;Landroid/view/View;)V
    .locals 0

    .line 77
    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 78
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1}, Linstafel/app/managers/OverridesManager;->deleteOverrideFile()V

    .line 79
    sget p1, Linstafel/app/R$string;->ifl_a4_13:I

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$6$instafel-app-activity-devmode-ifl_a_devmode(Landroid/view/View;)V
    .locals 8

    .line 53
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1}, Linstafel/app/managers/OverridesManager;->existsOverrideFile()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 54
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 55
    const-string p1, "top_space"

    const/16 v1, 0x19

    invoke-virtual {v0, p1, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 56
    sget p1, Linstafel/app/R$string;->ifl_a4_35:I

    .line 58
    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 p1, 0x0

    invoke-direct {v6, p0, p1, p1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 56
    const-string v1, "dialog_title"

    const/16 v3, 0x1e

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 63
    const-string p1, "mid_space"

    const/16 v7, 0x14

    invoke-virtual {v0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 64
    sget p1, Linstafel/app/R$string;->ifl_a4_36:I

    .line 66
    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 p1, 0x18

    invoke-direct {v6, p0, p1, p1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 64
    const-string v1, "dialog_desc"

    const/16 v3, 0x10

    const/16 v4, 0x136

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 71
    const-string p1, "button_top_space"

    invoke-virtual {v0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 72
    sget p1, Linstafel/app/R$string;->ifl_a4_37:I

    .line 74
    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget p1, Linstafel/app/R$string;->ifl_a4_38:I

    .line 75
    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0, v0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda5;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;Linstafel/app/utils/dialog/InstafelDialog;)V

    new-instance v5, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda6;

    invoke-direct {v5, v0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda6;-><init>(Linstafel/app/utils/dialog/InstafelDialog;)V

    .line 72
    const-string v1, "buttons"

    invoke-virtual/range {v0 .. v5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 82
    const-string p1, "bottom_space"

    const/16 v1, 0x1b

    invoke-virtual {v0, p1, v1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 83
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void

    .line 85
    :cond_0
    sget p1, Linstafel/app/R$string;->ifl_a4_14:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Alert"

    invoke-static {p0, v0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 31
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 33
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 35
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 36
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 37
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->setContentView(I)V

    .line 39
    sget p1, Linstafel/app/R$id;->ifl_tile_exp_import:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    sget p1, Linstafel/app/R$id;->ifl_tile_exp_export:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    sget p1, Linstafel/app/R$id;->ifl_tile_exp_comperator:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    sget p1, Linstafel/app/R$id;->ifl_tile_exp_analyzer:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    sget p1, Linstafel/app/R$id;->ifl_tile_exp_develeov:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

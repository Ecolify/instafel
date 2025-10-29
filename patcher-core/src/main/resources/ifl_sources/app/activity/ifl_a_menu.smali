.class public Linstafel/app/activity/ifl_a_menu;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_menu.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 40
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_menu;->openAdminDashboard()V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 60
    const-class p1, Linstafel/app/activity/ifl_a_ghost_mode;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$10$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 74
    const-string p1, "https://instafel.app/wiki"

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$11$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 75
    const-string p1, "https://github.com/mamiiblt/instafel"

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$12$instafel-app-activity-ifl_a_menu(Landroid/view/View;)Z
    .locals 1

    .line 77
    sget-boolean p1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 78
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_menu;->openAdminDashboard()V

    goto :goto_0

    .line 80
    :cond_0
    const-string p1, "Admin dasboard isn\'t available on custom generations."

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return v0
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 61
    const-class p1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 62
    const-class p1, Linstafel/app/activity/library/ifl_a_library_menu;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$4$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 63
    const-class p1, Linstafel/app/activity/ifl_a_misc;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$5$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 64
    const-class p1, Linstafel/app/activity/devmode/ifl_a_devmode;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$6$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 65
    const-class p1, Linstafel/app/activity/ifl_a_ota;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$7$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 69
    invoke-static {p0}, Linstafel/app/utils/InitializeInstafel;->triggerUploadMapping(Landroid/app/Activity;)V

    .line 70
    const-class p1, Linstafel/app/activity/ifl_a_language;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$8$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 72
    const-class p1, Linstafel/app/activity/about/ifl_a_about;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$9$instafel-app-activity-ifl_a_menu(Landroid/view/View;)V
    .locals 0

    .line 73
    const-string p1, "https://t.me/instafel"

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 31
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x1

    .line 33
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 34
    sget v0, Linstafel/app/R$layout;->ifl_at_menu:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_menu;->setContentView(I)V

    .line 36
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 37
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_show_admin_dash_as_tile:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 39
    sget v1, Linstafel/app/R$id;->ifl_tile_menu_adminmenu:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 40
    sget v1, Linstafel/app/R$id;->ifl_tile_menu_adminmenu:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v3, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    :cond_0
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_debug_mode:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 45
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_mode_warning_dialog:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 47
    const-string v3, "Warning"

    const-string v4, "Debug mode enabled, this mode not designed for Instagram runtime. If you don\'t know what are you doing, disable this mode!"

    const-string v5, "Okay"

    const/4 v6, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v8}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object v1

    .line 55
    invoke-virtual {v1}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    .line 56
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_mode_warning_dialog:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    move-object v2, p0

    .line 60
    :goto_0
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_ghost_mode:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda7;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_crashlogs:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda8;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_library:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda9;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_misc:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda10;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_devopt:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda11;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_ota:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda12;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    sget p1, Linstafel/app/R$id;->ifl_tile_menu_sections:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileSocials;

    .line 68
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileLanguage()Landroidx/cardview/widget/CardView;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileInfo()Landroidx/cardview/widget/CardView;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileChat()Landroidx/cardview/widget/CardView;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileGuide()Landroidx/cardview/widget/CardView;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileGithub()Landroidx/cardview/widget/CardView;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda5;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    invoke-virtual {p1}, Linstafel/app/ui/TileSocials;->getTileInfo()Landroidx/cardview/widget/CardView;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_menu$$ExternalSyntheticLambda6;-><init>(Linstafel/app/activity/ifl_a_menu;)V

    invoke-virtual {p1, v0}, Landroidx/cardview/widget/CardView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 96
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 97
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 98
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ui_recreate:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_menu;->recreate()V

    .line 101
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ui_recreate:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public openAdminDashboard()V
    .locals 1

    .line 87
    invoke-static {p0}, Linstafel/app/utils/InstafelAdminUser;->isUserLogged(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    const-class v0, Linstafel/app/activity/admin/ifl_a_admin_login;

    invoke-static {p0, v0}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void

    .line 90
    :cond_0
    const-class v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;

    invoke-static {p0, v0}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

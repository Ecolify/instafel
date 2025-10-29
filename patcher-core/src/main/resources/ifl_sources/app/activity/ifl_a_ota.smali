.class public Linstafel/app/activity/ifl_a_ota;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_ota.java"


# instance fields
.field private notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

.field private preferenceManager:Linstafel/app/managers/PreferenceManager;

.field private switchView:Landroid/widget/Switch;

.field private switchViewBackground:Landroid/widget/Switch;

.field private tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

.field private tileCheck:Linstafel/app/ui/TileLarge;

.field private tileFreq:Linstafel/app/ui/TileLarge;

.field private tileSetting:Linstafel/app/ui/TileLargeSwitch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private disablePage()V
    .locals 2

    .line 228
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 229
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 230
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeSwitch;->setVisibility(I)V

    .line 231
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$onCreate$5(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 127
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method


# virtual methods
.method public enableDisableBDownloadFeature(Z)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 160
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x1

    if-lt p1, v1, :cond_1

    .line 161
    const-string p1, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_ota;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 162
    new-array v1, v2, [Ljava/lang/String;

    aput-object p1, v1, v0

    invoke-virtual {p0, v1, v2}, Linstafel/app/activity/ifl_a_ota;->requestPermissions([Ljava/lang/String;I)V

    .line 163
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    return-void

    .line 165
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 166
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

    invoke-virtual {p1}, Linstafel/app/managers/NotificationOtaManager;->createNotificationChannel()V

    .line 167
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {p1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    return-void

    .line 170
    :cond_1
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 171
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

    invoke-virtual {p1}, Linstafel/app/managers/NotificationOtaManager;->createNotificationChannel()V

    .line 172
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {p1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    return-void

    .line 175
    :cond_2
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 176
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

    invoke-virtual {p1}, Linstafel/app/managers/NotificationOtaManager;->createNotificationChannel()V

    .line 177
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    return-void
.end method

.method public enableDisableOtaFeature(Z)V
    .locals 2

    if-eqz p1, :cond_1

    .line 207
    invoke-static {p0}, Linstafel/app/managers/PermissionManager;->checkPermission(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 208
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_ota;->enablePage()V

    .line 209
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void

    .line 211
    :cond_0
    invoke-direct {p0}, Linstafel/app/activity/ifl_a_ota;->disablePage()V

    .line 212
    invoke-static {p0}, Linstafel/app/managers/PermissionManager;->requestInstallPermission(Landroid/app/Activity;)V

    return-void

    .line 215
    :cond_1
    invoke-direct {p0}, Linstafel/app/activity/ifl_a_ota;->disablePage()V

    .line 216
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public enablePage()V
    .locals 2

    .line 221
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 222
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 223
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeSwitch;->setVisibility(I)V

    .line 224
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    return-void
.end method

.method synthetic lambda$onCreate$0$instafel-app-activity-ifl_a_ota(Landroid/view/View;)V
    .locals 0

    .line 66
    const-string p1, "https://instafel.app/about_updater"

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-ifl_a_ota(Landroid/view/View;)V
    .locals 0

    .line 81
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_ota;->enableDisableBDownloadFeature(Z)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-ifl_a_ota(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 82
    invoke-virtual {p0, p2}, Linstafel/app/activity/ifl_a_ota;->enableDisableBDownloadFeature(Z)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-ifl_a_ota(Landroid/view/View;)V
    .locals 3

    .line 84
    sget-boolean p1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz p1, :cond_0

    .line 85
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_ota;->enableDisableOtaFeature(Z)V

    .line 86
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceLong(Ljava/lang/String;J)V

    .line 87
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/ota/LastCheck;->get(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void

    .line 89
    :cond_0
    const-string p1, "This is not an production build."

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$4$instafel-app-activity-ifl_a_ota(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 94
    sget-boolean p1, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz p1, :cond_0

    .line 95
    invoke-virtual {p0, p2}, Linstafel/app/activity/ifl_a_ota;->enableDisableOtaFeature(Z)V

    .line 96
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object p2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, p2, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceLong(Ljava/lang/String;J)V

    .line 97
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-static {p0, p2}, Linstafel/app/ota/LastCheck;->get(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void

    .line 99
    :cond_0
    const-string p1, "This is not an production build."

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$6$instafel-app-activity-ifl_a_ota(Landroid/widget/Spinner;Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 130
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    .line 131
    invoke-static {p0, p1}, Linstafel/app/managers/FrequencyManager;->setFreq(Landroid/content/Context;I)V

    .line 132
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    invoke-static {p0}, Linstafel/app/managers/FrequencyManager;->getFreq(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$onCreate$7$instafel-app-activity-ifl_a_ota(Landroid/view/View;)V
    .locals 4

    .line 104
    new-instance p1, Landroid/app/Dialog;

    invoke-direct {p1, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 105
    sget v0, Linstafel/app/R$layout;->ifl_dg_ota_set_freq:I

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(I)V

    .line 106
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x2

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 107
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget v1, Linstafel/app/R$drawable;->ifl_dg_ota_background:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/ifl_a_ota;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    .line 108
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    const/4 v1, 0x6

    .line 110
    new-array v1, v1, [Ljava/lang/String;

    sget v2, Linstafel/app/R$string;->ifl_a5_dia_freq_00:I

    .line 111
    invoke-virtual {p0, v2}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    sget v0, Linstafel/app/R$string;->ifl_a5_dia_freq_01:I

    .line 112
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    sget v0, Linstafel/app/R$string;->ifl_a5_dia_freq_02:I

    .line 113
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    sget v0, Linstafel/app/R$string;->ifl_a5_dia_freq_03:I

    .line 114
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x3

    aput-object v0, v1, v2

    sget v0, Linstafel/app/R$string;->ifl_a5_dia_freq_04:I

    .line 115
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x4

    aput-object v0, v1, v2

    sget v0, Linstafel/app/R$string;->ifl_a5_dia_freq_05:I

    .line 116
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x5

    aput-object v0, v1, v2

    .line 118
    sget v0, Linstafel/app/R$id;->ifl_dialog_spinner:I

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 119
    new-instance v2, Landroid/widget/ArrayAdapter;

    const v3, 0x1090008

    invoke-direct {v2, p0, v3, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v1, 0x1090009

    .line 121
    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 122
    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 123
    invoke-static {p0}, Linstafel/app/managers/FrequencyManager;->getFreqId(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 125
    sget v1, Linstafel/app/R$id;->ifl_dg_button_negative:I

    invoke-virtual {p1, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 126
    sget v2, Linstafel/app/R$id;->ifl_dg_button_pozitive:I

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 127
    new-instance v3, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda6;

    invoke-direct {v3, p1}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda6;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    new-instance v1, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, v0, p1}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda7;-><init>(Linstafel/app/activity/ifl_a_ota;Landroid/widget/Spinner;Landroid/app/Dialog;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 147
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 149
    invoke-static {p0}, Linstafel/app/managers/PermissionManager;->checkPermission(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 150
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_ota;->enablePage()V

    .line 151
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object p2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void

    .line 153
    :cond_0
    invoke-direct {p0}, Linstafel/app/activity/ifl_a_ota;->disablePage()V

    .line 154
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object p2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 50
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 52
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 53
    sget v0, Linstafel/app/R$layout;->ifl_at_ota:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->setContentView(I)V

    .line 55
    new-instance v0, Linstafel/app/managers/NotificationOtaManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/NotificationOtaManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

    .line 56
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 58
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_check:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    .line 59
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_freq:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    .line 60
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_enable_updates:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileSetting:Linstafel/app/ui/TileLargeSwitch;

    .line 61
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_background_download:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

    .line 62
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    .line 63
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileSetting:Linstafel/app/ui/TileLargeSwitch;

    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    .line 65
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_instafel_updater:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_ota;->enablePage()V

    goto :goto_0

    .line 72
    :cond_0
    invoke-direct {p0}, Linstafel/app/activity/ifl_a_ota;->disablePage()V

    .line 73
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 74
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 75
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeSwitch;->setVisibility(I)V

    .line 78
    :goto_0
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    iget-object v1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 79
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    iget-object v1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 81
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileBackgroundDownload:Linstafel/app/ui/TileLargeSwitch;

    new-instance v0, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLargeSwitch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    new-instance v0, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 83
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileSetting:Linstafel/app/ui/TileLargeSwitch;

    new-instance v0, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLargeSwitch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->switchView:Landroid/widget/Switch;

    new-instance v0, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 103
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Linstafel/app/activity/ifl_a_ota$$ExternalSyntheticLambda5;-><init>(Linstafel/app/activity/ifl_a_ota;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileCheck:Linstafel/app/ui/TileLarge;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/ota/LastCheck;->get(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 140
    iget-object p1, p0, Linstafel/app/activity/ifl_a_ota;->tileFreq:Linstafel/app/ui/TileLarge;

    invoke-static {p0}, Linstafel/app/managers/FrequencyManager;->getFreq(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 142
    sget p1, Linstafel/app/R$id;->ifl_tile_ota_check:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_ota;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    invoke-static {p0, p1}, Linstafel/app/ota/CheckUpdates;->set(Landroid/app/Activity;Linstafel/app/ui/TileLarge;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 10

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 184
    array-length v1, p3

    const/4 v2, 0x0

    if-lez v1, :cond_0

    aget v1, p3, v2

    if-nez v1, :cond_0

    .line 185
    iget-object v1, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 186
    iget-object v1, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 187
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->notificationOtaManager:Linstafel/app/managers/NotificationOtaManager;

    invoke-virtual {v0}, Linstafel/app/managers/NotificationOtaManager;->createNotificationChannel()V

    goto :goto_0

    .line 189
    :cond_0
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 190
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ota;->switchViewBackground:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setChecked(Z)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 191
    const-string v4, "Permission Denied"

    const-string v5, "Instafel\'s notification permission was denied. If this problem persists, do not forget to turn on notifications from the application settings."

    const-string v6, "Okay"

    const/4 v7, 0x0

    move-object v3, p0

    invoke-static/range {v3 .. v9}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)Linstafel/app/utils/dialog/InstafelDialog;

    move-result-object v0

    .line 199
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    .line 202
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.class public Linstafel/app/activity/ifl_a_misc;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_misc.java"


# instance fields
.field preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-ifl_a_misc(Landroid/view/View;)V
    .locals 1

    .line 34
    sget p1, Linstafel/app/R$string;->ifl_a0_14:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_misc;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 21
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 23
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 24
    sget v0, Linstafel/app/R$layout;->ifl_at_misc:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_misc;->setContentView(I)V

    .line 25
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 26
    iput-object v0, p0, Linstafel/app/activity/ifl_a_misc;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 28
    sget v0, Linstafel/app/R$id;->ifl_tile_remove_ads_section:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_misc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 29
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v1

    .line 30
    const-string v2, "remove_ads"

    invoke-static {v2}, Linstafel/app/InstafelEnv;->isPatchApplied(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 33
    invoke-virtual {v1, p1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 34
    new-instance p1, Linstafel/app/activity/ifl_a_misc$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Linstafel/app/activity/ifl_a_misc$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/ifl_a_misc;)V

    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLargeSwitch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_0
    const/16 p1, 0x8

    .line 36
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLargeSwitch;->setVisibility(I)V

    return-void
.end method

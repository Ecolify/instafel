.class public Linstafel/app/activity/about/ifl_a_about;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_about.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-about-ifl_a_about(Linstafel/app/ui/TileLarge;Landroid/view/View;)V
    .locals 1

    .line 33
    const-string p2, "clipboard"

    invoke-virtual {p0, p2}, Linstafel/app/activity/about/ifl_a_about;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/ClipboardManager;

    const-string v0, "ifl_log_clip"

    invoke-virtual {p1}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-about-ifl_a_about(Landroid/view/View;)V
    .locals 0

    .line 36
    const-class p1, Linstafel/app/activity/about/ifl_a_build_info;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-about-ifl_a_about(Landroid/view/View;)V
    .locals 0

    .line 37
    const-string p1, "https://instafel.app/contributors"

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-about-ifl_a_about(Landroid/view/View;)V
    .locals 0

    .line 38
    const-string p1, "https://instafel.app"

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$4$instafel-app-activity-about-ifl_a_about(Landroid/view/View;)V
    .locals 0

    .line 39
    const-string p1, "https://mamii.me/about"

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$5$instafel-app-activity-about-ifl_a_about(Landroid/view/View;)V
    .locals 0

    .line 40
    const-string p1, "https://t.me/instafel"

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 21
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 23
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 24
    sget p1, Linstafel/app/R$layout;->ifl_at_about:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->setContentView(I)V

    .line 26
    sget p1, Linstafel/app/R$id;->ifl_tile_ifl_version:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    .line 27
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIflVersionString(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 29
    sget p1, Linstafel/app/R$id;->ifl_tile_ig_version:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    .line 30
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIgVerAndCodeString(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 31
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIgVerAndCodeString(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 32
    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/about/ifl_a_about;Linstafel/app/ui/TileLarge;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    sget p1, Linstafel/app/R$id;->ifl_tile_build_info:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/about/ifl_a_about;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    sget p1, Linstafel/app/R$id;->ifl_tile_contributors:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/about/ifl_a_about;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    sget p1, Linstafel/app/R$id;->ifl_tile_website:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/about/ifl_a_about;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    sget p1, Linstafel/app/R$id;->ifl_tile_about_dev:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/about/ifl_a_about;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    sget p1, Linstafel/app/R$id;->ifl_tile_join_community:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_about;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_about$$ExternalSyntheticLambda5;-><init>(Linstafel/app/activity/about/ifl_a_about;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public openUrlInWeb(Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

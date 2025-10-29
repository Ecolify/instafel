.class public Linstafel/app/activity/about/ifl_a_build_info;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_build_info.java"


# instance fields
.field private tileAppliedPatches:Linstafel/app/ui/TileLarge;

.field private tileCommit:Linstafel/app/ui/TileLarge;

.field private tileGenerationId:Linstafel/app/ui/TileLarge;

.field private tileInstallationType:Linstafel/app/ui/TileLarge;

.field private tilePatcherVersion:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-about-ifl_a_build_info(Landroid/view/View;)V
    .locals 1

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "https://instafel.app/releases/view?version="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Linstafel/app/InstafelEnv;->IFL_VERSION:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-about-ifl_a_build_info(Landroid/view/View;)V
    .locals 1

    .line 42
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "https://github.com/mamiiblt/instafel/commit/"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Linstafel/app/InstafelEnv;->COMMIT:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-about-ifl_a_build_info(Landroid/view/View;)V
    .locals 1

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "https://github.com/instafel/p-rel/releases/tag/"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Linstafel/app/InstafelEnv;->PATCHER_VERSION:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->openUrlInWeb(Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 25
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 27
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 28
    sget p1, Linstafel/app/R$layout;->ifl_at_build_info:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->setContentView(I)V

    .line 30
    sget p1, Linstafel/app/R$id;->ifl_tile_generation_id:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileGenerationId:Linstafel/app/ui/TileLarge;

    .line 31
    sget p1, Linstafel/app/R$id;->ifl_tile_patcher_version:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tilePatcherVersion:Linstafel/app/ui/TileLarge;

    .line 32
    sget p1, Linstafel/app/R$id;->ifl_tile_commit:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileCommit:Linstafel/app/ui/TileLarge;

    .line 33
    sget p1, Linstafel/app/R$id;->ifl_tile_applied_patches:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileAppliedPatches:Linstafel/app/ui/TileLarge;

    .line 34
    sget p1, Linstafel/app/R$id;->ifl_tile_installation_type:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/about/ifl_a_build_info;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileInstallationType:Linstafel/app/ui/TileLarge;

    .line 36
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileGenerationId:Linstafel/app/ui/TileLarge;

    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getGenerationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 37
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileGenerationId:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/about/ifl_a_build_info;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tilePatcherVersion:Linstafel/app/ui/TileLarge;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Linstafel/app/InstafelEnv;->PATCHER_VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Linstafel/app/InstafelEnv;->PATCHER_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 40
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileCommit:Linstafel/app/ui/TileLarge;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Linstafel/app/InstafelEnv;->COMMIT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (main)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 42
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileCommit:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/about/ifl_a_build_info;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tilePatcherVersion:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_build_info$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/about/ifl_a_build_info;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileAppliedPatches:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/about/ifl_a_build_info$1;

    invoke-direct {v0, p0}, Linstafel/app/activity/about/ifl_a_build_info$1;-><init>(Linstafel/app/activity/about/ifl_a_build_info;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info;->tileInstallationType:Linstafel/app/ui/TileLarge;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/ota/IflEnvironment;->getTypeString(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void
.end method

.method public openUrlInWeb(Ljava/lang/String;)V
    .locals 0

    .line 56
    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

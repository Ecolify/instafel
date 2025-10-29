.class public Linstafel/app/activity/library/ifl_a_library_menu;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_library_menu.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-library-ifl_a_library_menu(Landroid/view/View;)V
    .locals 0

    .line 23
    const-string p1, "https://instafel.app/library/flag"

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-library-ifl_a_library_menu(Landroid/view/View;)V
    .locals 0

    .line 24
    const-class p1, Linstafel/app/activity/library/backup/ifl_a_library_backup;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 18
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 20
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 21
    sget p1, Linstafel/app/R$layout;->ifl_at_library_menu:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/ifl_a_library_menu;->setContentView(I)V

    .line 23
    sget p1, Linstafel/app/R$id;->ifl_tile_flag_library:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/ifl_a_library_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/library/ifl_a_library_menu$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/ifl_a_library_menu$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/library/ifl_a_library_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    sget p1, Linstafel/app/R$id;->ifl_tile_backup_library:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/ifl_a_library_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Linstafel/app/activity/library/ifl_a_library_menu$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/ifl_a_library_menu$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/library/ifl_a_library_menu;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

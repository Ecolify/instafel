.class public Linstafel/app/activity/admin/ifl_a_admin_dashboard;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_admin_dashboard.java"


# instance fields
.field overridesManager:Linstafel/app/managers/OverridesManager;

.field tileApprovePreview:Linstafel/app/ui/TileCompact;

.field tileExportMapping:Linstafel/app/ui/TileCompact;

.field tileLogout:Linstafel/app/ui/TileCompact;

.field tilePreferenceManager:Linstafel/app/ui/TileCompact;

.field tileUpdateBackup:Linstafel/app/ui/TileCompact;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-admin-ifl_a_admin_dashboard(Landroid/view/View;)V
    .locals 0

    .line 41
    const-class p1, Linstafel/app/activity/admin/ifl_a_admin_action_updatebackup;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-admin-ifl_a_admin_dashboard(Landroid/view/View;)V
    .locals 0

    .line 42
    const-class p1, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-admin-ifl_a_admin_dashboard(Landroid/view/View;)V
    .locals 4

    .line 44
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 45
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIgVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "."

    const-string v3, "d"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.extra.TITLE"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v0, "application/json"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0xf

    .line 48
    invoke-virtual {p0, p1, v0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-admin-ifl_a_admin_dashboard(Landroid/view/View;)V
    .locals 1

    .line 52
    invoke-static {p0}, Linstafel/app/utils/InstafelAdminUser;->isUserLogged(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 53
    invoke-static {p0}, Linstafel/app/utils/InstafelAdminUser;->logout(Landroid/app/Activity;)V

    .line 54
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->finish()V

    return-void

    .line 56
    :cond_0
    const-string p1, "User not logged"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$4$instafel-app-activity-admin-ifl_a_admin_dashboard(Landroid/view/View;)V
    .locals 0

    .line 60
    const-class p1, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 65
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0xf

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    if-eqz p3, :cond_1

    .line 71
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    const/4 p3, 0x0

    if-nez p1, :cond_2

    .line 77
    sget p1, Linstafel/app/R$string;->ifl_a4_04:I

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_2
    const/4 v0, -0x1

    if-ne p2, v0, :cond_5

    .line 83
    :try_start_0
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p2}, Linstafel/app/managers/OverridesManager;->readMappingFile()Lorg/json/JSONArray;

    move-result-object p2

    if-nez p2, :cond_3

    .line 85
    const-string p1, "Error while reading mapping file."

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 87
    :cond_3
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v0, p1, p2}, Linstafel/app/managers/OverridesManager;->writeContentIntoMappingFile(Landroid/net/Uri;Lorg/json/JSONArray;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 89
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " mapping successfully exported"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 91
    :cond_4
    const-string p1, "Error while writing content into mapping file."

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 95
    const-string p2, "Error while exporting mapping file"

    invoke-static {p0, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 96
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 29
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 31
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 32
    sget p1, Linstafel/app/R$layout;->ifl_at_admin_dashboard:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->setContentView(I)V

    .line 34
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 35
    sget p1, Linstafel/app/R$id;->ifl_tile_admin_action_logout:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileCompact;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileLogout:Linstafel/app/ui/TileCompact;

    .line 36
    sget p1, Linstafel/app/R$id;->ifl_tile_admin_action_export_mapping:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileCompact;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileExportMapping:Linstafel/app/ui/TileCompact;

    .line 37
    sget p1, Linstafel/app/R$id;->ifl_tile_admin_action_sharedpref_manager:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileCompact;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tilePreferenceManager:Linstafel/app/ui/TileCompact;

    .line 38
    sget p1, Linstafel/app/R$id;->ifl_tile_admin_update_approve_preview:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileCompact;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileApprovePreview:Linstafel/app/ui/TileCompact;

    .line 40
    sget p1, Linstafel/app/R$id;->ifl_tile_admin_update_update_backup:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileCompact;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileUpdateBackup:Linstafel/app/ui/TileCompact;

    .line 41
    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/admin/ifl_a_admin_dashboard;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileApprovePreview:Linstafel/app/ui/TileCompact;

    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/admin/ifl_a_admin_dashboard;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileExportMapping:Linstafel/app/ui/TileCompact;

    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/admin/ifl_a_admin_dashboard;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tileLogout:Linstafel/app/ui/TileCompact;

    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/admin/ifl_a_admin_dashboard;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_dashboard;->tilePreferenceManager:Linstafel/app/ui/TileCompact;

    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_dashboard$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/admin/ifl_a_admin_dashboard;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.class public Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_library_backup_info_author.java"


# instance fields
.field private tileAuthorGithub:Linstafel/app/ui/TileLarge;

.field private tileAuthorInstagram:Linstafel/app/ui/TileLarge;

.field private tileAuthorMedium:Linstafel/app/ui/TileLarge;

.field private tileAuthorName:Linstafel/app/ui/TileLarge;

.field private tileAuthorX:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-library-backup-ifl_a_library_backup_info_author(Landroid/view/View;)V
    .locals 0

    .line 69
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorGithub:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->openUrl(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-library-backup-ifl_a_library_backup_info_author(Landroid/view/View;)V
    .locals 0

    .line 70
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorInstagram:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->openUrl(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-library-backup-ifl_a_library_backup_info_author(Landroid/view/View;)V
    .locals 0

    .line 71
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorMedium:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->openUrl(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-library-backup-ifl_a_library_backup_info_author(Landroid/view/View;)V
    .locals 0

    .line 72
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorX:Linstafel/app/ui/TileLarge;

    invoke-virtual {p1}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->openUrl(Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12

    .line 25
    const-string v0, "instagram"

    const-string v1, "x"

    const-string v2, "medium"

    const-string v3, "github"

    .line 0
    const-string v4, "instagram.com/"

    const-string v5, "x.com/"

    const-string v6, "medium.com/@"

    const-string v7, "github.com/"

    .line 25
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 27
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-static {p0, v8}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 28
    sget v8, Linstafel/app/R$layout;->ifl_at_library_backup_info_author:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->setContentView(I)V

    .line 30
    sget v8, Linstafel/app/R$id;->ifl_tile_backup_library_author_name:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Linstafel/app/ui/TileLarge;

    iput-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorName:Linstafel/app/ui/TileLarge;

    .line 31
    sget v8, Linstafel/app/R$id;->ifl_tile_backup_library_social_github:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Linstafel/app/ui/TileLarge;

    iput-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorGithub:Linstafel/app/ui/TileLarge;

    .line 32
    sget v8, Linstafel/app/R$id;->ifl_tile_backup_library_social_ig:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Linstafel/app/ui/TileLarge;

    iput-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorInstagram:Linstafel/app/ui/TileLarge;

    .line 33
    sget v8, Linstafel/app/R$id;->ifl_tile_backup_library_social_medium:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Linstafel/app/ui/TileLarge;

    iput-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorMedium:Linstafel/app/ui/TileLarge;

    .line 34
    sget v8, Linstafel/app/R$id;->ifl_tile_backup_library_social_x:I

    invoke-virtual {p0, v8}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Linstafel/app/ui/TileLarge;

    iput-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorX:Linstafel/app/ui/TileLarge;

    .line 37
    :try_start_0
    invoke-virtual {p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->getIntent()Landroid/content/Intent;

    move-result-object v8

    .line 38
    new-instance v9, Lorg/json/JSONObject;

    const-string v10, "data"

    invoke-virtual {v8, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    iget-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorName:Linstafel/app/ui/TileLarge;

    const-string v10, "name"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 41
    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    const/16 v10, 0x8

    if-eqz v8, :cond_0

    .line 42
    iget-object v8, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorGithub:Linstafel/app/ui/TileLarge;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_0

    .line 44
    :cond_0
    iget-object v3, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorGithub:Linstafel/app/ui/TileLarge;

    invoke-virtual {v3, v10}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 47
    :goto_0
    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 48
    iget-object v3, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorMedium:Linstafel/app/ui/TileLarge;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_1

    .line 50
    :cond_1
    iget-object v2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorMedium:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v10}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 53
    :goto_1
    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 54
    iget-object v2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorX:Linstafel/app/ui/TileLarge;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_2

    .line 56
    :cond_2
    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorX:Linstafel/app/ui/TileLarge;

    invoke-virtual {v1, v10}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    .line 59
    :goto_2
    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 60
    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorInstagram:Linstafel/app/ui/TileLarge;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_3

    .line 62
    :cond_3
    iget-object v0, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorInstagram:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0, v10}, Linstafel/app/ui/TileLarge;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 65
    sget v1, Linstafel/app/R$string;->ifl_a11_21:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 66
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    :goto_3
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorGithub:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorInstagram:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorMedium:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;->tileAuthorX:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/library/backup/ifl_a_library_backup_info_author;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public openUrl(Ljava/lang/String;)V
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

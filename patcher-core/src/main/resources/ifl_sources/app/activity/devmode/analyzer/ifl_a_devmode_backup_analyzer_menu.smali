.class public Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode_backup_analyzer_menu.java"


# instance fields
.field private buttonText:Landroid/widget/TextView;

.field private mappingContentUri:Landroid/net/Uri;

.field private overrideContent:Lorg/json/JSONObject;

.field private overridesManager:Linstafel/app/managers/OverridesManager;

.field private startAnalyze:Landroid/widget/LinearLayout;

.field private tileCustomMapping:Linstafel/app/ui/TileLarge;

.field private tileCustomOverride:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overrideContent:Lorg/json/JSONObject;

    .line 28
    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->mappingContentUri:Landroid/net/Uri;

    return-void
.end method

.method static synthetic access$000(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Lorg/json/JSONObject;
    .locals 0

    .line 25
    iget-object p0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overrideContent:Lorg/json/JSONObject;

    return-object p0
.end method

.method static synthetic access$100(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)Landroid/net/Uri;
    .locals 0

    .line 25
    iget-object p0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->mappingContentUri:Landroid/net/Uri;

    return-object p0
.end method

.method private updateButtonText()V
    .locals 2

    .line 159
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overrideContent:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->mappingContentUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 160
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->buttonText:Landroid/widget/TextView;

    sget v1, Linstafel/app/R$string;->ifl_a4_31:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    if-eqz v0, :cond_1

    .line 162
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->buttonText:Landroid/widget/TextView;

    sget v1, Linstafel/app/R$string;->ifl_a4_29:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 163
    :cond_1
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->mappingContentUri:Landroid/net/Uri;

    if-eqz v0, :cond_2

    .line 164
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->buttonText:Landroid/widget/TextView;

    sget v1, Linstafel/app/R$string;->ifl_a4_30:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 166
    :cond_2
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->buttonText:Landroid/widget/TextView;

    sget v1, Linstafel/app/R$string;->ifl_a4_28:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 98
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0xb

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eq p1, p2, :cond_4

    const/16 p2, 0x16

    if-eq p1, p2, :cond_0

    goto/16 :goto_0

    :cond_0
    if-eqz p3, :cond_1

    .line 131
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    .line 137
    sget p1, Linstafel/app/R$string;->ifl_a11_38:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 142
    :cond_2
    :try_start_0
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v0}, Linstafel/app/managers/OverridesManager;->readMappingFileFromUri(Landroid/net/Uri;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 144
    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->mappingContentUri:Landroid/net/Uri;

    .line 145
    invoke-direct {p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->updateButtonText()V

    return-void

    .line 147
    :cond_3
    sget p1, Linstafel/app/R$string;->ifl_a11_40:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 150
    sget p2, Linstafel/app/R$string;->ifl_a11_40:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 151
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_4
    if-eqz p3, :cond_5

    .line 104
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    :cond_5
    if-nez v0, :cond_6

    .line 110
    sget p1, Linstafel/app/R$string;->ifl_a11_38:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 115
    :cond_6
    :try_start_1
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v0}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 117
    const-string p2, "backup"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overrideContent:Lorg/json/JSONObject;

    .line 118
    invoke-direct {p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->updateButtonText()V

    return-void

    .line 120
    :cond_7
    sget p1, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception p1

    .line 123
    sget p2, Linstafel/app/R$string;->ifl_a11_39:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 124
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 36
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 38
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 39
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode_backup_analyzer_menu:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->setContentView(I)V

    .line 41
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 42
    sget p1, Linstafel/app/R$id;->ifl_button_text:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->buttonText:Landroid/widget/TextView;

    .line 44
    sget p1, Linstafel/app/R$id;->ifl_tile_use_custom_override:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->tileCustomOverride:Linstafel/app/ui/TileLarge;

    .line 45
    sget p1, Linstafel/app/R$id;->ifl_tile_use_custom_mapping:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->tileCustomMapping:Linstafel/app/ui/TileLarge;

    .line 46
    sget p1, Linstafel/app/R$id;->ifl_start_analyze:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->startAnalyze:Landroid/widget/LinearLayout;

    .line 47
    invoke-direct {p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->updateButtonText()V

    .line 49
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->tileCustomOverride:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$1;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$1;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->tileCustomMapping:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$2;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;->startAnalyze:Landroid/widget/LinearLayout;

    new-instance v0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu$3;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer_menu;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.class public Linstafel/app/activity/ifl_a_language;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_language.java"


# instance fields
.field private languagesArea:Landroid/widget/LinearLayout;

.field private localeInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Linstafel/app/utils/localization/LocalizationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private tileDeviceSwitch:Landroid/widget/Switch;

.field private tileLangDevice:Linstafel/app/ui/TileLargeSwitch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-ifl_a_language(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 72
    invoke-static {p0, p2}, Linstafel/app/utils/localization/LocalizationUtils;->setStateOfDevice(Landroid/app/Activity;Z)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-ifl_a_language(Landroid/view/View;)V
    .locals 0

    .line 73
    iget-object p1, p0, Linstafel/app/activity/ifl_a_language;->tileDeviceSwitch:Landroid/widget/Switch;

    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->setStateOfDevice(Landroid/app/Activity;Z)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 33
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x1

    .line 35
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 36
    sget v0, Linstafel/app/R$layout;->ifl_at_language:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_language;->setContentView(I)V

    .line 38
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 39
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_lang:Ljava/lang/String;

    const-string v2, "def"

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 41
    sget v1, Linstafel/app/R$id;->ifl_languages_layout:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/ifl_a_language;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Linstafel/app/activity/ifl_a_language;->languagesArea:Landroid/widget/LinearLayout;

    .line 42
    sget v1, Linstafel/app/R$id;->ifl_tile_lang_device:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/ifl_a_language;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Linstafel/app/ui/TileLargeSwitch;

    iput-object v1, p0, Linstafel/app/activity/ifl_a_language;->tileLangDevice:Linstafel/app/ui/TileLargeSwitch;

    .line 43
    invoke-virtual {v1}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/ifl_a_language;->tileDeviceSwitch:Landroid/widget/Switch;

    .line 44
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    .line 46
    new-instance v1, Ljava/util/Locale;

    const-string v3, "en"

    invoke-direct {v1, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 48
    sget-object v3, Linstafel/app/utils/localization/Locales;->SUPPORTED_LOCALES:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 49
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget-object v5, v5, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 50
    iget-object v3, p0, Linstafel/app/activity/ifl_a_language;->tileLangDevice:Linstafel/app/ui/TileLargeSwitch;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget-object v5, v5, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v5, v1}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " (Supported)"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Linstafel/app/ui/TileLargeSwitch;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_1

    .line 53
    :cond_0
    iget-object v4, p0, Linstafel/app/activity/ifl_a_language;->tileLangDevice:Linstafel/app/ui/TileLargeSwitch;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    iget-object v6, v6, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v6, v1}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (Not Supported)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Linstafel/app/ui/TileLargeSwitch;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_0

    .line 57
    :cond_1
    :goto_1
    sget-object v1, Linstafel/app/utils/localization/Locales;->SUPPORTED_LOCALES:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 58
    iget-object v4, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    new-instance v6, Linstafel/app/utils/localization/LocalizationInfo;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Linstafel/app/utils/localization/Locales$LocaleType;

    invoke-direct {v6, p0, v7}, Linstafel/app/utils/localization/LocalizationInfo;-><init>(Landroid/content/Context;Linstafel/app/utils/localization/Locales$LocaleType;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    iget-object v4, p0, Linstafel/app/activity/ifl_a_language;->languagesArea:Landroid/widget/LinearLayout;

    iget-object v5, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Linstafel/app/utils/localization/LocalizationInfo;

    iget-object v3, v3, Linstafel/app/utils/localization/LocalizationInfo;->localeTile:Linstafel/app/ui/TileLarge;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 62
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 63
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language;->tileDeviceSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 64
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-static {v2, v0}, Linstafel/app/utils/localization/LocalizationUtils;->setVisibilityOfAllLocales(ZLjava/util/Map;)V

    goto :goto_3

    .line 66
    :cond_3
    iget-object v1, p0, Linstafel/app/activity/ifl_a_language;->tileDeviceSwitch:Landroid/widget/Switch;

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 67
    iget-object v1, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-static {p1, v1}, Linstafel/app/utils/localization/LocalizationUtils;->setVisibilityOfAllLocales(ZLjava/util/Map;)V

    .line 68
    iget-object v1, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-static {v0, p1, v1}, Linstafel/app/utils/localization/LocalizationUtils;->setSubIconVisibilityOfLocale(Ljava/lang/String;ZLjava/util/Map;)V

    .line 71
    :goto_3
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language;->localeInfos:Ljava/util/Map;

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->setLanguageClickListeners(Landroid/app/Activity;Ljava/util/Map;)V

    .line 72
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language;->tileDeviceSwitch:Landroid/widget/Switch;

    new-instance v1, Linstafel/app/activity/ifl_a_language$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_language$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/ifl_a_language;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 73
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language;->tileLangDevice:Linstafel/app/ui/TileLargeSwitch;

    new-instance v1, Linstafel/app/activity/ifl_a_language$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Linstafel/app/activity/ifl_a_language$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/ifl_a_language;)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeSwitch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    invoke-virtual {p0}, Linstafel/app/activity/ifl_a_language;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    new-instance v1, Linstafel/app/activity/ifl_a_language$1;

    invoke-direct {v1, p0, p1}, Linstafel/app/activity/ifl_a_language$1;-><init>(Linstafel/app/activity/ifl_a_language;Z)V

    invoke-virtual {v0, p0, v1}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    return-void
.end method

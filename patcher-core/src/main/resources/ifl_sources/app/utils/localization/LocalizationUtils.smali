.class public Linstafel/app/utils/localization/LocalizationUtils;
.super Ljava/lang/Object;
.source "LocalizationUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDeviceLocale()Linstafel/app/utils/localization/Locales$LocaleType;
    .locals 4

    .line 45
    sget-object v0, Linstafel/app/utils/localization/Locales;->SUPPORTED_LOCALES:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 46
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/localization/Locales$LocaleType;

    iget-object v2, v2, Linstafel/app/utils/localization/Locales$LocaleType;->langCode:Ljava/lang/String;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget-object v3, v3, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/localization/Locales$LocaleType;

    return-object v0

    .line 50
    :cond_1
    sget-object v0, Linstafel/app/utils/localization/Locales;->SUPPORTED_LOCALES:Ljava/util/Map;

    const-string v1, "en"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/localization/Locales$LocaleType;

    return-object v0
.end method

.method public static getIflLocale(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 55
    const-string v0, "def"

    :try_start_0
    new-instance v1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 56
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_lang:Ljava/lang/String;

    invoke-virtual {v1, p0, v0}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-static {}, Linstafel/app/utils/localization/LocalizationUtils;->getDeviceLocale()Linstafel/app/utils/localization/Locales$LocaleType;

    move-result-object p0

    iget-object p0, p0, Linstafel/app/utils/localization/Locales$LocaleType;->langCode:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object p0

    :catch_0
    move-exception p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 64
    const-string p0, "en"

    return-object p0
.end method

.method static synthetic lambda$setLanguageClickListeners$0(Landroid/app/Activity;Ljava/util/Map$Entry;Ljava/util/Map;Landroid/view/View;)V
    .locals 0

    .line 81
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-static {p0, p3}, Linstafel/app/utils/localization/LocalizationUtils;->writeLangToSP(Landroid/content/Context;Ljava/lang/String;)V

    .line 82
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 p3, 0x1

    invoke-static {p1, p3, p2}, Linstafel/app/utils/localization/LocalizationUtils;->setSubIconVisibilityOfLocale(Ljava/lang/String;ZLjava/util/Map;)V

    .line 83
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void
.end method

.method public static setLanguageClickListeners(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Linstafel/app/utils/localization/LocalizationInfo;",
            ">;)V"
        }
    .end annotation

    .line 79
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 80
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Linstafel/app/utils/localization/LocalizationInfo;

    iget-object v2, v2, Linstafel/app/utils/localization/LocalizationInfo;->localeTile:Linstafel/app/ui/TileLarge;

    new-instance v3, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v1, p1}, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Ljava/util/Map$Entry;Ljava/util/Map;)V

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static setLocale(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .line 33
    :try_start_0
    new-instance v0, Ljava/util/Locale;

    invoke-direct {v0, p1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 34
    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 37
    invoke-virtual {v1, v0}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 38
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error while setting locale: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static setStateOfDevice(Landroid/app/Activity;Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 74
    const-string p1, "def"

    goto :goto_0

    :cond_0
    invoke-static {}, Linstafel/app/utils/localization/LocalizationUtils;->getDeviceLocale()Linstafel/app/utils/localization/Locales$LocaleType;

    move-result-object p1

    iget-object p1, p1, Linstafel/app/utils/localization/Locales$LocaleType;->langCode:Ljava/lang/String;

    :goto_0
    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->writeLangToSP(Landroid/content/Context;Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void
.end method

.method public static setSubIconVisibilityOfLocale(Ljava/lang/String;ZLjava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Linstafel/app/utils/localization/LocalizationInfo;",
            ">;)V"
        }
    .end annotation

    .line 95
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 96
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/localization/LocalizationInfo;

    invoke-virtual {v0, p1}, Linstafel/app/utils/localization/LocalizationInfo;->setTickStatus(Z)V

    goto :goto_0

    .line 99
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/localization/LocalizationInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Linstafel/app/utils/localization/LocalizationInfo;->setTickStatus(Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static setVisibilityOfAllLocales(ZLjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Linstafel/app/utils/localization/LocalizationInfo;",
            ">;)V"
        }
    .end annotation

    .line 89
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 90
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linstafel/app/utils/localization/LocalizationInfo;

    invoke-virtual {v0, p0}, Linstafel/app/utils/localization/LocalizationInfo;->setTileVisibility(Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V
    .locals 0

    .line 20
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 21
    invoke-static {p0}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Linstafel/app/InstafelEnv;->IFL_LANG:Ljava/lang/String;

    .line 22
    sget-object p1, Linstafel/app/InstafelEnv;->IFL_LANG:Ljava/lang/String;

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->setLocale(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 24
    :cond_0
    sget-object p1, Linstafel/app/InstafelEnv;->IFL_LANG:Ljava/lang/String;

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->setLocale(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public static writeLangToSP(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 69
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 70
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_lang:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

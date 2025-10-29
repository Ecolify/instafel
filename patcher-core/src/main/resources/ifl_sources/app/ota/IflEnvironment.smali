.class public Linstafel/app/ota/IflEnvironment;
.super Ljava/lang/Object;
.source "IflEnvironment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getGenerationId(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 69
    sget-boolean v0, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz v0, :cond_1

    .line 70
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 71
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_gen_id:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    sget-object p0, Linstafel/app/InstafelEnv;->GENERATION_ID:Ljava/lang/String;

    :cond_0
    return-object p0

    .line 78
    :cond_1
    const-string p0, "Custom Generation"

    return-object p0
.end method

.method public static getIflVersion(Landroid/content/Context;)I
    .locals 2

    .line 16
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 17
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ifl_version:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_0

    .line 19
    sget-object p0, Linstafel/app/InstafelEnv;->IFL_VERSION:Ljava/lang/String;

    .line 21
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return v1

    :cond_0
    return p0
.end method

.method public static getIflVersionString(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2

    .line 31
    sget-boolean v0, Linstafel/app/InstafelEnv;->PRODUCTION_MODE:Z

    if-eqz v0, :cond_0

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Release v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getIflVersion(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 34
    :cond_0
    const-string p0, "Custom Generation"

    return-object p0
.end method

.method public static getIgVerAndCodeString(Landroid/app/Activity;)Ljava/lang/String;
    .locals 5

    .line 39
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 40
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_version:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 41
    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_ver_code:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, ")"

    const-string v3, " ("

    const-string v4, "v"

    if-nez v1, :cond_1

    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 47
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object v0, Linstafel/app/InstafelEnv;->IG_VERSION_CODE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 50
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 51
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Linstafel/app/InstafelEnv;->IG_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 53
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Linstafel/app/InstafelEnv;->IG_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object v0, Linstafel/app/InstafelEnv;->IG_VERSION_CODE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getIgVerCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 59
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 60
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_ver_code:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    sget-object p0, Linstafel/app/InstafelEnv;->IG_VERSION_CODE:Ljava/lang/String;

    :cond_0
    return-object p0
.end method

.method public static getIgVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 83
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 84
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_version:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    sget-object p0, Linstafel/app/InstafelEnv;->IG_VERSION:Ljava/lang/String;

    :cond_0
    return-object p0
.end method

.method public static getType(Landroid/app/Activity;)Ljava/lang/String;
    .locals 1

    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    .line 114
    const-string v0, "com.instagram.android"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "instafel.app"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    const-string p0, "Clone"

    return-object p0

    .line 115
    :cond_1
    :goto_0
    const-string p0, "Unclone"

    return-object p0
.end method

.method public static getType(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 100
    const-string v0, "Unclone"

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    .line 101
    const-string v1, "com.instagram.android"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "instafel.app"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 104
    :cond_0
    const-string p0, "Clone"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_1
    :goto_0
    return-object v0

    :catch_0
    move-exception p0

    .line 107
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v0
.end method

.method public static getTypeString(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;
    .locals 3

    .line 93
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getType(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Clone"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ifl_a1_07"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1, v0, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 94
    :cond_0
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getType(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Unclone"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ifl_a1_08"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1, v0, v1}, Linstafel/app/utils/localization/LocalizedStringGetter;->getLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 95
    :cond_1
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getType(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

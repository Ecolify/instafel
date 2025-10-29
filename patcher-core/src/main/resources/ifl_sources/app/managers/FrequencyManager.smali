.class public Linstafel/app/managers/FrequencyManager;
.super Ljava/lang/Object;
.source "FrequencyManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFreq(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 21
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 22
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_freq:Ljava/lang/String;

    sget v2, Linstafel/app/utils/types/Types$FreqLabels;->EVERY_OPEN:I

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result v0

    .line 24
    sget v1, Linstafel/app/utils/types/Types$FreqLabels;->EVERY_OPEN:I

    if-eq v0, v1, :cond_5

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 41
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_00:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 35
    :cond_0
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_05:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 33
    :cond_1
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_04:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 31
    :cond_2
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_03:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 29
    :cond_3
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_02:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 27
    :cond_4
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_01:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 38
    :cond_5
    sget v0, Linstafel/app/R$string;->ifl_a5_sub_freq_00:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFreqId(Landroid/content/Context;)I
    .locals 2

    .line 16
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 17
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_freq:Ljava/lang/String;

    sget v1, Linstafel/app/utils/types/Types$FreqLabels;->EVERY_OPEN:I

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static setFreq(Landroid/content/Context;I)V
    .locals 1

    .line 11
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 12
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_freq:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Linstafel/app/managers/PreferenceManager;->setPreferenceInt(Ljava/lang/String;I)V

    return-void
.end method

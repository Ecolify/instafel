.class public Linstafel/app/ota/LastCheck;
.super Ljava/lang/Object;
.source "LastCheck.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;
    .locals 4

    .line 16
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 17
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Linstafel/app/managers/PreferenceManager;->getPreferenceLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 19
    new-instance v2, Landroid/icu/text/SimpleDateFormat;

    const-string v3, "dd/MM/yyyy HH:mm"

    invoke-direct {v2, v3, p1}, Landroid/icu/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 20
    sget p1, Linstafel/app/R$string;->ifl_a5_02:I

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Landroid/icu/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 22
    :cond_0
    sget p1, Linstafel/app/R$string;->ifl_a5_02:I

    sget v0, Linstafel/app/R$string;->ifl_a5_05:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static update(Landroid/app/Activity;)V
    .locals 3

    .line 27
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 28
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p0, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static updateUi(Landroid/app/Activity;)V
    .locals 2

    .line 32
    sget v0, Linstafel/app/R$id;->ifl_tile_ota_check:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLarge;

    .line 33
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {p0, v1}, Linstafel/app/ota/LastCheck;->get(Landroid/app/Activity;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    return-void
.end method

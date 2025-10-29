.class public Linstafel/app/utils/localization/LocalizationInfo;
.super Ljava/lang/Object;
.source "LocalizationInfo.java"


# instance fields
.field private ctx:Landroid/content/Context;

.field public localeData:Linstafel/app/utils/localization/Locales$LocaleType;

.field public localeTile:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>(Landroid/content/Context;Linstafel/app/utils/localization/Locales$LocaleType;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Linstafel/app/utils/localization/LocalizationInfo;->ctx:Landroid/content/Context;

    .line 18
    iput-object p2, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeData:Linstafel/app/utils/localization/Locales$LocaleType;

    .line 19
    invoke-direct {p0}, Linstafel/app/utils/localization/LocalizationInfo;->createLangTile()Linstafel/app/ui/TileLarge;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeTile:Linstafel/app/ui/TileLarge;

    return-void
.end method

.method private createLangTile()Linstafel/app/ui/TileLarge;
    .locals 4

    .line 31
    new-instance v0, Linstafel/app/ui/TileLarge;

    iget-object v1, p0, Linstafel/app/utils/localization/LocalizationInfo;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Linstafel/app/ui/TileLarge;-><init>(Landroid/content/Context;)V

    .line 32
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    iget-object v1, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeData:Linstafel/app/utils/localization/Locales$LocaleType;

    iget-object v1, v1, Linstafel/app/utils/localization/Locales$LocaleType;->langName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 37
    iget-object v1, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeData:Linstafel/app/utils/localization/Locales$LocaleType;

    iget-object v1, v1, Linstafel/app/utils/localization/Locales$LocaleType;->langCountry:Ljava/lang/String;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 38
    iget-object v1, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeData:Linstafel/app/utils/localization/Locales$LocaleType;

    iget v1, v1, Linstafel/app/utils/localization/Locales$LocaleType;->flagDrawableID:I

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setIconRes(I)V

    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setIconTint(Z)V

    .line 40
    const-string v1, "visible"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 41
    const-string v1, "gone"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 42
    sget v1, Linstafel/app/R$drawable;->ifl_tick:I

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSubIconRes(I)V

    return-object v0
.end method


# virtual methods
.method public setTickStatus(Z)V
    .locals 1

    .line 27
    iget-object v0, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeTile:Linstafel/app/ui/TileLarge;

    if-eqz p1, :cond_0

    const-string p1, "visible"

    goto :goto_0

    :cond_0
    const-string p1, "gone"

    :goto_0
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    return-void
.end method

.method public setTileVisibility(Z)V
    .locals 1

    .line 23
    iget-object v0, p0, Linstafel/app/utils/localization/LocalizationInfo;->localeTile:Linstafel/app/ui/TileLarge;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setVisibility(I)V

    return-void
.end method

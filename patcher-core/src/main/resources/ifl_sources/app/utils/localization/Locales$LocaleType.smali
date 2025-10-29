.class public Linstafel/app/utils/localization/Locales$LocaleType;
.super Ljava/lang/Object;
.source "Locales.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/localization/Locales;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocaleType"
.end annotation


# instance fields
.field public flagDrawableID:I

.field public langCode:Ljava/lang/String;

.field public langCountry:Ljava/lang/String;

.field public langName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Linstafel/app/utils/localization/Locales$LocaleType;->langCode:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Linstafel/app/utils/localization/Locales$LocaleType;->langName:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Linstafel/app/utils/localization/Locales$LocaleType;->langCountry:Ljava/lang/String;

    .line 39
    iput p4, p0, Linstafel/app/utils/localization/Locales$LocaleType;->flagDrawableID:I

    return-void
.end method

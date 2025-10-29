.class public Linstafel/app/utils/localization/Locales;
.super Ljava/lang/Object;
.source "Locales.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Linstafel/app/utils/localization/Locales$LocaleType;
    }
.end annotation


# static fields
.field public static final SUPPORTED_LOCALES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Linstafel/app/utils/localization/Locales$LocaleType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 14
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 15
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "United States"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_us:I

    const-string v4, "en"

    const-string v5, "English"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "T\u00fcrkiye"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_tr:I

    const-string v4, "tr"

    const-string v5, "T\u00fcrk\u00e7e"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Az\u0259rbaycan"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_az:I

    const-string v4, "az"

    const-string v5, "Az\u0259rbaycanca"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Deutschland"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_de:I

    const-string v4, "de"

    const-string v5, "Deutsch"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "\u0395\u03bb\u03bb\u03ac\u03b4\u03b1"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_el:I

    const-string v4, "el"

    const-string v5, "\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "France"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_fr:I

    const-string v4, "fr"

    const-string v5, "Fran\u00e7ais"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Magyarorsz\u00e1g"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_hu:I

    const-string v4, "hu"

    const-string v5, "Magyar"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "\u092d\u093e\u0930\u0924"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_hi:I

    const-string v4, "hi"

    const-string v5, "\u0939\u093f\u0902\u0926\u0940"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Espa\u00f1a"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_es:I

    const-string v4, "es"

    const-string v5, "Espa\u00f1ol"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Brasil"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_br:I

    const-string v4, "pt-rBR"

    const-string v5, "Portugu\u00eas Brasileiro"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Polska"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_pl:I

    const-string v4, "pl"

    const-string v5, "Polski"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Indonesia"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_id:I

    const-string v4, "id"

    invoke-direct {v1, v4, v2, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    new-instance v1, Linstafel/app/utils/localization/Locales$LocaleType;

    const-string v2, "Italia"

    sget v3, Linstafel/app/R$drawable;->ifl_flag_it:I

    const-string v4, "it"

    const-string v5, "Italiano"

    invoke-direct {v1, v4, v5, v2, v3}, Linstafel/app/utils/localization/Locales$LocaleType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Linstafel/app/utils/localization/Locales;->SUPPORTED_LOCALES:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

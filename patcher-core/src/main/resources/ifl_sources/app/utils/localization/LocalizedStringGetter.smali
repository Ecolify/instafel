.class public Linstafel/app/utils/localization/LocalizedStringGetter;
.super Ljava/lang/Object;
.source "LocalizedStringGetter.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDialogLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 35
    :try_start_0
    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->getAppResourcesWithConf(Landroid/app/Activity;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    .line 37
    invoke-static {p0, p1, p2}, Linstafel/app/utils/GeneralFn;->getStringResId(Landroid/app/Activity;Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\\n"

    const-string p2, "\n"

    .line 38
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static varargs getLocalizedString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 13
    :try_start_0
    invoke-static {p0, p1}, Linstafel/app/utils/GeneralFn;->getAppResourcesWithConf(Landroid/app/Activity;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    .line 14
    array-length v0, p3

    if-eqz v0, :cond_0

    .line 17
    invoke-static {p0, p1, p2}, Linstafel/app/utils/GeneralFn;->getStringResId(Landroid/app/Activity;Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result p2

    .line 16
    invoke-virtual {p1, p2, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 23
    :cond_0
    invoke-static {p0, p1, p2}, Linstafel/app/utils/GeneralFn;->getStringResId(Landroid/app/Activity;Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result p2

    .line 22
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 28
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getString(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 46
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getAppResources(Landroid/app/Activity;)Landroid/content/res/Resources;

    move-result-object v0

    .line 48
    invoke-static {p0, v0, p1}, Linstafel/app/utils/GeneralFn;->getStringResId(Landroid/app/Activity;Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result p0

    .line 47
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

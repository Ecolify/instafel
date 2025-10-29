.class public Linstafel/app/utils/GeneralFn;
.super Ljava/lang/Object;
.source "GeneralFn.java"


# static fields
.field public static DEFAULT_API_PATH:Ljava/lang/String; = "https://api.mamii.me/ifl"

.field public static DEFAULT_CONTENT_API_PATH:Ljava/lang/String; = "https://content.api.instafel.app"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToDp(Landroid/content/Context;I)I
    .locals 1

    int-to-float p1, p1

    .line 86
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    .line 85
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method public static decodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 63
    new-instance v0, Ljava/lang/String;

    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object p0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static encodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 59
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getApiUrl(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2

    .line 39
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 40
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_debug_mode:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 42
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_api_url:Ljava/lang/String;

    const-string v1, "DEBUG_URL"

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 44
    :cond_0
    sget-object p0, Linstafel/app/utils/GeneralFn;->DEFAULT_API_PATH:Ljava/lang/String;

    return-object p0
.end method

.method public static getAppResources(Landroid/app/Activity;)Landroid/content/res/Resources;
    .locals 1

    .line 91
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 92
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getPackageName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getAppResourcesWithConf(Landroid/app/Activity;Ljava/lang/String;)Landroid/content/res/Resources;
    .locals 3

    const/4 v0, 0x0

    .line 101
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 102
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getPackageName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p0

    .line 103
    new-instance v1, Landroid/content/res/Configuration;

    invoke-direct {v1}, Landroid/content/res/Configuration;-><init>()V

    .line 104
    new-instance v2, Ljava/util/Locale;

    invoke-direct {v2, p1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    iput-object v2, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 105
    invoke-virtual {p0, v1, v0}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object v0
.end method

.method public static getContentApiUrl(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 50
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_debug_mode:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 52
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_content_api_url:Ljava/lang/String;

    const-string v1, "DEBUG_URL"

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 54
    :cond_0
    sget-object p0, Linstafel/app/utils/GeneralFn;->DEFAULT_CONTENT_API_PATH:Ljava/lang/String;

    return-object p0
.end method

.method public static getFileHash(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 68
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/nio/file/OpenOption;

    invoke-static {p0, v2}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object p0

    const/16 v2, 0x2000

    .line 69
    new-array v2, v2, [B

    .line 71
    :goto_0
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 72
    invoke-virtual {v0, v2, v1, v3}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 75
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    array-length v2, p0

    :goto_1
    if-ge v1, v2, :cond_1

    aget-byte v3, p0, v1

    .line 79
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "%02x"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 81
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPackageName(Landroid/app/Activity;)Ljava/lang/String;
    .locals 0

    .line 117
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getStringResId(Landroid/app/Activity;Landroid/content/res/Resources;Ljava/lang/String;)I
    .locals 1

    .line 113
    const-string v0, "string"

    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getPackageName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, v0, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static getUiMode(Landroid/app/Activity;)I
    .locals 2

    const/4 v0, 0x0

    .line 193
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 p0, p0, 0x30

    const/16 v1, 0x20

    if-ne p0, v1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/16 v1, 0x10

    if-ne p0, v1, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    return v0

    :catch_0
    move-exception p0

    .line 202
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return v0
.end method

.method public static openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 144
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p1, 0x10000000

    .line 145
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 146
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 148
    :catch_0
    sget p1, Linstafel/app/R$string;->ifl_c1_01:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static setTheme(Landroidx/activity/ComponentActivity;Landroid/view/Window;)V
    .locals 2

    .line 167
    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    if-eqz v0, :cond_2

    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/16 v1, 0x6523

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 173
    :cond_0
    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 174
    sget v0, Linstafel/app/R$style;->ifl_theme_light:I

    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setTheme(I)V

    .line 175
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Linstafel/app/R$color;->ifl_background_color_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 176
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Linstafel/app/R$color;->ifl_background_color_light:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 177
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/16 p1, 0x2000

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void

    .line 180
    :cond_1
    sget v0, Linstafel/app/R$style;->ifl_theme_dark:I

    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setTheme(I)V

    .line 181
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Linstafel/app/R$color;->ifl_background_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 182
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Linstafel/app/R$color;->ifl_background_color:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void

    .line 169
    :cond_2
    :goto_0
    sget v0, Linstafel/app/R$style;->ifl_theme_dark:I

    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setTheme(I)V

    .line 170
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Linstafel/app/R$color;->ifl_background_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 171
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Linstafel/app/R$color;->ifl_background_color:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void
.end method

.method public static startIntent(Landroid/app/Activity;Ljava/lang/Class;)V
    .locals 1

    .line 133
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p1, 0x10000000

    .line 134
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 135
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 137
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 138
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1

    .line 122
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 123
    const-string p1, "data"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 124
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 125
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 127
    :catch_0
    const-string p1, "failed_start_intent"

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static updateIflUi(Landroidx/activity/ComponentActivity;)V
    .locals 2

    .line 154
    :try_start_0
    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/16 v1, 0x6523

    if-eq v0, v1, :cond_0

    sget v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 155
    :cond_0
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getUiMode(Landroid/app/Activity;)I

    move-result v0

    sput v0, Linstafel/app/InstafelEnv;->IFL_THEME:I

    .line 157
    :cond_1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x80000000

    .line 158
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/high16 v1, 0x4000000

    .line 159
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 160
    invoke-static {p0, v0}, Linstafel/app/utils/GeneralFn;->setTheme(Landroidx/activity/ComponentActivity;Landroid/view/Window;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 162
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

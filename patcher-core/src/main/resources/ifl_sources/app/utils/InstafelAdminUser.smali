.class public Linstafel/app/utils/InstafelAdminUser;
.super Ljava/lang/Object;
.source "InstafelAdminUser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentUserData(Landroid/app/Activity;)Linstafel/app/utils/types/Types$AdminUserData;
    .locals 4

    .line 33
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 34
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    const-string v1, "def"

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 35
    new-instance p0, Linstafel/app/utils/types/Types$AdminUserData;

    sget-object v2, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    .line 36
    invoke-virtual {v0, v2, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    .line 37
    invoke-virtual {v0, v3, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Linstafel/app/utils/types/Types$AdminUserData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isUserLogged(Landroid/app/Activity;)Z
    .locals 2

    .line 24
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 25
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    const-string v1, "def"

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static login(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 12
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 13
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    invoke-static {p1}, Linstafel/app/utils/GeneralFn;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    invoke-static {p2}, Linstafel/app/utils/GeneralFn;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static logout(Landroid/app/Activity;)V
    .locals 2

    .line 18
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 19
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    const-string v1, "def"

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    sget-object p0, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

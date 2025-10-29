.class public Linstafel/app/utils/InitializeInstafel;
.super Ljava/lang/Object;
.source "InitializeInstafel.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "IFL"

.field public static ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setContext(Landroid/app/Application;)V
    .locals 7

    .line 23
    sput-object p0, Linstafel/app/utils/InitializeInstafel;->ctx:Landroid/content/Context;

    .line 24
    invoke-static {p0}, Linstafel/app/utils/localization/LocalizationUtils;->getIflLocale(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 25
    sput-object p0, Linstafel/app/InstafelEnv;->IFL_LANG:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "InstafelEnv.IFL_LANG is set to "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "IFL"

    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    new-instance p0, Linstafel/app/managers/PreferenceManager;

    sget-object v1, Linstafel/app/utils/InitializeInstafel;->ctx:Landroid/content/Context;

    invoke-direct {p0, v1}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 30
    invoke-static {p0}, Linstafel/app/utils/ghost/GhostModeManager;->loadFlags(Linstafel/app/managers/PreferenceManager;)V

    .line 31
    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    .line 32
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    .line 33
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    move-result-object p0

    .line 31
    const-string v1, "Ghost Mode initialized - Seen: %b, Typing: %b, Screenshot: %b, ViewOnce: %b, Story: %b, Live: %b"

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static startInstafel()V
    .locals 3

    .line 55
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Linstafel/app/utils/InitializeInstafel;->ctx:Landroid/content/Context;

    const-class v2, Linstafel/app/activity/ifl_a_menu;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    .line 56
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 57
    sget-object v1, Linstafel/app/utils/InitializeInstafel;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 59
    sget-object v1, Linstafel/app/utils/InitializeInstafel;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static triggerCheckUpdates(Landroid/app/Activity;)V
    .locals 2

    .line 38
    :try_start_0
    invoke-static {p0}, Linstafel/app/ota/CheckUpdates;->checkUpdates(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Update check failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IFL"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public static triggerUploadMapping(Landroid/app/Activity;)V
    .locals 2

    .line 47
    new-instance v0, Linstafel/app/managers/OverridesManager;

    invoke-direct {v0, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    .line 48
    invoke-static {p0}, Linstafel/app/utils/InstafelAdminUser;->isUserLogged(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Linstafel/app/managers/OverridesManager;->getMappingFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    new-instance v0, Linstafel/app/utils/UploadMapping;

    invoke-direct {v0, p0}, Linstafel/app/utils/UploadMapping;-><init>(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.class public Linstafel/app/utils/ghost/GhostModeManager;
.super Ljava/lang/Object;
.source "GhostModeManager.java"


# static fields
.field public static isGhostLive:Z = false

.field public static isGhostModeEnabled:Z = false

.field public static isGhostScreenshot:Z = false

.field public static isGhostSeen:Z = false

.field public static isGhostStory:Z = false

.field public static isGhostTyping:Z = false

.field public static isGhostViewOnce:Z = false

.field public static quickToggleLive:Z = false

.field public static quickToggleScreenshot:Z = false

.field public static quickToggleSeen:Z = false

.field public static quickToggleStory:Z = false

.field public static quickToggleTyping:Z = false

.field public static quickToggleViewOnce:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isAnyGhostModeActive()Z
    .locals 2

    .line 78
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    if-eqz v0, :cond_0

    return v1

    .line 79
    :cond_0
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    if-eqz v0, :cond_1

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    if-eqz v0, :cond_1

    return v1

    .line 80
    :cond_1
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    if-eqz v0, :cond_2

    return v1

    .line 81
    :cond_2
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    if-eqz v0, :cond_3

    return v1

    .line 82
    :cond_3
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    if-eqz v0, :cond_4

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    if-eqz v0, :cond_4

    return v1

    .line 83
    :cond_4
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    if-eqz v0, :cond_5

    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    if-eqz v0, :cond_5

    return v1

    :cond_5
    const/4 v0, 0x0

    return v0
.end method

.method public static isGhostLiveEnabled()Z
    .locals 1

    .line 193
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    return v0
.end method

.method public static isGhostScreenshotEnabled()Z
    .locals 1

    .line 169
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    return v0
.end method

.method public static isGhostSeenEnabled()Z
    .locals 1

    .line 153
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    return v0
.end method

.method public static isGhostStoryEnabled()Z
    .locals 1

    .line 185
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    return v0
.end method

.method public static isGhostTypingEnabled()Z
    .locals 1

    .line 161
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    return v0
.end method

.method public static isGhostViewOnceEnabled()Z
    .locals 1

    .line 177
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    return v0
.end method

.method public static loadFlags(Linstafel/app/managers/PreferenceManager;)V
    .locals 2

    .line 38
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_mode_enabled:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostModeEnabled:Z

    .line 39
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_seen:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    .line 40
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_typing:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    .line 41
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_screenshot:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    .line 42
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_view_once:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    .line 43
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_story:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    .line 44
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_live:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    .line 46
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_seen:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    .line 47
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_typing:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    .line 48
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_screenshot:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    .line 49
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_view_once:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    .line 50
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_story:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    .line 51
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_live:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    sput-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    return-void
.end method

.method public static saveFlags(Linstafel/app/managers/PreferenceManager;)V
    .locals 2

    .line 58
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_mode_enabled:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostModeEnabled:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 59
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_seen:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 60
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_typing:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 61
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_screenshot:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 62
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_view_once:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 63
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_story:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 64
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_live:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 66
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_seen:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 67
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_typing:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 68
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_screenshot:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 69
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_view_once:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 70
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_story:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 71
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_live:Ljava/lang/String;

    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    invoke-virtual {p0, v0, v1}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static toggleSelectedGhostOptions(Landroid/content/Context;Linstafel/app/managers/PreferenceManager;)V
    .locals 10

    .line 97
    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 99
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    if-nez v3, :cond_0

    move v4, v1

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v2

    move v4, v3

    goto :goto_0

    :cond_1
    move v3, v1

    move v4, v2

    .line 101
    :goto_0
    sget-boolean v5, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    if-eqz v5, :cond_3

    .line 103
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    if-nez v3, :cond_2

    move v4, v1

    :cond_2
    move v3, v2

    .line 105
    :cond_3
    sget-boolean v6, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    if-eqz v6, :cond_5

    .line 107
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    if-nez v3, :cond_4

    move v4, v1

    :cond_4
    move v3, v2

    .line 109
    :cond_5
    sget-boolean v7, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    if-eqz v7, :cond_7

    .line 111
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    if-nez v3, :cond_6

    move v4, v1

    :cond_6
    move v3, v2

    .line 113
    :cond_7
    sget-boolean v8, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    if-eqz v8, :cond_9

    .line 115
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    if-nez v3, :cond_8

    move v4, v1

    :cond_8
    move v3, v2

    .line 117
    :cond_9
    sget-boolean v9, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    if-eqz v9, :cond_a

    .line 119
    sget-boolean v3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    if-nez v3, :cond_b

    move v4, v1

    goto :goto_1

    :cond_a
    move v2, v3

    :cond_b
    :goto_1
    if-nez v2, :cond_c

    .line 123
    const-string p1, "\u2757 No Ghost Mode options selected for quick toggle!"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_c
    xor-int/lit8 v2, v4, 0x1

    if-eqz v0, :cond_d

    .line 130
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    :cond_d
    if-eqz v5, :cond_e

    .line 131
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    :cond_e
    if-eqz v6, :cond_f

    .line 132
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    :cond_f
    if-eqz v7, :cond_10

    .line 133
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    :cond_10
    if-eqz v8, :cond_11

    .line 134
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    :cond_11
    if-eqz v9, :cond_12

    .line 135
    sput-boolean v2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    .line 138
    :cond_12
    invoke-static {p1}, Linstafel/app/utils/ghost/GhostModeManager;->saveFlags(Linstafel/app/managers/PreferenceManager;)V

    if-nez v4, :cond_13

    .line 142
    const-string p1, "\ud83d\udc7b Ghost Mode Enabled"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 144
    :cond_13
    const-string p1, "\u274c Ghost Mode Disabled"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.class public Linstafel/app/activity/ifl_a_ghost_mode;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_ghost_mode.java"


# instance fields
.field preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$1(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 48
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    .line 49
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_seen:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$10(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 126
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    .line 127
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_view_once:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$11(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 134
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    .line 135
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_story:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$12(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 142
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    .line 143
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_live:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$2(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 57
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    .line 58
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_typing:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$3(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 66
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    .line 67
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_screenshot:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$4(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 75
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    .line 76
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_view_once:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$5(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 84
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    .line 85
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_story:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$6(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 93
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    .line 94
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_live:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$7(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 102
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    .line 103
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_seen:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$8(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 110
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    .line 111
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_typing:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$onCreate$9(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 118
    sput-boolean p2, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    .line 119
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_quick_toggle_screenshot:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-ifl_a_ghost_mode(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 36
    sput-boolean p3, Linstafel/app/utils/ghost/GhostModeManager;->isGhostModeEnabled:Z

    .line 37
    sget-object p2, Linstafel/app/utils/types/PreferenceKeys;->ifl_ghost_mode_enabled:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    if-eqz p3, :cond_0

    .line 39
    const-string p1, "Ghost Mode Enabled"

    goto :goto_0

    :cond_0
    const-string p1, "Ghost Mode Disabled"

    :goto_0
    const/4 p2, 0x0

    .line 38
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 21
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 23
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 24
    sget p1, Linstafel/app/R$layout;->ifl_at_ghost_mode:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/ifl_a_ghost_mode;->setContentView(I)V

    .line 25
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 26
    iput-object p1, p0, Linstafel/app/activity/ifl_a_ghost_mode;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 29
    invoke-static {p1}, Linstafel/app/utils/ghost/GhostModeManager;->loadFlags(Linstafel/app/managers/PreferenceManager;)V

    .line 32
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_mode_main:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 33
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 34
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostModeEnabled:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 35
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/ifl_a_ghost_mode;Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 44
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_seen:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 45
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 46
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 47
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda7;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 53
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_typing:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 54
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 55
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 56
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda8;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda8;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 62
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_screenshot:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 63
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 64
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 65
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda9;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 71
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_viewonce:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 72
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 73
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 74
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda10;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda10;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 80
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_story:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 81
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 82
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 83
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda11;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda11;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 89
    sget v0, Linstafel/app/R$id;->ifl_tile_ghost_live:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 90
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 91
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 92
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda12;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda12;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 98
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_seen:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 99
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 100
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleSeen:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 101
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda1;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 106
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_typing:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 107
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 108
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleTyping:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 109
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda2;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 114
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_screenshot:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 115
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 116
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleScreenshot:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 117
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda3;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 122
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_viewonce:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 123
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 124
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleViewOnce:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 125
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda4;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 130
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_story:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 131
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 132
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleStory:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 133
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda5;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 138
    sget v0, Linstafel/app/R$id;->ifl_tile_quick_toggle_live:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_ghost_mode;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Linstafel/app/ui/TileLargeSwitch;

    .line 139
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeSwitch;->getSwitchView()Landroid/widget/Switch;

    move-result-object v0

    .line 140
    sget-boolean v1, Linstafel/app/utils/ghost/GhostModeManager;->quickToggleLive:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 141
    new-instance v1, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda6;

    invoke-direct {v1, p1}, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda6;-><init>(Linstafel/app/managers/PreferenceManager;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.class public final synthetic Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Linstafel/app/activity/ifl_a_ghost_mode;

.field public final synthetic f$1:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public synthetic constructor <init>(Linstafel/app/activity/ifl_a_ghost_mode;Linstafel/app/managers/PreferenceManager;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/ifl_a_ghost_mode;

    iput-object p2, p0, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;->f$1:Linstafel/app/managers/PreferenceManager;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 0
    iget-object v0, p0, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;->f$0:Linstafel/app/activity/ifl_a_ghost_mode;

    iget-object v1, p0, Linstafel/app/activity/ifl_a_ghost_mode$$ExternalSyntheticLambda0;->f$1:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {v0, v1, p1, p2}, Linstafel/app/activity/ifl_a_ghost_mode;->lambda$onCreate$0$instafel-app-activity-ifl_a_ghost_mode(Linstafel/app/managers/PreferenceManager;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

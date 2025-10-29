.class Linstafel/app/activity/ifl_a_language$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "ifl_a_language.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/ifl_a_language;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/ifl_a_language;


# direct methods
.method constructor <init>(Linstafel/app/activity/ifl_a_language;Z)V
    .locals 0

    .line 76
    iput-object p1, p0, Linstafel/app/activity/ifl_a_language$1;->this$0:Linstafel/app/activity/ifl_a_language;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 3

    .line 79
    new-instance v0, Linstafel/app/managers/PreferenceManager;

    iget-object v1, p0, Linstafel/app/activity/ifl_a_language$1;->this$0:Linstafel/app/activity/ifl_a_language;

    invoke-direct {v0, v1}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 80
    sget-object v1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ui_recreate:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    const/4 v0, 0x0

    .line 81
    invoke-virtual {p0, v0}, Linstafel/app/activity/ifl_a_language$1;->setEnabled(Z)V

    .line 82
    iget-object v0, p0, Linstafel/app/activity/ifl_a_language$1;->this$0:Linstafel/app/activity/ifl_a_language;

    invoke-virtual {v0}, Linstafel/app/activity/ifl_a_language;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/activity/OnBackPressedDispatcher;->onBackPressed()V

    return-void
.end method

.class public Linstafel/app/activity/admin/ifl_a_admin_pref_manager;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_admin_pref_manager.java"


# instance fields
.field layout:Landroid/widget/LinearLayout;

.field prefTiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Linstafel/app/ui/TileLargeEditText;",
            ">;"
        }
    .end annotation
.end field

.field preferenceManager:Linstafel/app/managers/PreferenceManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->prefTiles:Ljava/util/List;

    return-void
.end method

.method private setEditorAction(Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 127
    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2, p3, p1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/admin/ifl_a_admin_pref_manager;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method


# virtual methods
.method public buildLayout()V
    .locals 3

    .line 170
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x0

    .line 171
    :goto_0
    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->prefTiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 172
    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->layout:Landroid/widget/LinearLayout;

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->prefTiles:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 5

    .line 83
    new-instance v0, Linstafel/app/ui/TileLargeEditText;

    invoke-direct {v0, p0}, Linstafel/app/ui/TileLargeEditText;-><init>(Landroid/content/Context;)V

    .line 84
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p3}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->parsePreferenceType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeEditText;->setTitleText(Ljava/lang/String;)V

    .line 85
    sget v1, Linstafel/app/R$drawable;->ifl_developer:I

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeEditText;->setIconRes(I)V

    .line 86
    const-string v1, "visible"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeEditText;->setSpaceBottom(Ljava/lang/String;)V

    .line 87
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLargeEditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    invoke-virtual {v0}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x6

    .line 93
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 94
    const-string v2, "NOT_DEFINED_YET"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 95
    invoke-virtual {p0, p3}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->parsePreferenceType(I)Ljava/lang/String;

    move-result-object p3

    .line 96
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v4, 0x0

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "long"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_1
    const-string v2, "bool"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_2
    const-string v2, "int"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x1

    goto :goto_0

    :sswitch_3
    const-string v2, "string"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_3
    move v3, v4

    :goto_0
    packed-switch v3, :pswitch_data_0

    goto/16 :goto_1

    .line 117
    :pswitch_0
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p2, p1}, Linstafel/app/managers/PreferenceManager;->exists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 118
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    const-wide/16 v2, 0x0

    invoke-virtual {p2, p1, v2, v3}, Linstafel/app/managers/PreferenceManager;->getPreferenceLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 112
    :pswitch_1
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p2, p1}, Linstafel/app/managers/PreferenceManager;->exists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 113
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p2, p1, v4}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 107
    :pswitch_2
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p2, p1}, Linstafel/app/managers/PreferenceManager;->exists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 108
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p2, p1, v4}, Linstafel/app/managers/PreferenceManager;->getPreferenceInt(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 98
    :pswitch_3
    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {v2, p1}, Linstafel/app/managers/PreferenceManager;->exists(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 99
    const-string v2, "ifl_debug_mode_custom_api_url"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    .line 100
    iget-object p2, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    const-string v2, "NULL"

    invoke-virtual {p2, p1, v2}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 102
    :cond_4
    sget-object p2, Linstafel/app/utils/GeneralFn;->DEFAULT_API_PATH:Ljava/lang/String;

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 122
    :cond_5
    :goto_1
    invoke-direct {p0, v1, p3, p1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->setEditorAction(Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->prefTiles:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x352a9fef -> :sswitch_3
        0x197ef -> :sswitch_2
        0x2e3aea -> :sswitch_1
        0x32c67c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$setEditorAction$0$instafel-app-activity-admin-ifl_a_admin_pref_manager(Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 0
    const/4 p4, 0x6

    const/4 p6, 0x0

    if-ne p5, p4, :cond_6

    .line 129
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p4

    const/4 p5, 0x1

    const/4 v0, -0x1

    sparse-switch p4, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string p4, "long"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    goto :goto_0

    :sswitch_1
    const-string p4, "bool"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    :sswitch_2
    const-string p4, "int"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, p5

    goto :goto_0

    :sswitch_3
    const-string p4, "string"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    move v0, p6

    :goto_0
    const-string p1, "Preference updated"

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 156
    :pswitch_0
    :try_start_0
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p3

    .line 157
    iget-object p5, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p5, p2, p3, p4}, Linstafel/app/managers/PreferenceManager;->setPreferenceLong(Ljava/lang/String;J)V

    .line 158
    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 160
    :catch_0
    const-string p1, "New value cannot converted into LONG"

    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 144
    :pswitch_1
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    const-string v0, "true"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_4

    .line 145
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p3, p2, p5}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 146
    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 147
    :cond_4
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    const-string p4, "false"

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 148
    iget-object p3, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p3, p2, p6}, Linstafel/app/managers/PreferenceManager;->setPreferenceBoolean(Ljava/lang/String;Z)V

    .line 149
    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 151
    :cond_5
    const-string p1, "New value cannot converted into BOOL"

    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 136
    :pswitch_2
    :try_start_1
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    .line 137
    iget-object p4, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p4, p2, p3}, Linstafel/app/managers/PreferenceManager;->setPreferenceInt(Ljava/lang/String;I)V

    .line 138
    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 140
    :catch_1
    const-string p1, "New value cannot converted into INT"

    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 131
    :pswitch_3
    iget-object p4, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p2, p3}, Linstafel/app/managers/PreferenceManager;->setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-static {p0, p1, p6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_6
    :goto_1
    return p6

    :sswitch_data_0
    .sparse-switch
        -0x352a9fef -> :sswitch_3
        0x197ef -> :sswitch_2
        0x2e3aea -> :sswitch_1
        0x32c67c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 33
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 35
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 36
    sget p1, Linstafel/app/R$layout;->ifl_at_admin_action_pref_manager:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->setContentView(I)V

    .line 37
    sget p1, Linstafel/app/R$id;->ifl_prefs_layout:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->layout:Landroid/widget/LinearLayout;

    .line 38
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 40
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_lang:Ljava/lang/String;

    const-string v0, "ifl_lang"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 41
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_show_admin_dash_as_tile:Ljava/lang/String;

    const-string v0, "ifl_show_admin_dash_as_tile"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 42
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_debug_mode:Ljava/lang/String;

    const-string v0, "ifl_enable_debug_mode"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 43
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_mode_custom_api_url:Ljava/lang/String;

    const-string v0, "ifl_debug_mode_custom_api_url"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 44
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_amoled_theme:Ljava/lang/String;

    const-string v0, "ifl_enable_amoled_theme"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 45
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ifl_version:Ljava/lang/String;

    const-string v0, "ifl_custom_ifl_version"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->INT:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 46
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_version:Ljava/lang/String;

    const-string v0, "ifl_custom_ig_version"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 47
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_ig_ver_code:Ljava/lang/String;

    const-string v0, "ifl_custom_ig_ver_code"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 48
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_custom_gen_id:Ljava/lang/String;

    const-string v0, "ifl_custom_gen_id"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 49
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_last_check:Ljava/lang/String;

    const-string v0, "ifl_backup_last_check"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->LONG:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_enable_auto_update:Ljava/lang/String;

    const-string v0, "ifl_enable_auto_update"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 51
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_backup_update_value:Ljava/lang/String;

    const-string v0, "ifl_backup_update_value"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    const-string v0, "ifl_ota_background_enable"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 53
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_check:Ljava/lang/String;

    const-string v0, "ifl_ota_last_check"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->LONG:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 54
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_freq:Ljava/lang/String;

    const-string v0, "ifl_ota_freq"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->INT:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 55
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_setting:Ljava/lang/String;

    const-string v0, "ifl_ota_setting"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 56
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_last_success_install:Ljava/lang/String;

    const-string v0, "ifl_ota_last_success_install"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->LONG:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 57
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_welcome_message:Ljava/lang/String;

    const-string v0, "ifl_welcome_message"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 58
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_mode_warning_dialog:Ljava/lang/String;

    const-string v0, "ifl_debug_mode_warning_dialog"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 59
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_clog_last_shown_version:Ljava/lang/String;

    const-string v0, "ifl_clog_last_shown_version"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->INT:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 60
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_clog_disable_version_control:Ljava/lang/String;

    const-string v0, "ifl_clog_disable_version_control"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->BOOLEAN:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 61
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_mapping_file_hash:Ljava/lang/String;

    const-string v0, "ifl_mapping_file_size"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 62
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_api_url:Ljava/lang/String;

    const-string v0, "ifl_debug_api_url"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 63
    sget-object p1, Linstafel/app/utils/types/PreferenceKeys;->ifl_debug_content_api_url:Ljava/lang/String;

    const-string v0, "ifl_debug_content_api_url"

    sget v1, Linstafel/app/utils/types/Types$PreferenceTypes;->STRING:I

    invoke-virtual {p0, p1, v0, v1}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->createPreferenceTitle(Ljava/lang/String;Ljava/lang/String;I)V

    .line 65
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_pref_manager;->buildLayout()V

    return-void
.end method

.method public parsePreferenceType(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 79
    const-string p1, "unknown"

    return-object p1

    .line 77
    :cond_0
    const-string p1, "long"

    return-object p1

    .line 75
    :cond_1
    const-string p1, "bool"

    return-object p1

    .line 73
    :cond_2
    const-string p1, "string"

    return-object p1

    .line 71
    :cond_3
    const-string p1, "int"

    return-object p1
.end method

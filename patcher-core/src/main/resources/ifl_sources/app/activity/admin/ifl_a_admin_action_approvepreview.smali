.class public Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_admin_action_approvepreview.java"

# interfaces
.implements Linstafel/app/api/requests/ApiCallbackInterface;


# instance fields
.field button:Landroid/widget/LinearLayout;

.field buttonText:Landroid/widget/TextView;

.field clickLock:Z

.field preferenceManager:Linstafel/app/managers/PreferenceManager;

.field tileChangelog:Linstafel/app/ui/TileLargeEditText;

.field tileGenerationId:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->clickLock:Z

    return-void
.end method


# virtual methods
.method public getResponse(Linstafel/app/api/models/InstafelResponse;I)V
    .locals 1

    const/16 v0, 0x13

    if-ne p2, v0, :cond_2

    if-eqz p1, :cond_2

    .line 139
    :try_start_0
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p2

    const-string v0, "SUCCESS"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 140
    const-string p2, "Success"

    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getDesc()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->showDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 141
    :cond_0
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p2

    const-string v0, "ALREADY_APPROVED"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 142
    const-string p2, "Already Approved"

    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getDesc()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->showDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 144
    :cond_1
    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getStatus()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Linstafel/app/api/models/InstafelResponse;->getDesc()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->showDialog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 147
    :catch_0
    const-string p1, "Error while parsing response."

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_2
    return-void
.end method

.method public getResponse(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method synthetic lambda$onCreate$0$instafel-app-activity-admin-ifl_a_admin_action_approvepreview(Ljava/lang/String;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 8

    .line 79
    const-string p3, "null"

    const/4 v1, 0x0

    :try_start_0
    iget-boolean v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->clickLock:Z

    if-nez v0, :cond_0

    .line 80
    new-instance v2, Linstafel/app/api/requests/ApiPostAdmin;

    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_username:Ljava/lang/String;

    .line 83
    invoke-virtual {v0, v3, p3}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    sget-object v3, Linstafel/app/utils/types/PreferenceKeys;->ifl_admin_password:Ljava/lang/String;

    .line 84
    invoke-virtual {v0, v3, p3}, Linstafel/app/managers/PreferenceManager;->getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "gen_id"

    .line 85
    invoke-virtual {p3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p3, "clog"

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v4, 0x13

    move-object v3, p0

    :try_start_1
    invoke-direct/range {v2 .. v7}, Linstafel/app/api/requests/ApiPostAdmin;-><init>(Linstafel/app/api/requests/ApiCallbackInterface;ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    const/4 p1, 0x1

    .line 86
    new-array p2, p1, [Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getContentApiUrl(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "/user_admin/approve-preview"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    aput-object p3, p2, v1

    invoke-virtual {v2, p2}, Linstafel/app/api/requests/ApiPostAdmin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 87
    iput-boolean p1, v3, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->clickLock:Z

    return-void

    :cond_0
    move-object v3, p0

    .line 89
    const-string p1, "Please wait for finish process"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v3, p0

    :goto_0
    move-object p1, v0

    .line 93
    const-string p2, "Error while building request"

    invoke-static {p0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 94
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 95
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 46
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 48
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 49
    sget p1, Linstafel/app/R$layout;->ifl_at_admin_action_approvepreview:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->setContentView(I)V

    .line 51
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->preferenceManager:Linstafel/app/managers/PreferenceManager;

    .line 52
    sget p1, Linstafel/app/R$id;->ifl_button_approvepreview:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->button:Landroid/widget/LinearLayout;

    .line 53
    sget p1, Linstafel/app/R$id;->ifl_text_button:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->buttonText:Landroid/widget/TextView;

    .line 54
    sget p1, Linstafel/app/R$id;->ifl_tile_setchangelog:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLargeEditText;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->tileChangelog:Linstafel/app/ui/TileLargeEditText;

    .line 55
    sget p1, Linstafel/app/R$id;->ifl_tile_selectbackupfile:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->tileGenerationId:Linstafel/app/ui/TileLarge;

    .line 57
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->tileChangelog:Linstafel/app/ui/TileLargeEditText;

    invoke-virtual {p1}, Linstafel/app/ui/TileLargeEditText;->getEditTextView()Landroid/widget/EditText;

    move-result-object p1

    const v0, 0x20001

    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setInputType(I)V

    const/16 v0, 0x14

    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 60
    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$1;

    invoke-direct {v0, p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$1;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;Landroid/widget/EditText;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 73
    invoke-static {p0}, Linstafel/app/ota/IflEnvironment;->getGenerationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 74
    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->tileGenerationId:Linstafel/app/ui/TileLarge;

    invoke-virtual {v1, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 75
    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->buttonText:Landroid/widget/TextView;

    const-string v2, "Approve this preview"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v1, p0, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;->button:Landroid/widget/LinearLayout;

    new-instance v2, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0, p1}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public showDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 100
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 101
    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 102
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/4 v1, 0x0

    invoke-direct {v6, p0, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_title"

    const/16 v3, 0x1e

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 109
    const-string p1, "mid_space"

    const/16 v7, 0x14

    invoke-virtual {v0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 110
    sget v5, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v6, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 p1, 0x18

    invoke-direct {v6, p0, p1, p1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v1, "dialog_desc"

    const/16 v3, 0x10

    const/16 v4, 0x136

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 117
    const-string p1, "button_top_space"

    invoke-virtual {v0, p1, v7}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 118
    new-instance v4, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;

    invoke-direct {v4, p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview$2;-><init>(Linstafel/app/activity/admin/ifl_a_admin_action_approvepreview;Linstafel/app/utils/dialog/InstafelDialog;)V

    const/4 v5, 0x0

    const-string v1, "buttons"

    const-string v2, "Okay"

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 130
    const-string p1, "bottom_space"

    const/16 p2, 0x1b

    invoke-virtual {v0, p1, p2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 131
    invoke-virtual {v0}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method

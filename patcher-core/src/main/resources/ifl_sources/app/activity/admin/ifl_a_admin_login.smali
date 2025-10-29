.class public Linstafel/app/activity/admin/ifl_a_admin_login;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_admin_login.java"


# instance fields
.field tileLogin:Landroid/widget/LinearLayout;

.field tilePassword:Landroid/widget/EditText;

.field tileUsername:Landroid/widget/EditText;

.field waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-admin-ifl_a_admin_login(Landroid/view/View;)V
    .locals 3

    .line 47
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    .line 48
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tileUsername:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 49
    iget-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tilePassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 52
    new-instance v1, Linstafel/app/api/requests/admin/AdminLogin;

    iget-object v2, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v1, p0, p1, v0, v2}, Linstafel/app/api/requests/admin/AdminLogin;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Linstafel/app/utils/dialog/InstafelDialog;)V

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->getApiUrl(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/admin/user/login"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    aput-object v0, p1, v2

    invoke-virtual {v1, p1}, Linstafel/app/api/requests/admin/AdminLogin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 55
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->hide()V

    .line 56
    sget p1, Linstafel/app/R$string;->ifl_a12_05:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/admin/ifl_a_admin_login;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Error"

    invoke-static {p0, v0, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 27
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 29
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 30
    sget v0, Linstafel/app/R$layout;->ifl_at_admin_login:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_login;->setContentView(I)V

    .line 32
    sget v0, Linstafel/app/R$id;->ifl_tile_admin_username:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_login;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tileUsername:Landroid/widget/EditText;

    .line 33
    sget v0, Linstafel/app/R$id;->ifl_tile_admin_password:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_login;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tilePassword:Landroid/widget/EditText;

    .line 34
    sget v0, Linstafel/app/R$id;->ifl_tile_admin_login:I

    invoke-virtual {p0, v0}, Linstafel/app/activity/admin/ifl_a_admin_login;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tileLogin:Landroid/widget/LinearLayout;

    .line 35
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 36
    new-instance v0, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v0, p0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    .line 37
    const-string v1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 38
    new-instance v0, Linstafel/app/ui/LoadingBar;

    invoke-direct {v0, p0}, Linstafel/app/ui/LoadingBar;-><init>(Landroid/content/Context;)V

    .line 39
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 40
    invoke-virtual {p0}, Linstafel/app/activity/admin/ifl_a_admin_login;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c80000    # 25.0f

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float/2addr v3, v4

    float-to-int v3, v3

    .line 41
    invoke-virtual {v1, v3, p1, v3, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 42
    invoke-virtual {v0, v1}, Linstafel/app/ui/LoadingBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v1, "loading_bar"

    invoke-virtual {p1, v1, v0}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 44
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->waitingApiDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const-string v0, "button_top_space"

    invoke-virtual {p1, v0, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 46
    iget-object p1, p0, Linstafel/app/activity/admin/ifl_a_admin_login;->tileLogin:Landroid/widget/LinearLayout;

    new-instance v0, Linstafel/app/activity/admin/ifl_a_admin_login$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Linstafel/app/activity/admin/ifl_a_admin_login$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/admin/ifl_a_admin_login;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

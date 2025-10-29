.class public Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode_backup_comparator.java"


# instance fields
.field private backup1:Lorg/json/JSONObject;

.field private backup2:Lorg/json/JSONObject;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final handler:Landroid/os/Handler;

.field private isResumed:Z

.field private layoutContents:Linstafel/app/ui/PageContentArea;

.field private layoutItems:Landroid/widget/LinearLayout;

.field private layoutLoading:Linstafel/app/ui/PageContentArea;

.field private mappingContent:Lorg/json/JSONObject;

.field private overridesManager:Linstafel/app/managers/OverridesManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 23
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 29
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->executor:Ljava/util/concurrent/Executor;

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->handler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->isResumed:Z

    return-void
.end method

.method static synthetic access$000(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)Linstafel/app/managers/OverridesManager;
    .locals 0

    .line 23
    iget-object p0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->overridesManager:Linstafel/app/managers/OverridesManager;

    return-object p0
.end method

.method static synthetic access$102(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    .line 23
    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->backup1:Lorg/json/JSONObject;

    return-object p1
.end method

.method static synthetic access$202(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    .line 23
    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->backup2:Lorg/json/JSONObject;

    return-object p1
.end method

.method static synthetic access$302(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    .line 23
    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->mappingContent:Lorg/json/JSONObject;

    return-object p1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 34
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 36
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 37
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode_backup_comparator:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->setContentView(I)V

    .line 39
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 40
    sget p1, Linstafel/app/R$id;->ifl_page_area:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/PageContentArea;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->layoutContents:Linstafel/app/ui/PageContentArea;

    .line 41
    sget p1, Linstafel/app/R$id;->ifl_loading_area:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/PageContentArea;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->layoutLoading:Linstafel/app/ui/PageContentArea;

    .line 42
    sget p1, Linstafel/app/R$id;->ifl_flags_layout:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->layoutItems:Landroid/widget/LinearLayout;

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 49
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 51
    iget-boolean v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->isResumed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 52
    iput-boolean v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->isResumed:Z

    .line 54
    iget-object v0, p0, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;

    invoke-direct {v1, p0}, Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator$1;-><init>(Linstafel/app/activity/devmode/comparator/ifl_a_devmode_backup_comparator;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

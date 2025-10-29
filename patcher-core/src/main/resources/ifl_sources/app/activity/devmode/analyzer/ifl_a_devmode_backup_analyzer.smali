.class public Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode_backup_analyzer.java"


# instance fields
.field private editText:Landroid/widget/EditText;

.field private final executor:Ljava/util/concurrent/Executor;

.field private flagsFounded:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Linstafel/app/managers/modals/FlagItem;",
            ">;"
        }
    .end annotation
.end field

.field private flagsNotFounded:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private isResumed:Z

.field private layout:Linstafel/app/ui/PageContentArea;

.field private linearLayout:Landroid/widget/LinearLayout;

.field private mappingContent:Lorg/json/JSONArray;

.field private mappingObjects:Lorg/json/JSONObject;

.field private overrideContent:Lorg/json/JSONObject;

.field private overridesManager:Linstafel/app/managers/OverridesManager;

.field private searchLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private totalSize:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 51
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->executor:Ljava/util/concurrent/Executor;

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->handler:Landroid/os/Handler;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsFounded:Ljava/util/List;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsNotFounded:Ljava/util/List;

    const/4 v0, 0x0

    .line 57
    iput v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->totalSize:I

    .line 80
    iput-boolean v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->isResumed:Z

    return-void
.end method

.method private buildLayout(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Linstafel/app/managers/modals/FlagItem;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->layout:Linstafel/app/ui/PageContentArea;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 214
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p3, p1, p2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 265
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private copyFlagContent(Ljava/lang/String;)V
    .locals 4

    .line 289
    const-string v0, ":"

    :try_start_0
    iget-object v1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    .line 290
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 291
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 292
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 294
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 295
    const-string v1, "ifl_log_clip"

    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    .line 296
    invoke-virtual {v0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 298
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 299
    sget p1, Linstafel/app/R$string;->ifl_a11_36:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private createTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Linstafel/app/ui/TileLarge;
    .locals 2

    .line 269
    new-instance v0, Linstafel/app/ui/TileLarge;

    invoke-direct {v0, p0}, Linstafel/app/ui/TileLarge;-><init>(Landroid/content/Context;)V

    .line 270
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 271
    invoke-virtual {v0, p2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 272
    const-string p1, "gone"

    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setIconVisibility(Ljava/lang/String;)V

    .line 273
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 274
    const-string p1, "visible"

    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 275
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 p2, -0x1

    const/4 v1, -0x2

    invoke-direct {p1, p2, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 279
    new-instance p1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0, p3}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda4;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private search(Ljava/lang/String;)V
    .locals 2

    .line 304
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsFounded:Ljava/util/List;

    iget-object v1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsNotFounded:Ljava/util/List;

    invoke-direct {p0, v0, v1, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->buildLayout(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-void

    .line 307
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsFounded:Ljava/util/List;

    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsNotFounded:Ljava/util/List;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->buildLayout(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$buildLayout$2$instafel-app-activity-devmode-analyzer-ifl_a_devmode_backup_analyzer(Linstafel/app/ui/TileTitle;Ljava/util/List;Ljava/util/List;)V
    .locals 3

    .line 244
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 245
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 246
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Linstafel/app/ui/TileLarge;

    .line 247
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 250
    const-string p2, ""

    move v0, p1

    :goto_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 251
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    .line 252
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 253
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, ","

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    .line 255
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    .line 258
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Linstafel/app/R$string;->ifl_a4_24:I

    invoke-virtual {p0, v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "/"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->totalSize:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ")"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    invoke-direct {p0, p3, p2, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->createTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Linstafel/app/ui/TileLarge;

    move-result-object p2

    .line 259
    iget-object p3, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 260
    iget-object p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 262
    iget-object p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->layout:Linstafel/app/ui/PageContentArea;

    invoke-virtual {p2, p1}, Linstafel/app/ui/PageContentArea;->setVisibility(I)V

    .line 263
    iget-object p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->searchLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p2, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    return-void
.end method

.method synthetic lambda$buildLayout$3$instafel-app-activity-devmode-analyzer-ifl_a_devmode_backup_analyzer(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 10

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 217
    new-instance v1, Linstafel/app/ui/TileTitle;

    invoke-direct {v1, p0}, Linstafel/app/ui/TileTitle;-><init>(Landroid/content/Context;)V

    .line 218
    sget v2, Linstafel/app/R$string;->ifl_a4_23:I

    invoke-virtual {p0, v2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Linstafel/app/ui/TileTitle;->setText(Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 219
    invoke-virtual {v1, v2}, Linstafel/app/ui/TileTitle;->setTopPadding(Z)V

    .line 220
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Linstafel/app/ui/TileTitle;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 225
    const-string v3, ")"

    const-string v4, "/"

    const-string v5, " ("

    if-nez p1, :cond_1

    .line 226
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-ge v2, p1, :cond_0

    .line 227
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Linstafel/app/managers/modals/FlagItem;

    .line 228
    invoke-virtual {p1}, Linstafel/app/managers/modals/FlagItem;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Linstafel/app/managers/modals/FlagItem;->getDesc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Linstafel/app/managers/modals/FlagItem;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v6, v7, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->createTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Linstafel/app/ui/TileLarge;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 230
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Linstafel/app/ui/TileTitle;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->totalSize:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Linstafel/app/ui/TileTitle;->setText(Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    move v6, v2

    .line 233
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_3

    .line 234
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Linstafel/app/managers/modals/FlagItem;

    .line 235
    invoke-virtual {v7}, Linstafel/app/managers/modals/FlagItem;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    add-int/lit8 v6, v6, 0x1

    .line 237
    invoke-virtual {v7}, Linstafel/app/managers/modals/FlagItem;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Linstafel/app/managers/modals/FlagItem;->getDesc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Linstafel/app/managers/modals/FlagItem;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v8, v9, v7}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->createTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Linstafel/app/ui/TileLarge;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 240
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Linstafel/app/ui/TileTitle;->getText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->totalSize:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Linstafel/app/ui/TileTitle;->setText(Ljava/lang/String;)V

    .line 243
    :goto_2
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p2, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0, v1, v0, p3}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;Linstafel/app/ui/TileTitle;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$createTile$4$instafel-app-activity-devmode-analyzer-ifl_a_devmode_backup_analyzer(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 0
    if-eqz p1, :cond_0

    .line 281
    invoke-direct {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->copyFlagContent(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$onCreate$0$instafel-app-activity-devmode-analyzer-ifl_a_devmode_backup_analyzer(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 0
    const/4 p1, 0x3

    if-eq p2, p1, :cond_0

    if-eqz p3, :cond_1

    .line 73
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_1

    .line 74
    :cond_0
    iget-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->search(Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method synthetic lambda$onResume$1$instafel-app-activity-devmode-analyzer-ifl_a_devmode_backup_analyzer()V
    .locals 16

    .line 0
    move-object/from16 v1, p0

    .line 90
    const-string v0, "mapping"

    const-string v2, "data"

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 94
    :try_start_0
    iget-object v5, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v5}, Linstafel/app/managers/OverridesManager;->existsMappingFile()Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v5, :cond_e

    .line 96
    :try_start_1
    invoke-virtual {v1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 97
    new-instance v6, Lorg/json/JSONObject;

    invoke-virtual {v5, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v6, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    .line 99
    new-instance v6, Lorg/json/JSONObject;

    invoke-virtual {v5, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 101
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "NOT_ANY_MAPPING_SELECTED"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 102
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 105
    :goto_0
    new-instance v2, Lorg/json/JSONObject;

    const-string v7, "override"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 107
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v6

    if-eqz v6, :cond_1

    .line 108
    iput-object v2, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    goto :goto_1

    .line 110
    :cond_1
    iget-object v2, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v2}, Linstafel/app/managers/OverridesManager;->readOverrideFile()Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    :goto_1
    if-eqz v0, :cond_2

    .line 114
    iget-object v2, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v2, v0}, Linstafel/app/managers/OverridesManager;->readMappingFileFromUri(Landroid/net/Uri;)Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingContent:Lorg/json/JSONArray;

    goto :goto_2

    .line 116
    :cond_2
    iget-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v0}, Linstafel/app/managers/OverridesManager;->readMappingFile()Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingContent:Lorg/json/JSONArray;

    .line 119
    :goto_2
    iget-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingContent:Lorg/json/JSONArray;

    if-eqz v0, :cond_d

    .line 120
    iget-object v2, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {v2, v0}, Linstafel/app/managers/OverridesManager;->parseMappingFile(Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingObjects:Lorg/json/JSONObject;

    if-eqz v0, :cond_c

    .line 122
    iget-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 123
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 127
    :cond_3
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 128
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v7

    const/4 v9, 0x0

    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 129
    iget-object v10, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingObjects:Lorg/json/JSONObject;

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 130
    iget-object v10, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->mappingObjects:Lorg/json/JSONObject;

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 131
    const-string v11, "subs"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 132
    iget-object v12, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    iget-object v13, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overrideContent:Lorg/json/JSONObject;

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12, v6}, Linstafel/app/managers/OverridesManager;->getOverrideKeyValues(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-eqz v6, :cond_9

    .line 134
    const-string v12, ""

    move v13, v9

    .line 135
    :goto_5
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v13, v14, :cond_8

    .line 136
    invoke-virtual {v6, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v14

    add-int/lit8 v13, v13, 0x1

    .line 138
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v4, ") = "

    const-string v5, " = "

    const-string v7, "unknown (k"

    if-eq v13, v15, :cond_6

    .line 139
    :try_start_2
    invoke-virtual {v14, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const-string v9, "\n"

    if-eqz v15, :cond_5

    .line 140
    :try_start_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v7, 0x0

    invoke-virtual {v14, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v14, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_6

    .line 142
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v14, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_6

    .line 145
    :cond_6
    invoke-virtual {v14, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 146
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v14, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v14, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_6
    move-object v12, v4

    const/4 v5, 0x1

    const/4 v7, 0x0

    goto :goto_7

    .line 148
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v14, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v12, v4

    :goto_7
    move v9, v7

    move v7, v5

    goto/16 :goto_5

    .line 153
    :cond_8
    iget-object v4, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsFounded:Ljava/util/List;

    new-instance v5, Linstafel/app/managers/modals/FlagItem;

    const-string v6, "name"

    .line 156
    invoke-virtual {v10, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v8, v6, v12}, Linstafel/app/managers/modals/FlagItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 162
    :cond_9
    sget v2, Linstafel/app/R$string;->ifl_a11_30:I

    invoke-virtual {v1, v2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_4

    .line 165
    :cond_a
    const-string v4, "_qe_overrides"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 166
    iget-object v4, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsNotFounded:Ljava/util/List;

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    :cond_b
    move v5, v7

    .line 171
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v0

    iput v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->totalSize:I

    .line 172
    iget-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsFounded:Ljava/util/List;

    iget-object v3, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->flagsNotFounded:Ljava/util/List;

    const/4 v4, 0x0

    invoke-direct {v1, v0, v3, v4}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->buildLayout(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    move v4, v5

    goto :goto_9

    .line 177
    :cond_c
    sget v0, Linstafel/app/R$string;->ifl_a11_31:I

    invoke-virtual {v1, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 181
    :cond_d
    sget v0, Linstafel/app/R$string;->ifl_a11_32:I

    invoke-virtual {v1, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_8

    :catch_0
    move-exception v0

    .line 185
    :try_start_4
    sget v2, Linstafel/app/R$string;->ifl_a11_33:I

    invoke-virtual {v1, v2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 186
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_8

    .line 190
    :cond_e
    sget v0, Linstafel/app/R$string;->ifl_a11_34:I

    invoke-virtual {v1, v0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_8

    :catch_1
    move-exception v0

    .line 194
    sget v2, Linstafel/app/R$string;->ifl_a11_35:I

    invoke-virtual {v1, v2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 195
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_8
    const/4 v4, -0x1

    .line 200
    :goto_9
    iget-object v0, v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->handler:Landroid/os/Handler;

    new-instance v3, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;

    invoke-direct {v3, v1, v4, v2}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$1;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;ILjava/lang/String;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 61
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 63
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 64
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode_backup_analyzer:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->setContentView(I)V

    .line 66
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 67
    sget p1, Linstafel/app/R$id;->ifl_page_area:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/PageContentArea;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->layout:Linstafel/app/ui/PageContentArea;

    .line 68
    sget p1, Linstafel/app/R$id;->ifl_flags_layout:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->linearLayout:Landroid/widget/LinearLayout;

    .line 69
    sget p1, Linstafel/app/R$id;->ifl_search_layout:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->searchLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 71
    sget p1, Linstafel/app/R$id;->ifl_flag_editText:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->editText:Landroid/widget/EditText;

    .line 72
    new-instance v0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 84
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 86
    iget-boolean v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->isResumed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 87
    iput-boolean v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->isResumed:Z

    .line 89
    iget-object v0, p0, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/devmode/analyzer/ifl_a_devmode_backup_analyzer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

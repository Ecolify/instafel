.class public Linstafel/app/activity/crash_manager/ifl_a_crash_reports;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_crash_reports.java"


# instance fields
.field crashlogs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Linstafel/app/utils/crashlog/Crashlog;",
            ">;"
        }
    .end annotation
.end field

.field layoutLogs:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->crashlogs:Ljava/util/List;

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$instafel-app-activity-crash_manager-ifl_a_crash_reports(Linstafel/app/utils/crashlog/Crashlog;Landroid/view/View;)V
    .locals 0

    .line 91
    const-class p2, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;

    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->convertToString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p2, p1}, Linstafel/app/utils/GeneralFn;->startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 21

    move-object/from16 v1, p0

    .line 35
    const-string v2, "Error while loading crashlogs"

    const-string v3, "Alert"

    const-string v0, "crashData"

    const-string v4, "appData"

    const-string v5, "deviceData"

    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    invoke-static {v1}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 v6, 0x0

    .line 37
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v1, v7}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 38
    sget v7, Linstafel/app/R$layout;->ifl_at_crash_reports:I

    invoke-virtual {v1, v7}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->setContentView(I)V

    .line 40
    sget v7, Linstafel/app/R$id;->ifl_logs_layout:I

    invoke-virtual {v1, v7}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    iput-object v7, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->layoutLogs:Landroid/widget/LinearLayout;

    .line 42
    sget v7, Linstafel/app/R$id;->ifl_tile_crashlog_delete_logs:I

    invoke-virtual {v1, v7}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Linstafel/app/ui/TileCompact;

    .line 44
    new-instance v8, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;

    invoke-direct {v8, v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$1;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_reports;)V

    invoke-virtual {v7, v8}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    :try_start_0
    invoke-static {v1}, Linstafel/app/managers/CrashManager;->getLogsFromCrashFile(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 56
    :goto_0
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v6, v8, :cond_0

    .line 57
    invoke-virtual {v7, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 58
    new-instance v9, Linstafel/app/utils/crashlog/Crashlog;

    new-instance v10, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    .line 60
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "ifl_ver"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .line 61
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "ig_ver"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 62
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "ig_ver_code"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 63
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "ig_itype"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    invoke-direct {v10, v11, v12, v13, v14}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v15, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    .line 66
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "aver"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    .line 67
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "sdk"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    .line 68
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "model"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    .line 69
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "brand"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    .line 70
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "product"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    invoke-direct/range {v15 .. v20}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v11, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    .line 74
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "msg"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 75
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "trace"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 76
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    move-object/from16 v16, v0

    const-string v0, "class"

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v11, v12, v13, v0}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "date"

    .line 78
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v9, v10, v15, v11, v0}, Linstafel/app/utils/crashlog/Crashlog;-><init>(Linstafel/app/utils/crashlog/CLogDataTypes$AppData;Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;Ljava/lang/Object;)V

    .line 80
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->crashlogs:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v16

    goto/16 :goto_0

    .line 83
    :cond_0
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->layoutLogs:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 84
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->crashlogs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Linstafel/app/utils/crashlog/Crashlog;

    .line 85
    new-instance v5, Linstafel/app/ui/TileLarge;

    invoke-direct {v5, v1}, Linstafel/app/ui/TileLarge;-><init>(Landroid/content/Context;)V

    .line 86
    sget v6, Linstafel/app/R$drawable;->ifl_crashlog:I

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setIconRes(I)V

    .line 87
    invoke-virtual {v4}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v6

    invoke-virtual {v6}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getMsg()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 88
    sget v6, Linstafel/app/R$drawable;->ifl_open_in_browser:I

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setSubIconRes(I)V

    .line 89
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Caught at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Linstafel/app/utils/crashlog/Crashlog;->getDate()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 90
    const-string v6, "visible"

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 91
    new-instance v6, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;

    invoke-direct {v6, v1, v4}, Linstafel/app/activity/crash_manager/ifl_a_crash_reports$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_reports;Linstafel/app/utils/crashlog/Crashlog;)V

    invoke-virtual {v5, v6}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    iget-object v4, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_reports;->layoutLogs:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_1

    :cond_1
    return-void

    .line 95
    :cond_2
    invoke-static {v1, v3, v2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 98
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    invoke-static {v1, v3, v2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public triggerCrash(Landroid/view/View;)V
    .locals 1

    .line 104
    new-instance p1, Landroid/os/FileUriExposedException;

    const-string v0, "Example Crash"

    invoke-direct {p1, v0}, Landroid/os/FileUriExposedException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

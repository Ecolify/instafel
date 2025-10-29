.class public Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_crash_viewer.java"


# instance fields
.field private tileAndroidVersion:Linstafel/app/ui/TileLarge;

.field private tileCopy:Linstafel/app/ui/TileCompact;

.field private tileCrashDate:Linstafel/app/ui/TileLarge;

.field private tileIflIg:Linstafel/app/ui/TileLarge;

.field private tileInfo:Linstafel/app/ui/TileLarge;

.field private tileShare:Linstafel/app/ui/TileCompact;

.field private tileStackTrace:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public copyText(Ljava/lang/String;)V
    .locals 2

    .line 147
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 148
    const-string v1, "ifl_log_clip"

    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    .line 149
    invoke-virtual {v0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void
.end method

.method public createStringLog(Linstafel/app/utils/crashlog/Crashlog;)Ljava/lang/String;
    .locals 4

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Instafel Crashlog\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDate()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "# APP\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 124
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIfl_ver()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IFL_VER"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 125
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IG_VER"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver_code()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IG_VER_CODE"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_itype()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TYPE"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "# DEVICE\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 131
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getAver()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ANDROID_VERSION"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 132
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getSdk()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ANDROID_SDK"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getModel()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MODEL"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getProduct()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PRODUCT"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 135
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getBrand()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "BRAND"

    invoke-direct {p0, v0, v3, v2}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "# CRASH\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 139
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v1

    invoke-virtual {v1}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getMsg()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MSG"

    invoke-direct {p0, v0, v2, v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 140
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v1

    invoke-virtual {v1}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getClassName()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CLASS"

    invoke-direct {p0, v0, v2, v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    invoke-virtual {p1}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object p1

    invoke-virtual {p1}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getTrace()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TRACE"

    invoke-direct {p0, v0, v1, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->addValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$onCreate$0$instafel-app-activity-crash_manager-ifl_a_crash_viewer(Landroid/view/View;)V
    .locals 2

    .line 98
    const-string p1, "clipboard"

    invoke-virtual {p0, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ClipboardManager;

    iget-object v0, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileStackTrace:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ifl_log_clip"

    invoke-static {v1, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$instafel-app-activity-crash_manager-ifl_a_crash_viewer(Landroid/view/View;)V
    .locals 2

    .line 99
    const-string p1, "clipboard"

    invoke-virtual {p0, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ClipboardManager;

    iget-object v0, p0, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileInfo:Linstafel/app/ui/TileLarge;

    invoke-virtual {v0}, Linstafel/app/ui/TileLarge;->getSubtitle()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ifl_log_clip"

    invoke-static {v1, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void
.end method

.method synthetic lambda$onCreate$2$instafel-app-activity-crash_manager-ifl_a_crash_viewer(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 101
    invoke-virtual {p0, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->copyText(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$3$instafel-app-activity-crash_manager-ifl_a_crash_viewer(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 104
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 105
    const-string v0, "android.intent.action.SEND"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 106
    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    const-string p1, "text/plain"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x0

    .line 109
    invoke-static {p2, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 17

    move-object/from16 v1, p0

    .line 30
    const-string v0, "crashData"

    const-string v2, "appData"

    const-string v3, "deviceData"

    .line 0
    const-string v4, "Android "

    .line 30
    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 31
    invoke-static {v1}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 v5, 0x0

    .line 32
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v1, v5}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 33
    sget v5, Linstafel/app/R$layout;->ifl_at_crash_viewer:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->setContentView(I)V

    .line 35
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_msg:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileLarge;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileInfo:Linstafel/app/ui/TileLarge;

    .line 36
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_stacktrace:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileLarge;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileStackTrace:Linstafel/app/ui/TileLarge;

    .line 37
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_aver:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileLarge;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileAndroidVersion:Linstafel/app/ui/TileLarge;

    .line 38
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_iflIgVersion:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileLarge;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileIflIg:Linstafel/app/ui/TileLarge;

    .line 39
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_copy:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileCompact;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileCopy:Linstafel/app/ui/TileCompact;

    .line 40
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_share:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileCompact;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileShare:Linstafel/app/ui/TileCompact;

    .line 41
    sget v5, Linstafel/app/R$id;->ifl_tile_crashviewer_crashDate:I

    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Linstafel/app/ui/TileLarge;

    iput-object v5, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileCrashDate:Linstafel/app/ui/TileLarge;

    .line 44
    :try_start_0
    invoke-virtual {v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 45
    const-string v6, "data"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 47
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance v5, Linstafel/app/utils/crashlog/Crashlog;

    new-instance v7, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    .line 50
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "ifl_ver"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 51
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "ig_ver"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 52
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "ig_ver_code"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 53
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v11, "ig_itype"

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v8, v9, v10, v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v11, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    .line 56
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v8, "aver"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 57
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v8, "sdk"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 58
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v8, "model"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 59
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v8, "brand"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    .line 60
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "product"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    invoke-direct/range {v11 .. v16}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    .line 64
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v8, "msg"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 65
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "trace"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 66
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v9, "class"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v2, v3, v8, v0}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "date"

    .line 68
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v5, v7, v11, v2, v0}, Linstafel/app/utils/crashlog/Crashlog;-><init>(Linstafel/app/utils/crashlog/CLogDataTypes$AppData;Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;Ljava/lang/Object;)V

    .line 70
    const-string v0, "value is null"

    .line 71
    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getAver()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, ")"

    if-eq v2, v3, :cond_0

    .line 72
    :try_start_1
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileAndroidVersion:Linstafel/app/ui/TileLarge;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v4

    invoke-virtual {v4}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getAver()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (SDK "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getDeviceData()Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;

    move-result-object v4

    invoke-virtual {v4}, Linstafel/app/utils/crashlog/CLogDataTypes$DeviceData;->getSdk()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :cond_0
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileAndroidVersion:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 76
    :goto_0
    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getTrace()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_1

    .line 77
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileStackTrace:Linstafel/app/ui/TileLarge;

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v3

    invoke-virtual {v3}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getTrace()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_1

    .line 79
    :cond_1
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileStackTrace:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 82
    :goto_1
    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIfl_ver()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_2

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_2

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver_code()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_2

    .line 83
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileIflIg:Linstafel/app/ui/TileLarge;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v4

    invoke-virtual {v4}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIg_ver()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (v"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getAppData()Linstafel/app/utils/crashlog/CLogDataTypes$AppData;

    move-result-object v4

    invoke-virtual {v4}, Linstafel/app/utils/crashlog/CLogDataTypes$AppData;->getIfl_ver()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_2

    .line 85
    :cond_2
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileIflIg:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 87
    :goto_2
    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getDate()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_3

    .line 88
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileCrashDate:Linstafel/app/ui/TileLarge;

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getDate()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_3

    .line 90
    :cond_3
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileCrashDate:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 92
    :goto_3
    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getMsg()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v2, v3, :cond_4

    .line 93
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileInfo:Linstafel/app/ui/TileLarge;

    invoke-virtual {v5}, Linstafel/app/utils/crashlog/Crashlog;->getCrashData()Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;

    move-result-object v2

    invoke-virtual {v2}, Linstafel/app/utils/crashlog/CLogDataTypes$CrashData;->getMsg()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    goto :goto_4

    .line 95
    :cond_4
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileInfo:Linstafel/app/ui/TileLarge;

    invoke-virtual {v2, v0}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 98
    :goto_4
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileStackTrace:Linstafel/app/ui/TileLarge;

    new-instance v2, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda0;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;)V

    invoke-virtual {v0, v2}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileInfo:Linstafel/app/ui/TileLarge;

    new-instance v2, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda1;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;)V

    invoke-virtual {v0, v2}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    invoke-virtual {v1, v5}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->createStringLog(Linstafel/app/utils/crashlog/Crashlog;)Ljava/lang/String;

    move-result-object v0

    .line 101
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileCopy:Linstafel/app/ui/TileCompact;

    new-instance v3, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda2;

    invoke-direct {v3, v1, v0}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda2;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    iget-object v2, v1, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;->tileShare:Linstafel/app/ui/TileCompact;

    new-instance v3, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda3;

    invoke-direct {v3, v1, v0}, Linstafel/app/activity/crash_manager/ifl_a_crash_viewer$$ExternalSyntheticLambda3;-><init>(Linstafel/app/activity/crash_manager/ifl_a_crash_viewer;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Linstafel/app/ui/TileCompact;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 113
    const-string v2, "Alert"

    const-string v3, "Error while loading crashlog"

    invoke-static {v1, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

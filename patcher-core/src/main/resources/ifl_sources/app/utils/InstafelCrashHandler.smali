.class public Linstafel/app/utils/InstafelCrashHandler;
.super Ljava/lang/Object;
.source "InstafelCrashHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Linstafel/app/utils/InstafelCrashHandler;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    .line 19
    iget-object p1, p0, Linstafel/app/utils/InstafelCrashHandler;->mContext:Landroid/content/Context;

    const-string v0, "Instafel crashed, crash log saved."

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 20
    new-instance p1, Linstafel/app/managers/CrashManager;

    iget-object v0, p0, Linstafel/app/utils/InstafelCrashHandler;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Linstafel/app/managers/CrashManager;-><init>(Landroid/content/Context;)V

    .line 21
    invoke-virtual {p1, p2}, Linstafel/app/managers/CrashManager;->saveLog(Ljava/lang/Throwable;)V

    .line 23
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    invoke-static {p1}, Landroid/os/Process;->killProcess(I)V

    const/4 p1, 0x1

    .line 24
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.class public Linstafel/app/ExampleAppClass;
.super Landroid/app/Application;
.source "ExampleAppClass.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .line 9
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 10
    new-instance v0, Linstafel/app/utils/InstafelCrashHandler;

    invoke-direct {v0, p0}, Linstafel/app/utils/InstafelCrashHandler;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-void
.end method

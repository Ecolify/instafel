.class public Linstafel/app/managers/NotificationOtaManager;
.super Ljava/lang/Object;
.source "NotificationOtaManager.java"


# static fields
.field private static iflNotificationManager:Landroid/app/NotificationManager; = null

.field public static notification_channel_id:Ljava/lang/String; = "ifl_ota"

.field public static notification_id:I = 0x102


# instance fields
.field private final ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Linstafel/app/managers/NotificationOtaManager;->ctx:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public createNotificationChannel()V
    .locals 5

    .line 23
    :try_start_0
    const-string v0, "Instafel Update Notification"

    .line 24
    const-string v1, "This channel is required for Instafel\'s OTA notification feature."

    .line 25
    new-instance v2, Landroid/app/NotificationChannel;

    sget-object v3, Linstafel/app/managers/NotificationOtaManager;->notification_channel_id:Ljava/lang/String;

    const/4 v4, 0x3

    invoke-direct {v2, v3, v0, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 30
    invoke-virtual {v2, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 31
    iget-object v0, p0, Linstafel/app/managers/NotificationOtaManager;->ctx:Landroid/content/Context;

    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 32
    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 34
    iget-object v1, p0, Linstafel/app/managers/NotificationOtaManager;->ctx:Landroid/content/Context;

    const-string v2, "Error while creating notification channel"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 35
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public sendNotification(Landroid/content/Context;)V
    .locals 3

    .line 43
    new-instance v0, Landroid/app/Notification$Builder;

    sget-object v1, Linstafel/app/managers/NotificationOtaManager;->notification_channel_id:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v1, 0x1080081

    .line 48
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v1

    const-string v2, "Downloading IFL Update"

    .line 49
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    const-string v2, "Waiting for server connection.."

    .line 50
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 51
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 52
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 54
    sget-object v1, Linstafel/app/managers/NotificationOtaManager;->iflNotificationManager:Landroid/app/NotificationManager;

    if-nez v1, :cond_0

    .line 55
    const-string v1, "notification"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    sput-object p1, Linstafel/app/managers/NotificationOtaManager;->iflNotificationManager:Landroid/app/NotificationManager;

    .line 57
    :cond_0
    sget-object p1, Linstafel/app/managers/NotificationOtaManager;->iflNotificationManager:Landroid/app/NotificationManager;

    sget v1, Linstafel/app/managers/NotificationOtaManager;->notification_id:I

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

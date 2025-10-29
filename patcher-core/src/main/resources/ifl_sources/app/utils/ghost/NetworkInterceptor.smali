.class public Linstafel/app/utils/ghost/NetworkInterceptor;
.super Ljava/lang/Object;
.source "NetworkInterceptor.java"


# static fields
.field private static cachedUriFieldName:Ljava/lang/String; = null

.field private static fieldSearchAttempted:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static extractUri(Ljava/lang/Object;)Ljava/net/URI;
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 128
    :cond_0
    :try_start_0
    sget-object v1, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    const/4 v2, 0x1

    if-nez v1, :cond_1

    sget-boolean v1, Linstafel/app/utils/ghost/NetworkInterceptor;->fieldSearchAttempted:Z

    if-nez v1, :cond_1

    .line 129
    invoke-static {p0}, Linstafel/app/utils/ghost/NetworkInterceptor;->findUriFieldName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    .line 130
    sput-boolean v2, Linstafel/app/utils/ghost/NetworkInterceptor;->fieldSearchAttempted:Z

    .line 133
    :cond_1
    sget-object v1, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 136
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/net/URI;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_2
    return-object v0
.end method

.method private static findUriFieldName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 99
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object p0

    .line 102
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p0, v2

    .line 103
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/net/URI;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 p0, 0x1

    .line 104
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 105
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    :cond_2
    return-object v0
.end method

.method public static getFakeUri()Ljava/net/URI;
    .locals 5

    const/4 v0, 0x0

    .line 79
    :try_start_0
    new-instance v1, Ljava/net/URI;

    const-string v2, "https"

    const-string v3, "127.0.0.1"

    const-string v4, "/404"

    invoke-direct {v1, v2, v3, v4, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    return-object v0
.end method

.method public static interceptRequest(Ljava/lang/Object;)V
    .locals 1

    .line 173
    :try_start_0
    invoke-static {p0}, Linstafel/app/utils/ghost/NetworkInterceptor;->extractUri(Ljava/lang/Object;)Ljava/net/URI;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 174
    invoke-static {v0}, Linstafel/app/utils/ghost/NetworkInterceptor;->shouldBlockRequest(Ljava/net/URI;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    invoke-static {}, Linstafel/app/utils/ghost/NetworkInterceptor;->getFakeUri()Ljava/net/URI;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 177
    invoke-static {p0, v0}, Linstafel/app/utils/ghost/NetworkInterceptor;->setUri(Ljava/lang/Object;Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static setUri(Ljava/lang/Object;Ljava/net/URI;)V
    .locals 2

    if-eqz p0, :cond_1

    .line 152
    sget-object v0, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_0

    .line 157
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Linstafel/app/utils/ghost/NetworkInterceptor;->cachedUriFieldName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 159
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public static shouldBlockRequest(Ljava/net/URI;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    .line 27
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 32
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 33
    invoke-virtual {p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    .line 38
    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshot:Z

    const/4 v2, 0x1

    if-eqz p0, :cond_2

    .line 39
    const-string p0, "/screenshot/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "/ephemeral_screenshot/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    return v2

    .line 45
    :cond_2
    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnce:Z

    if-eqz p0, :cond_4

    .line 46
    const-string p0, "/item_replayed/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    return v2

    .line 49
    :cond_3
    const-string p0, "/direct"

    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "/item_seen/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    return v2

    .line 55
    :cond_4
    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStory:Z

    if-eqz p0, :cond_5

    .line 56
    const-string p0, "/api/v2/media/seen/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    return v2

    .line 62
    :cond_5
    sget-boolean p0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLive:Z

    if-eqz p0, :cond_6

    .line 63
    const-string p0, "/heartbeat_and_get_viewer_count/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    return v2

    :cond_6
    :goto_0
    return v0
.end method

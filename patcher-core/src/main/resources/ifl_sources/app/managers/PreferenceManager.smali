.class public Linstafel/app/managers/PreferenceManager;
.super Ljava/lang/Object;
.source "PreferenceManager.java"


# instance fields
.field private ctx:Landroid/content/Context;

.field private editor:Landroid/content/SharedPreferences$Editor;

.field private preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Linstafel/app/managers/PreferenceManager;->ctx:Landroid/content/Context;

    .line 13
    const-string v0, "ifl_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    .line 14
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iput-object p1, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    return-void
.end method


# virtual methods
.method public exists(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 18
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 19
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    .line 21
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;
    .locals 1

    .line 26
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public getPreferenceInt(Ljava/lang/String;I)I
    .locals 1

    .line 53
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getPreferenceLong(Ljava/lang/String;J)J
    .locals 1

    .line 44
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public getPreferenceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setPreferenceBoolean(Ljava/lang/String;Z)V
    .locals 1

    .line 34
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 35
    iget-object p1, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPreferenceInt(Ljava/lang/String;I)V
    .locals 1

    .line 57
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 58
    iget-object p1, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPreferenceLong(Ljava/lang/String;J)V
    .locals 1

    .line 48
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 49
    iget-object p1, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPreferenceString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 39
    iget-object v0, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 40
    iget-object p1, p0, Linstafel/app/managers/PreferenceManager;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

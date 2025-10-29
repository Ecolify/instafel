.class Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;
.super Ljava/lang/Object;
.source "ifl_a_patches_info.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/activity/about/ifl_a_patches_info;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PatchInfo"
.end annotation


# instance fields
.field public desc:Ljava/lang/String;

.field public groupShortname:Ljava/lang/String;

.field public isSingle:Ljava/lang/Boolean;

.field public name:Ljava/lang/String;

.field public path:Ljava/lang/String;

.field public shortname:Ljava/lang/String;

.field public tasks:Lorg/json/JSONArray;

.field final synthetic this$0:Linstafel/app/activity/about/ifl_a_patches_info;


# direct methods
.method public constructor <init>(Linstafel/app/activity/about/ifl_a_patches_info;Lorg/json/JSONObject;)V
    .locals 1

    .line 218
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    :try_start_0
    const-string v0, "name"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->name:Ljava/lang/String;

    .line 221
    const-string v0, "desc"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->desc:Ljava/lang/String;

    .line 222
    const-string v0, "shortname"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->shortname:Ljava/lang/String;

    .line 223
    const-string v0, "path"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->path:Ljava/lang/String;

    .line 224
    const-string v0, "groupShortname"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->groupShortname:Ljava/lang/String;

    .line 225
    const-string v0, "tasks"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->tasks:Lorg/json/JSONArray;

    .line 226
    const-string v0, "isSingle"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->isSingle:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 228
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 229
    const-string p2, "An error occurred while parsing patchObj"

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

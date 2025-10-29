.class Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;
.super Ljava/lang/Object;
.source "ifl_a_patches_info.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/activity/about/ifl_a_patches_info;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GroupInfo"
.end annotation


# instance fields
.field public desc:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public patches:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field public path:Ljava/lang/String;

.field public shortname:Ljava/lang/String;

.field final synthetic this$0:Linstafel/app/activity/about/ifl_a_patches_info;


# direct methods
.method public constructor <init>(Linstafel/app/activity/about/ifl_a_patches_info;Lorg/json/JSONObject;)V
    .locals 5

    .line 194
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 196
    :try_start_0
    const-string v1, "name"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->name:Ljava/lang/String;

    .line 197
    const-string v1, "desc"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->desc:Ljava/lang/String;

    .line 198
    const-string v1, "shortname"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->shortname:Ljava/lang/String;

    .line 199
    const-string v1, "path"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->path:Ljava/lang/String;

    .line 201
    const-string v1, "patches"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 202
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->patches:Ljava/util/ArrayList;

    move v1, v0

    .line 203
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 204
    iget-object v2, p0, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->patches:Ljava/util/ArrayList;

    new-instance v3, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception p2

    .line 207
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 208
    const-string p2, "An error occurred while parsing groupObj"

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

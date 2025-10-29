.class Linstafel/app/activity/about/ifl_a_patches_info$1;
.super Ljava/lang/Object;
.source "ifl_a_patches_info.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/about/ifl_a_patches_info;->generateSinglePatchTile(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)Linstafel/app/ui/TileLarge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/about/ifl_a_patches_info;

.field final synthetic val$groupInfo:Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;

.field final synthetic val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;


# direct methods
.method constructor <init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 82
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    iput-object p2, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    iput-object p3, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->val$groupInfo:Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 86
    :try_start_0
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    iget-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    iget-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info$1;->val$groupInfo:Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;

    invoke-static {p1, v0, v1}, Linstafel/app/activity/about/ifl_a_patches_info;->access$000(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 88
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

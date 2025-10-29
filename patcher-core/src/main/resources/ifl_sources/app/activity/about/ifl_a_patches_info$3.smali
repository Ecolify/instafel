.class Linstafel/app/activity/about/ifl_a_patches_info$3;
.super Ljava/lang/Object;
.source "ifl_a_patches_info.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/about/ifl_a_patches_info;->showInfoDialog(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/about/ifl_a_patches_info;

.field final synthetic val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

.field final synthetic val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;


# direct methods
.method constructor <init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 144
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    iput-object p2, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    iput-object p3, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 147
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 148
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->val$patchInfo:Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    iget-object v0, v0, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->path:Ljava/lang/String;

    const-string v1, "\\."

    const-string v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ".kt"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 149
    iget-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info$3;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://github.com/mamiiblt/instafel/blob/dev/patcher-core/src/main/kotlin/instafel/patcher/core/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Linstafel/app/utils/GeneralFn;->openInWebBrowser(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.class Linstafel/app/activity/about/ifl_a_patches_info$2;
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


# direct methods
.method constructor <init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/utils/dialog/InstafelDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 137
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$2;->this$0:Linstafel/app/activity/about/ifl_a_patches_info;

    iput-object p2, p0, Linstafel/app/activity/about/ifl_a_patches_info$2;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 140
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_patches_info$2;->val$instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    return-void
.end method

.class Linstafel/app/activity/about/ifl_a_build_info$1;
.super Ljava/lang/Object;
.source "ifl_a_build_info.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/about/ifl_a_build_info;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/about/ifl_a_build_info;


# direct methods
.method constructor <init>(Linstafel/app/activity/about/ifl_a_build_info;)V
    .locals 0

    .line 45
    iput-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info$1;->this$0:Linstafel/app/activity/about/ifl_a_build_info;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 48
    iget-object p1, p0, Linstafel/app/activity/about/ifl_a_build_info$1;->this$0:Linstafel/app/activity/about/ifl_a_build_info;

    const-class v0, Linstafel/app/activity/about/ifl_a_patches_info;

    invoke-static {p1, v0}, Linstafel/app/utils/GeneralFn;->startIntent(Landroid/app/Activity;Ljava/lang/Class;)V

    return-void
.end method

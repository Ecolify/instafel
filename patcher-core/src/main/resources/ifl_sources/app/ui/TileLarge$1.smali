.class Linstafel/app/ui/TileLarge$1;
.super Ljava/lang/Object;
.source "TileLarge.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/ui/TileLarge;

.field final synthetic val$onClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method constructor <init>(Linstafel/app/ui/TileLarge;Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 56
    iput-object p1, p0, Linstafel/app/ui/TileLarge$1;->this$0:Linstafel/app/ui/TileLarge;

    iput-object p2, p0, Linstafel/app/ui/TileLarge$1;->val$onClickListener:Landroid/view/View$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 59
    iget-object v0, p0, Linstafel/app/ui/TileLarge$1;->val$onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 61
    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.class public Linstafel/app/utils/OpenIflMenu;
.super Ljava/lang/Object;
.source "OpenIflMenu.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 24
    invoke-static {}, Linstafel/app/utils/InitializeInstafel;->startInstafel()V

    const/4 p1, 0x1

    return p1
.end method

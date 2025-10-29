.class public Linstafel/app/utils/dialog/InstafelDialogItem;
.super Ljava/lang/Object;
.source "InstafelDialogItem.java"


# instance fields
.field private name:Ljava/lang/String;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Linstafel/app/utils/dialog/InstafelDialogItem;->name:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Linstafel/app/utils/dialog/InstafelDialogItem;->view:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 11
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialogItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 15
    iget-object v0, p0, Linstafel/app/utils/dialog/InstafelDialogItem;->view:Landroid/view/View;

    return-object v0
.end method

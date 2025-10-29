.class public Linstafel/app/utils/types/Types$DialogItem;
.super Ljava/lang/Object;
.source "Types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linstafel/app/utils/types/Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DialogItem"
.end annotation


# instance fields
.field private final string_name:Ljava/lang/String;

.field private final textView:Landroid/widget/TextView;

.field final synthetic this$0:Linstafel/app/utils/types/Types;


# direct methods
.method public constructor <init>(Linstafel/app/utils/types/Types;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 29
    iput-object p1, p0, Linstafel/app/utils/types/Types$DialogItem;->this$0:Linstafel/app/utils/types/Types;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Linstafel/app/utils/types/Types$DialogItem;->textView:Landroid/widget/TextView;

    .line 31
    iput-object p3, p0, Linstafel/app/utils/types/Types$DialogItem;->string_name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getStringName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Linstafel/app/utils/types/Types$DialogItem;->string_name:Ljava/lang/String;

    return-object v0
.end method

.method public getTextView()Landroid/widget/TextView;
    .locals 1

    .line 39
    iget-object v0, p0, Linstafel/app/utils/types/Types$DialogItem;->textView:Landroid/widget/TextView;

    return-object v0
.end method

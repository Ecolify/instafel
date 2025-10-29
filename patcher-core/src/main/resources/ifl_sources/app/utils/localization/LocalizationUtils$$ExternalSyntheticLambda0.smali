.class public final synthetic Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/Map$Entry;

.field public final synthetic f$2:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/Map$Entry;Ljava/util/Map;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map$Entry;

    iput-object p3, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 0
    iget-object v0, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map$Entry;

    iget-object v2, p0, Linstafel/app/utils/localization/LocalizationUtils$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    invoke-static {v0, v1, v2, p1}, Linstafel/app/utils/localization/LocalizationUtils;->lambda$setLanguageClickListeners$0(Landroid/app/Activity;Ljava/util/Map$Entry;Ljava/util/Map;Landroid/view/View;)V

    return-void
.end method

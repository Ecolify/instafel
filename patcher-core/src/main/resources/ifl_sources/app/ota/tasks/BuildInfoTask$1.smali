.class Linstafel/app/ota/tasks/BuildInfoTask$1;
.super Ljava/lang/Object;
.source "BuildInfoTask.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/ota/tasks/BuildInfoTask;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/ota/tasks/BuildInfoTask;

.field final synthetic val$finalApkContentLink:Ljava/lang/String;


# direct methods
.method constructor <init>(Linstafel/app/ota/tasks/BuildInfoTask;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 117
    iput-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iput-object p2, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->val$finalApkContentLink:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 120
    new-instance p1, Linstafel/app/managers/PreferenceManager;

    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v0}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Linstafel/app/managers/PreferenceManager;-><init>(Landroid/content/Context;)V

    .line 121
    sget-object v0, Linstafel/app/utils/types/PreferenceKeys;->ifl_ota_background_enable:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Linstafel/app/managers/PreferenceManager;->getPreferenceBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 123
    new-instance p1, Linstafel/app/managers/NotificationOtaManager;

    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v2}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {p1, v2}, Linstafel/app/managers/NotificationOtaManager;-><init>(Landroid/content/Context;)V

    .line 124
    invoke-virtual {p1}, Linstafel/app/managers/NotificationOtaManager;->createNotificationChannel()V

    .line 126
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v2}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p1, v2}, Linstafel/app/managers/NotificationOtaManager;->sendNotification(Landroid/content/Context;)V

    .line 128
    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object p1, p1, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {p1}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 129
    new-instance v2, Linstafel/app/ota/tasks/DownloadUpdateTask;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v3, "NEW"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v8}, Linstafel/app/ota/tasks/DownloadUpdateTask;-><init>(Ljava/lang/String;Landroid/app/Activity;Landroid/widget/ProgressBar;Landroid/widget/TextView;Linstafel/app/utils/dialog/InstafelDialog;Landroid/widget/TextView;)V

    .line 130
    new-array p1, v0, [Ljava/lang/String;

    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->val$finalApkContentLink:Ljava/lang/String;

    aput-object v0, p1, v1

    invoke-virtual {v2, p1}, Linstafel/app/ota/tasks/DownloadUpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 133
    :cond_0
    new-instance v3, Linstafel/app/utils/dialog/InstafelDialog;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object p1

    invoke-direct {v3, p1}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 134
    const-string p1, "top_space"

    const/16 v2, 0x19

    invoke-virtual {v3, p1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 135
    sget v8, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v9, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    .line 141
    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object p1

    invoke-direct {v9, p1, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 135
    const-string v4, "dialog_title"

    const-string v5, "ifl_status"

    const/16 v6, 0x1e

    const/4 v7, 0x0

    invoke-virtual/range {v3 .. v9}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    const/4 p1, 0x3

    .line 142
    const-string v10, "mid_space"

    invoke-virtual {v3, v10, p1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 143
    sget v8, Linstafel/app/utils/dialog/InstafelDialogTextType;->SUBTEXT:I

    new-instance v9, Linstafel/app/utils/dialog/InstafelDialogMargins;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    .line 149
    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object p1

    invoke-direct {v9, p1, v1, v1}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    .line 143
    const-string v4, "dialog_byte_status"

    const-string v5, "ifl_size"

    const/16 v6, 0x12

    invoke-virtual/range {v3 .. v9}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    const/16 p1, 0x14

    .line 150
    invoke-virtual {v3, v10, p1}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 152
    new-instance v6, Landroid/widget/ProgressBar;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object p1

    const/4 v4, 0x0

    const v5, 0x1010078

    invoke-direct {v6, p1, v4, v5}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 153
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x136

    .line 154
    invoke-virtual {v3, v4}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v4

    const/4 v5, -0x2

    invoke-direct {p1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 157
    iget-object v4, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v4}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x439b0000    # 310.0f

    mul-float/2addr v4, v5

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    float-to-int v4, v4

    .line 159
    iput v4, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 160
    iget-object v4, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object v4, v4, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    const/16 v5, 0x18

    invoke-virtual {v4, v5}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 161
    iget-object v4, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object v4, v4, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v4, v5}, Linstafel/app/utils/dialog/InstafelDialog;->convertToDp(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 162
    invoke-virtual {v6, p1}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    invoke-virtual {v6, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    const/16 p1, 0x64

    .line 164
    invoke-virtual {v6, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    const/16 v4, 0x15

    .line 165
    invoke-virtual {v6, v4}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 167
    invoke-virtual {v3}, Linstafel/app/utils/dialog/InstafelDialog;->getDialogThemeMode()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 168
    iget-object v4, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v4}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Linstafel/app/R$drawable;->ifl_progress_background_light:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_0

    .line 170
    :cond_1
    iget-object v4, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {v4}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Linstafel/app/R$drawable;->ifl_progress_background_dark:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 172
    :goto_0
    invoke-virtual {v6, v4}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 174
    const-string v4, "progress_bar"

    invoke-virtual {v3, v4, v6}, Linstafel/app/utils/dialog/InstafelDialog;->addCustomView(Ljava/lang/String;Landroid/view/View;)V

    .line 175
    const-string v4, "bottom_space"

    invoke-virtual {v3, v4, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 176
    iget-object v2, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    iget-object v2, v2, Linstafel/app/ota/tasks/BuildInfoTask;->instafelDialog:Linstafel/app/utils/dialog/InstafelDialog;

    invoke-virtual {v2}, Linstafel/app/utils/dialog/InstafelDialog;->dismiss()V

    .line 177
    invoke-virtual {v3}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    .line 179
    invoke-virtual {v6, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 180
    const-string v2, "dialog_byte_status"

    invoke-virtual {v3, v2}, Linstafel/app/utils/dialog/InstafelDialog;->getTextView(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v9

    .line 181
    const-string v2, "dialog_title"

    invoke-virtual {v3, v2}, Linstafel/app/utils/dialog/InstafelDialog;->getTextView(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    .line 183
    const-string v2, "0%"

    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    const-string v2, "0/0 MB"

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    invoke-virtual {v6, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 186
    invoke-virtual {v6, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    move-object v8, v3

    .line 188
    new-instance v3, Linstafel/app/ota/tasks/DownloadUpdateTask;

    iget-object p1, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->this$0:Linstafel/app/ota/tasks/BuildInfoTask;

    invoke-static {p1}, Linstafel/app/ota/tasks/BuildInfoTask;->access$000(Linstafel/app/ota/tasks/BuildInfoTask;)Landroid/app/Activity;

    move-result-object v5

    const-string v4, "OLD"

    invoke-direct/range {v3 .. v9}, Linstafel/app/ota/tasks/DownloadUpdateTask;-><init>(Ljava/lang/String;Landroid/app/Activity;Landroid/widget/ProgressBar;Landroid/widget/TextView;Linstafel/app/utils/dialog/InstafelDialog;Landroid/widget/TextView;)V

    .line 189
    new-array p1, v0, [Ljava/lang/String;

    iget-object v0, p0, Linstafel/app/ota/tasks/BuildInfoTask$1;->val$finalApkContentLink:Ljava/lang/String;

    aput-object v0, p1, v1

    invoke-virtual {v3, p1}, Linstafel/app/ota/tasks/DownloadUpdateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

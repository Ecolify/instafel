.class public Linstafel/app/activity/about/ifl_a_patches_info;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_patches_info.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;,
        Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;
    }
.end annotation


# instance fields
.field appliedPatchCounts:Lorg/json/JSONObject;

.field groupPatches:Lorg/json/JSONArray;

.field pageContents:Landroid/widget/LinearLayout;

.field singlePatches:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Linstafel/app/activity/about/ifl_a_patches_info;->showInfoDialog(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V

    return-void
.end method

.method private generateSinglePatchTile(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)Linstafel/app/ui/TileLarge;
    .locals 2

    .line 76
    new-instance v0, Linstafel/app/ui/TileLarge;

    invoke-direct {v0, p0}, Linstafel/app/ui/TileLarge;-><init>(Landroid/content/Context;)V

    .line 77
    iget-object v1, p1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setTitleText(Ljava/lang/String;)V

    .line 78
    iget-object v1, p1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->desc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSubtitleText(Ljava/lang/String;)V

    .line 79
    sget v1, Linstafel/app/R$drawable;->ifl_patch:I

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setIconRes(I)V

    .line 80
    const-string v1, "gone"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setVisiblitySubIcon(Ljava/lang/String;)V

    .line 81
    const-string v1, "visible"

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 82
    new-instance v1, Linstafel/app/activity/about/ifl_a_patches_info$1;

    invoke-direct {v1, p0, p1, p2}, Linstafel/app/activity/about/ifl_a_patches_info$1;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V

    invoke-virtual {v0, v1}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private generateTitleTile(Ljava/lang/String;)Linstafel/app/ui/TileTitle;
    .locals 4

    .line 167
    new-instance v0, Linstafel/app/ui/TileTitle;

    invoke-direct {v0, p0}, Linstafel/app/ui/TileTitle;-><init>(Landroid/content/Context;)V

    .line 168
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 172
    invoke-virtual {v0, v1}, Linstafel/app/ui/TileTitle;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    invoke-virtual {v0, p1}, Linstafel/app/ui/TileTitle;->setText(Ljava/lang/String;)V

    return-object v0
.end method

.method private getPatchCount(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    .line 159
    :try_start_0
    iget-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info;->appliedPatchCounts:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 161
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    .line 162
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method private parseInfoJSON()V
    .locals 2

    .line 179
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    sget-object v1, Linstafel/app/InstafelEnv;->APPLIED_PATCHES:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 180
    const-string v1, "singlePatches"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info;->singlePatches:Lorg/json/JSONArray;

    .line 181
    const-string v1, "groupPatches"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, p0, Linstafel/app/activity/about/ifl_a_patches_info;->groupPatches:Lorg/json/JSONArray;

    .line 182
    const-string v1, "appliedPatchCounts"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Linstafel/app/activity/about/ifl_a_patches_info;->appliedPatchCounts:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 184
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 185
    const-string v0, "An error occurred while loading patch infos"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 186
    invoke-virtual {p0}, Linstafel/app/activity/about/ifl_a_patches_info;->finish()V

    return-void
.end method

.method private showInfoDialog(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 96
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u2022 Name: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n\u2022 Shortname: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->shortname:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\n\u2022 Desc: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, v1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->desc:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "\n\u2022 Tasks: \n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    move v7, v6

    .line 102
    :goto_0
    iget-object v8, v1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->tasks:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    const-string v9, "\n"

    if-ge v7, v8, :cond_0

    .line 103
    iget-object v8, v1, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;->tasks:Lorg/json/JSONArray;

    invoke-virtual {v8, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 104
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v10, "   - "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 108
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "About Patch\n"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 109
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "About Group\n\u2022 Name: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v7, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->shortname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->desc:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_1
    move-object v9, v3

    .line 115
    new-instance v10, Linstafel/app/utils/dialog/InstafelDialog;

    invoke-direct {v10, v0}, Linstafel/app/utils/dialog/InstafelDialog;-><init>(Landroid/app/Activity;)V

    .line 116
    const-string v2, "top_space"

    const/16 v3, 0x19

    invoke-virtual {v10, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 117
    sget v15, Linstafel/app/utils/dialog/InstafelDialogTextType;->TITLE:I

    new-instance v2, Linstafel/app/utils/dialog/InstafelDialogMargins;

    invoke-direct {v2, v0, v6, v6}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v11, "dialog_title"

    const-string v12, "About Patch"

    const/16 v13, 0x1e

    const/4 v14, 0x0

    move-object/from16 v16, v2

    invoke-virtual/range {v10 .. v16}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    .line 124
    const-string v2, "mid_space"

    const/16 v3, 0x14

    invoke-virtual {v10, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 125
    sget v12, Linstafel/app/utils/dialog/InstafelDialogTextType;->DESCRIPTION:I

    new-instance v13, Linstafel/app/utils/dialog/InstafelDialogMargins;

    const/16 v2, 0x18

    invoke-direct {v13, v0, v2, v2}, Linstafel/app/utils/dialog/InstafelDialogMargins;-><init>(Landroid/app/Activity;II)V

    const-string v8, "dialog_desc_left"

    move-object v7, v10

    const/16 v10, 0x10

    const/16 v11, 0x136

    invoke-virtual/range {v7 .. v13}, Linstafel/app/utils/dialog/InstafelDialog;->addTextView(Ljava/lang/String;Ljava/lang/String;IIILinstafel/app/utils/dialog/InstafelDialogMargins;)V

    move-object v10, v7

    .line 132
    const-string v2, "button_top_space"

    invoke-virtual {v10, v2, v3}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 133
    new-instance v14, Linstafel/app/activity/about/ifl_a_patches_info$2;

    invoke-direct {v14, v0, v10}, Linstafel/app/activity/about/ifl_a_patches_info$2;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/utils/dialog/InstafelDialog;)V

    new-instance v15, Linstafel/app/activity/about/ifl_a_patches_info$3;

    invoke-direct {v15, v0, v10, v1}, Linstafel/app/activity/about/ifl_a_patches_info$3;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Linstafel/app/utils/dialog/InstafelDialog;Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;)V

    const-string v11, "buttons"

    const-string v12, "Okay"

    const-string v13, "Source"

    invoke-virtual/range {v10 .. v15}, Linstafel/app/utils/dialog/InstafelDialog;->addPozitiveAndNegativeButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 153
    const-string v1, "bottom_space"

    const/16 v2, 0x1b

    invoke-virtual {v10, v1, v2}, Linstafel/app/utils/dialog/InstafelDialog;->addSpace(Ljava/lang/String;I)V

    .line 154
    invoke-virtual {v10}, Linstafel/app/utils/dialog/InstafelDialog;->show()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 32
    const-string v0, ")"

    .line 0
    const-string v1, "Single Patches ("

    .line 32
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 34
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v2}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 35
    sget v2, Linstafel/app/R$layout;->ifl_at_applied_patches_info:I

    invoke-virtual {p0, v2}, Linstafel/app/activity/about/ifl_a_patches_info;->setContentView(I)V

    .line 37
    sget v2, Linstafel/app/R$id;->ifl_patches_layout:I

    invoke-virtual {p0, v2}, Linstafel/app/activity/about/ifl_a_patches_info;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    .line 38
    invoke-direct {p0}, Linstafel/app/activity/about/ifl_a_patches_info;->parseInfoJSON()V

    .line 41
    :try_start_0
    iget-object v2, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "singles"

    invoke-direct {p0, v1}, Linstafel/app/activity/about/ifl_a_patches_info;->getPatchCount(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Linstafel/app/activity/about/ifl_a_patches_info;->generateTitleTile(Ljava/lang/String;)Linstafel/app/ui/TileTitle;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v1, p1

    .line 42
    :goto_0
    iget-object v2, p0, Linstafel/app/activity/about/ifl_a_patches_info;->singlePatches:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "gone"

    if-ge v1, v2, :cond_1

    .line 43
    :try_start_1
    new-instance v2, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    iget-object v4, p0, Linstafel/app/activity/about/ifl_a_patches_info;->singlePatches:Lorg/json/JSONArray;

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Lorg/json/JSONObject;)V

    const/4 v4, 0x0

    .line 44
    invoke-direct {p0, v2, v4}, Linstafel/app/activity/about/ifl_a_patches_info;->generateSinglePatchTile(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)Linstafel/app/ui/TileLarge;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    .line 45
    iget-object v4, p0, Linstafel/app/activity/about/ifl_a_patches_info;->singlePatches:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ne v1, v4, :cond_0

    .line 46
    invoke-virtual {v2, v3}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 47
    iget-object v3, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 49
    :cond_0
    iget-object v3, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    move v1, p1

    .line 53
    :goto_1
    iget-object v2, p0, Linstafel/app/activity/about/ifl_a_patches_info;->groupPatches:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 54
    new-instance v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;

    iget-object v4, p0, Linstafel/app/activity/about/ifl_a_patches_info;->groupPatches:Lorg/json/JSONArray;

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;-><init>(Linstafel/app/activity/about/ifl_a_patches_info;Lorg/json/JSONObject;)V

    .line 55
    iget-object v4, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->shortname:Ljava/lang/String;

    invoke-direct {p0, v6}, Linstafel/app/activity/about/ifl_a_patches_info;->getPatchCount(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Linstafel/app/activity/about/ifl_a_patches_info;->generateTitleTile(Ljava/lang/String;)Linstafel/app/ui/TileTitle;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v4, p1

    .line 57
    :goto_2
    iget-object v5, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->patches:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 58
    iget-object v5, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->patches:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;

    .line 59
    invoke-direct {p0, v5, v2}, Linstafel/app/activity/about/ifl_a_patches_info;->generateSinglePatchTile(Linstafel/app/activity/about/ifl_a_patches_info$PatchInfo;Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;)Linstafel/app/ui/TileLarge;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    .line 60
    iget-object v6, v2, Linstafel/app/activity/about/ifl_a_patches_info$GroupInfo;->patches:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v4, v6, :cond_2

    .line 61
    invoke-virtual {v5, v3}, Linstafel/app/ui/TileLarge;->setSpaceBottom(Ljava/lang/String;)V

    .line 62
    iget-object v6, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 64
    :cond_2
    iget-object v6, p0, Linstafel/app/activity/about/ifl_a_patches_info;->pageContents:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    return-void

    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 70
    const-string v0, "An error occurred while binding patches"

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 71
    invoke-virtual {p0}, Linstafel/app/activity/about/ifl_a_patches_info;->finish()V

    return-void
.end method

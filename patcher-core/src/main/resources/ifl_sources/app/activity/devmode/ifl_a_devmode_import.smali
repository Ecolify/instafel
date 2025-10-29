.class public Linstafel/app/activity/devmode/ifl_a_devmode_import;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ifl_a_devmode_import.java"


# instance fields
.field overridesManager:Linstafel/app/managers/OverridesManager;

.field tileFull:Linstafel/app/ui/TileLarge;

.field tileMerge:Linstafel/app/ui/TileLarge;

.field tileOldBackup:Linstafel/app/ui/TileLarge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 12

    .line 91
    const-string v0, "_qe_overrides_"

    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0xf

    .line 92
    const-string v1, "name"

    const-string v2, "info"

    const-string v3, "Success"

    const-string v4, "SUCCESS"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "backup"

    const-string v8, "Alert"

    if-eq p1, p2, :cond_e

    const/16 p2, 0x16

    const-string v9, "\n"

    const-string v10, "Error"

    if-eq p1, p2, :cond_5

    const/16 p2, 0x1d

    if-eq p1, p2, :cond_0

    goto/16 :goto_3

    :cond_0
    if-eqz p3, :cond_1

    .line 96
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    :cond_1
    if-nez v6, :cond_2

    .line 102
    sget p1, Linstafel/app/R$string;->ifl_a4_09:I

    invoke-static {p0, p1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 107
    :cond_2
    :try_start_0
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v6}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 109
    iget-object p2, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p2, p1}, Linstafel/app/managers/OverridesManager;->writeContentIntoOverridesFile(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p2

    .line 110
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 111
    sget p2, Linstafel/app/R$string;->ifl_a11_43:I

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 113
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p3}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, "\n\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v8, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 116
    :cond_4
    sget p1, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v8, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p3}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, v10, p2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_3

    :cond_5
    if-eqz p3, :cond_6

    .line 126
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    :cond_6
    if-nez v6, :cond_7

    .line 132
    sget p1, Linstafel/app/R$string;->ifl_a4_09:I

    invoke-static {p0, p1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 137
    :cond_7
    :try_start_1
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v6}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_d

    .line 139
    iget-object p2, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p2}, Linstafel/app/managers/OverridesManager;->readOverrideFile()Lorg/json/JSONObject;

    move-result-object p2

    if-eqz p2, :cond_c

    .line 141
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-virtual {p3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p3

    .line 142
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 144
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 145
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 147
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 148
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v6, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 151
    :cond_8
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_9

    .line 152
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-interface {v8, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 155
    :cond_9
    new-instance p3, Ljava/util/HashSet;

    invoke-direct {p3, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 156
    invoke-interface {p3, v8}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 158
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 160
    const-string v6, "Instafel"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " : "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v11, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    .line 163
    :cond_a
    new-instance p3, Lorg/json/JSONArray;

    invoke-direct {p3}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    iget-object p3, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p3, p2}, Linstafel/app/managers/OverridesManager;->writeContentIntoOverridesFile(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p3

    .line 165
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 166
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 167
    sget p3, Linstafel/app/R$string;->ifl_a11_46:I

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lorg/json/JSONObject;->length()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p3, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 169
    :cond_b
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " 4\n\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v10, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 172
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " 3"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v10, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 175
    :cond_d
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " 2"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v10, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception p1

    .line 178
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p3}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, v10, p2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_3

    :cond_e
    if-eqz p3, :cond_f

    .line 185
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    :cond_f
    if-nez v6, :cond_10

    .line 191
    sget p1, Linstafel/app/R$string;->ifl_a4_09:I

    invoke-static {p0, p1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 196
    :cond_10
    :try_start_2
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p1, v6}, Linstafel/app/managers/OverridesManager;->readBackupFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_12

    .line 198
    iget-object p2, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    invoke-virtual {p2, p1}, Linstafel/app/managers/OverridesManager;->writeContentIntoOverridesFile(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p2

    .line 199
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_11

    .line 200
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    .line 201
    sget p3, Linstafel/app/R$string;->ifl_a11_46:I

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p3, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v3, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 203
    :cond_11
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p3}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " (ERR_CODE 3)\n\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v8, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 206
    :cond_12
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p2}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " (ERR_CODE 2)"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v8, p1}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    return-void

    :catch_2
    move-exception p1

    .line 209
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget p3, Linstafel/app/R$string;->ifl_a11_42:I

    invoke-virtual {p0, p3}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " (ERR_CODE X)\n\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, v8, p2}, Linstafel/app/utils/dialog/InstafelDialog;->createSimpleAlertDialogNoFinish(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 35
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    invoke-static {p0}, Linstafel/app/utils/GeneralFn;->updateIflUi(Landroidx/activity/ComponentActivity;)V

    const/4 p1, 0x0

    .line 37
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Linstafel/app/utils/localization/LocalizationUtils;->updateIflLocale(Landroid/app/Activity;Ljava/lang/Boolean;)V

    .line 38
    sget p1, Linstafel/app/R$layout;->ifl_at_devmode_import:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->setContentView(I)V

    .line 40
    new-instance p1, Linstafel/app/managers/OverridesManager;

    invoke-direct {p1, p0}, Linstafel/app/managers/OverridesManager;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->overridesManager:Linstafel/app/managers/OverridesManager;

    .line 41
    sget p1, Linstafel/app/R$id;->ifl_tile_import_full:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileFull:Linstafel/app/ui/TileLarge;

    .line 42
    sget p1, Linstafel/app/R$id;->ifl_tile_import_merge:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileMerge:Linstafel/app/ui/TileLarge;

    .line 43
    sget p1, Linstafel/app/R$id;->ifl_tile_import_old_backups:I

    invoke-virtual {p0, p1}, Linstafel/app/activity/devmode/ifl_a_devmode_import;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Linstafel/app/ui/TileLarge;

    iput-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileOldBackup:Linstafel/app/ui/TileLarge;

    .line 45
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileFull:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode_import$1;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode_import$1;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode_import;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileFull:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode_import$2;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode_import;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 68
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileOldBackup:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode_import$3;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode_import$3;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode_import;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    iget-object p1, p0, Linstafel/app/activity/devmode/ifl_a_devmode_import;->tileMerge:Linstafel/app/ui/TileLarge;

    new-instance v0, Linstafel/app/activity/devmode/ifl_a_devmode_import$4;

    invoke-direct {v0, p0}, Linstafel/app/activity/devmode/ifl_a_devmode_import$4;-><init>(Linstafel/app/activity/devmode/ifl_a_devmode_import;)V

    invoke-virtual {p1, v0}, Linstafel/app/ui/TileLarge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

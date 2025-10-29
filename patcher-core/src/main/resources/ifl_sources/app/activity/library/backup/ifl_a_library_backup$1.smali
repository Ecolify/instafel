.class Linstafel/app/activity/library/backup/ifl_a_library_backup$1;
.super Ljava/lang/Object;
.source "ifl_a_library_backup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linstafel/app/activity/library/backup/ifl_a_library_backup;->createBackupTile(Linstafel/app/api/models/BackupListItem;)Linstafel/app/ui/TileLarge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linstafel/app/activity/library/backup/ifl_a_library_backup;

.field final synthetic val$backup:Linstafel/app/api/models/BackupListItem;


# direct methods
.method constructor <init>(Linstafel/app/activity/library/backup/ifl_a_library_backup;Linstafel/app/api/models/BackupListItem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 201
    iput-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;->this$0:Linstafel/app/activity/library/backup/ifl_a_library_backup;

    iput-object p2, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;->val$backup:Linstafel/app/api/models/BackupListItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 204
    iget-object p1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;->this$0:Linstafel/app/activity/library/backup/ifl_a_library_backup;

    const-class v0, Linstafel/app/activity/library/backup/ifl_a_library_backup_info;

    iget-object v1, p0, Linstafel/app/activity/library/backup/ifl_a_library_backup$1;->val$backup:Linstafel/app/api/models/BackupListItem;

    invoke-virtual {v1}, Linstafel/app/api/models/BackupListItem;->convertForPutIntoActivity()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Linstafel/app/utils/GeneralFn;->startIntentWithString(Landroid/app/Activity;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

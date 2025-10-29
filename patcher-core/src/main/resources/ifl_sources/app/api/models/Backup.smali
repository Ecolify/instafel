.class public Linstafel/app/api/models/Backup;
.super Linstafel/app/api/models/BackupListItem;
.source "Backup.java"


# instance fields
.field private authorSocials:Lorg/json/JSONObject;

.field private backupVersion:I

.field private changelog:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private lastEdit:Ljava/lang/String;

.field private manifestVersion:I

.field private optionalShowAuthorSocials:Z

.field private versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Linstafel/app/api/models/BackupListItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Linstafel/app/api/models/Backup;->authorSocials:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public getAuthorSocials()Lorg/json/JSONObject;
    .locals 1

    .line 61
    iget-object v0, p0, Linstafel/app/api/models/Backup;->authorSocials:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getBackupVersion()I
    .locals 1

    .line 49
    iget v0, p0, Linstafel/app/api/models/Backup;->backupVersion:I

    return v0
.end method

.method public getChangelog()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Linstafel/app/api/models/Backup;->changelog:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Linstafel/app/api/models/Backup;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getLastEdit()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Linstafel/app/api/models/Backup;->lastEdit:Ljava/lang/String;

    return-object v0
.end method

.method public getManifestVersion()I
    .locals 1

    .line 37
    iget v0, p0, Linstafel/app/api/models/Backup;->manifestVersion:I

    return v0
.end method

.method public getVersionName()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Linstafel/app/api/models/Backup;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method public isOptionalShowAuthorSocials()Z
    .locals 1

    .line 57
    iget-boolean v0, p0, Linstafel/app/api/models/Backup;->optionalShowAuthorSocials:Z

    return v0
.end method

.method public setAuthorSocials(Lorg/json/JSONObject;)V
    .locals 0

    .line 81
    iput-object p1, p0, Linstafel/app/api/models/Backup;->authorSocials:Lorg/json/JSONObject;

    return-void
.end method

.method public setBackupVersion(I)V
    .locals 0

    .line 69
    iput p1, p0, Linstafel/app/api/models/Backup;->backupVersion:I

    return-void
.end method

.method public setChangelog(Ljava/lang/String;)V
    .locals 0

    .line 24
    iput-object p1, p0, Linstafel/app/api/models/Backup;->changelog:Ljava/lang/String;

    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0

    .line 73
    iput-object p1, p0, Linstafel/app/api/models/Backup;->description:Ljava/lang/String;

    return-void
.end method

.method public setLastEdit(Ljava/lang/String;)V
    .locals 0

    .line 32
    iput-object p1, p0, Linstafel/app/api/models/Backup;->lastEdit:Ljava/lang/String;

    return-void
.end method

.method public setManifestVersion(I)V
    .locals 0

    .line 65
    iput p1, p0, Linstafel/app/api/models/Backup;->manifestVersion:I

    return-void
.end method

.method public setOptionalShowAuthorSocials(Z)V
    .locals 0

    .line 77
    iput-boolean p1, p0, Linstafel/app/api/models/Backup;->optionalShowAuthorSocials:Z

    return-void
.end method

.method public setVersionName(Ljava/lang/String;)V
    .locals 0

    .line 45
    iput-object p1, p0, Linstafel/app/api/models/Backup;->versionName:Ljava/lang/String;

    return-void
.end method

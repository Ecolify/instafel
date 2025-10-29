.class public Linstafel/app/managers/modals/ParseResult;
.super Ljava/lang/Object;
.source "ParseResult.java"


# instance fields
.field private flagId:Ljava/lang/String;

.field private mappingObject:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Linstafel/app/managers/modals/ParseResult;->flagId:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Linstafel/app/managers/modals/ParseResult;->mappingObject:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public getFlagId()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Linstafel/app/managers/modals/ParseResult;->flagId:Ljava/lang/String;

    return-object v0
.end method

.method public getMappingObject()Lorg/json/JSONObject;
    .locals 1

    .line 15
    iget-object v0, p0, Linstafel/app/managers/modals/ParseResult;->mappingObject:Lorg/json/JSONObject;

    return-object v0
.end method

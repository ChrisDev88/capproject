namespace de.datatrain;

using {SAddress} from '../db/data-model-custom-types';
using {
    cuid,
    managed
} from '@sap/cds/common';


entity Tiles : cuid, managed {
    TileName    : localized String(32);
    Description : localized String(255);
    PageId      : String(32);
    IconId      : String(20);
    ParentId    : String(36);
    RoleId      : String(36);
    SortId      : Integer;
}

entity Notifications : managed {
    key ModuleId               : String(2);
    key NotificationId         : String(12);
        NotificationTypeId     : String(2);
        NotificationTypeName   : String(20);
        NotificationShortText  : String(40);
        FunctionalLocationId   : String(40);
        FunctionalLocationName : String(40);
        DesiredStartDate       : Timestamp;
        DesiredEndDate         : Timestamp;
        DueDate                : Timestamp;
        CreatedAtDate          : Timestamp;
        ClosedAtDate           : Timestamp;
        IsNotificationClosed   : Boolean;
        VendorId               : String(10);
        ObjectId               : String(13);
        ContractId             : String(13);
        PartnerId              : String(10);
        Workplace              : String(8);
        NotificationFormId     : String(2);
        // StatusId               : String(1);
        // TerminationId          : String(2);
        // TerminationName        : String(30);
        Object                 : Association to Objects
                                     on ObjectId = Object.ObjectId;
        Contract               : Association to Contracts
                                     on ContractId = Contract.ContractId;
        FunctionalLocation     : Association to FunctionalLocations
                                     on FunctionalLocationId = FunctionalLocation.FunctionalLocationId;
}

entity Objects : SAddress, managed {
    key ObjectId             : String(13);
        ObjectName           : String(60);
        CompanyCode          : String(4);
        BusinessEntity       : String(8);
        RentalObject         : String(8);
        Building             : String(8);
        Property             : String(8);
        ObjectType           : String(10);
        ObjectTypeName       : String(20);
        FunctionalLocationId : String(30);
        FloorId              : String(3);
        FloorName            : String(15);
        LocationOnFloorId    : String(2);
        LocationOnFloorName  : String(15);
        TypeOfUseId          : String(4);
        TypeOfUseName        : String(4);
        IsBuilding           : Boolean;
        IsProperty           : Boolean;
        ContractId           : String(13);
        // BuildingSectionId    : String(2);
        // BuildingSectionName  : String(15);
        Notifications        : Association to many Notifications
                                   on Notifications.Object = $self;
        Keys                 : Composition of many Keys
                                   on Keys.Object = $self;
        Meters               : Composition of many Meters
                                   on Meters.Object = $self;
        FixturesSet          : Composition of many FixturesSet
                                   on FixturesSet.Object = $self;
        FixturesNew          : Composition of many FixturesNew
                                   on FixturesNew.Object = $self;
        Contract             : Association to Contracts
                                   on ContractId = Contract.ContractId;
        FunctionalLocation   : Association to FunctionalLocations
                                   on FunctionalLocationId = FunctionalLocation.FunctionalLocationId;
}

entity Keys : cuid, managed {
    key ObjectId        : String(13);
        KeyTypeId       : String(4);
        KeyTypeName     : String(40);
        KeyName         : String(40);
        IsLockingSystem : Boolean;
        Cost            : Decimal(8, 2);
        Object          : Association to Objects
                              on ObjectId = Object.ObjectId;
        KeyNumbers      : Composition of many KeyNumbers
                              on KeyNumbers.CorrespondingKey = $self;
}

entity KeyNumbers : cuid, managed {
    key ObjectId           : String(13);
    key NotificationId     : String(12);
        KeyNumberRequired  : Integer;
        KeyNumberActual    : Integer;
        ChangeLockCylinder : Boolean;
        CorrespondingKey   : Association to Keys
                                 on  ObjectId = CorrespondingKey.ObjectId
                                 and ID       = CorrespondingKey.ID;
}

entity Meters : cuid, managed {
    key ObjectId           : String(13);
        MeterId            : String(8);
        MeterName          : String(20);
        MeterLocation      : String(40);
        MeterCondition     : String(4);
        PixoMeterType      : String(29);
        PixoIntegerDigits  : String(4);
        PixoFractionDigits : String(4);
        Object             : Association to Objects
                                 on ObjectId = Object.ObjectId;
        MeterReadings      : Composition of many MeterReadings
                                 on MeterReadings.Meter = $self;
}

entity MeterReadings : cuid, managed {
    key ObjectId         : String(13);
    key NumeratorId      : String(8);
    key NotificationId   : String(12);
        MeterValue       : Decimal(20, 6);
        MeterValueString : String(20);
        ReadingDate      : Date;
        IsFinished       : Boolean;
        BookingError     : Boolean;
        Meter            : Association to Meters
                               on  ObjectId = Meter.ObjectId
                               and ID       = Meter.ID;
}

entity FixturesSet : managed {
    key ObjectId              : String(13);
    key FixtureId             : String(6);
        AdditionalInformation : Decimal(7, 2);
        Number                : Integer;
        Object                : Association to Objects
                                    on ObjectId = Object.ObjectId;
}

entity FixturesNew : managed {
    key ObjectId              : String(13);
    key FixtureId             : String(6);
        NotificationId        : String(12);
        AdditionalInformation : Decimal(7, 2);
        Number                : Integer;
        IsFinished            : Boolean;
        IsSet                 : Boolean;
        Object                : Association to Objects
                                    on ObjectId = Object.ObjectId;
}


entity Contracts : managed {
    key ContractId         : String(13);
        CompanyCode        : String(4);
        ContractNumber     : String(13);
        ContractNumberFull : String(45);
        ContractStartDate  : Date;
        ContractEndDate    : Date;
        ContractType       : String(4);
        ContractTypeName   : String(30);
        ContractStatus     : String(30);
        ObjectId           : String(13);
        AccountContract    : Boolean;
        AccountDebitor     : Boolean;
        CosmeticRepair     : Boolean;
        Deposit            : Decimal(13, 2);
        DepositCurrent     : Decimal(13, 2);
        RentBalance        : Decimal(13, 2);
        Guarantor          : String(80);

        Object             : Association to Objects
                                 on ObjectId = Object.ObjectId;
        Notifications      : Association to many Notifications
                                 on Notifications.Contract = $self;
        Termination        : Composition of one ContractTerminations
                                 on Termination.Contract = $self;
}

entity ContractTerminations : managed {
    key ContractId            : String(13);
        TerminationDate       : Date;
        TerminationCalc       : Date;
        TerminationPer        : Date;
        TerminationRequest    : Date;
        TerminationReasonId   : String(2);
        TerminationReasonName : String(30);
        TerminationDurch      : String(40);
        TerminationExtraord   : String(1);
        TerminationType       : String(40);
        TerminationSchemaId   : String(4);
        TerminationSchemaName : String(60);
        Contract              : Association to Contracts
                                    on ContractId = Contract.ContractId;
}


entity FunctionalLocations : SAddress, managed {
    key FunctionalLocationId   : String(40);
        FunctionalLocationName : String(40);
        FunctionalLocationType : String(10);
        ParentId               : String(30);
        AlternativeId          : String(30);
        Latitude               : String(8);
        Longitude              : String(8);
        BomNumber              : String(8);
        ObjectId               : String(13);
        SortId                 : String(4);
        Object                 : Association to Objects
                                     on ObjectId = Object.ObjectId;
        Notifications          : Association to many Notifications
                                     on Notifications.FunctionalLocation = $self;
        Parent                 : Association to FunctionalLocations
                                     on ParentId = Parent.FunctionalLocationId;
        Children               : Association to many FunctionalLocations
                                     on Children.Parent = $self;
        Additions              : Composition of many FunctionalLocationAdditions
                                     on Additions.FunctionalLocation = $self;
        Materials              : Composition of many Materials
                                     on Materials.FunctionalLocation = $self;
}

entity FunctionalLocationAdditions : managed {
    key FunctionalLocationId : String(40);
    key Name                 : String(40);
        Value                : String(255);
        FunctionalLocation   : Association to FunctionalLocations
                                   on FunctionalLocationId = FunctionalLocation.FunctionalLocationId;
}

entity Materials : managed {
    key FunctionalLocationId : String(40);
    key MaterialId           : String(18);
    key BomId                : String(40);
        BomNumber            : String(8);
        BomCategory          : String(1);
        BomNodeNumber        : String(8);
        BomCounterId         : String(8);
        FunctionalLocation   : Association to FunctionalLocations
                                   on FunctionalLocationId = FunctionalLocation.FunctionalLocationId;
        MaterialFields       : Composition of many MaterialFields
                                   on MaterialFields.Material = $self;
        Conditions           : Composition of many MaterialConditions
                                   on Conditions.Material = $self;
}

entity MaterialConditions : managed {
    key FunctionalLocationId : String(40);
    key MaterialId           : String(18);
    key BomId                : String(40);
    key NotificationId       : String(12);
    key CatalogType          : String(1);
    key CodeGroup            : String(8);
    key Code                 : String(4);
        ConditionStatus      : String(1);
        ConditionKey         : String(3);
        Responsible          : String(40);
        Measurement          : Decimal(8, 2);
        Text                 : String;
        Material             : Association to Materials
                                   on  FunctionalLocationId = Material.FunctionalLocationId
                                   and MaterialId           = Material.MaterialId
                                   and BomId                = Material.BomId;
}

entity MaterialFields : managed {
    key FunctionalLocationId : String(40);
    key MaterialId           : String(18);
    key BomId                : String(40);
    key Fieldname            : String(30);
        Fieldvalue           : String(255);
        IsChanged            : Boolean;
        Material             : Association to Materials
                                   on  FunctionalLocationId = Material.FunctionalLocationId
                                   and MaterialId           = Material.MaterialId
                                   and BomId                = Material.BomId;
}

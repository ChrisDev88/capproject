namespace de.datatrain;

using {SAddress} from '../db/data-model-custom-types';
using {
    cuid,
    managed
} from '@sap/cds/common';

// @cds.persistence.exists
entity Notifications {
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
        UpdatedAtDate          : Timestamp;
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
}

entity Objects : SAddress {
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
}

entity Keys : cuid {
    ObjectId        : String(13);
    KeyTypeId       : String(4);
    KeyTypeName     : localized String(40);
    KeyName         : String(40);
    IsLockingSystem : Boolean;
    Cost            : Decimal(8, 2);
    Object          : Association to Objects
                          on ObjectId = Object.ObjectId;
    KeyNumbers      : Composition of many KeyNumbers
                          on KeyNumbers.CorrespondingKey = $self;
}

entity KeyNumbers : cuid {
    key NotificationId     : String(12);
    KeyNumberRequired  : Integer;
    KeyNumberActual    : Integer;
    ChangeLockCylinder : Boolean;
    CorrespondingKey   : Association to Keys
                             on ID = CorrespondingKey.ID;
}

entity Meters : cuid {
    key ObjectId           : String(13);
    MeterId            : String(8);
    MeterName          : String(20);
    MeterLocation      : localized String(40);
    MeterCondition     : String(4);
    PixoMeterType      : String(29);
    PixoIntegerDigits  : String(4);
    PixoFractionDigits : String(4);
    Object             : Association to Objects
                             on ObjectId = Object.ObjectId;
    MeterReadings      : Composition of many MeterReadings
                             on MeterReadings.Meter = $self;
}

entity MeterReadings : cuid {
    key NumeratorId      : String(8);
    key NotificationId   : String(12);
    MeterValue       : Decimal(20, 6);
    MeterValueString : String(20);
    ReadingDate      : Date;
    IsFinished       : Boolean;
    BookingError     : Boolean;
    Meter            : Association to Meters
                           on ID = Meter.ID;
}

entity FixturesSet {
    key ObjectId              : String(13);
    key FixtureId             : String(6);
        AdditionalInformation : Decimal(7, 2);
        Number                : Integer;
        Object                : Association to Objects
                                    on ObjectId = Object.ObjectId;
}

entity FixturesNew {
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


entity Contracts {
    key ContractId        : String(13);
        CompanyCode       : String(4);
        ContractNumber    : String(13);
        ContractStartDate : Date;
        ContractEndDate   : Date;
        ContractType      : String(4);
        ContractTypeName  : String(30);
        ObjectId          : String(13);
        Object            : Association to Objects
                                on ObjectId = Object.ObjectId;
        Notifications     : Association to many Notifications
                                on Notifications.Contract = $self;
}

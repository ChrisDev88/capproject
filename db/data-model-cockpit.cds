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
        // BuildingSectionId    : String(2);
        // BuildingSectionName  : String(15);
        Notifications        : Association to many Notifications
                                   on Notifications.Object = $self;
        Keys                 : Composition of many Keys
                                   on Keys.Object = $self;

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
    NotificationId     : String(12);
    KeyNumberRequired  : Integer;
    KeyNumberActual    : Integer;
    ChangeLockCylinder : Boolean;
    CorrespondingKey   : Association to Keys
                             on ID = CorrespondingKey.ID;
}

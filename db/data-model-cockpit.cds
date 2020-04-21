using {SAddress} from '../db/data-model-custom-types';

namespace de.datatrain;

entity Notification {
    key ModuleId              : String(2);
    key NotificationId        : String(12);
        NotificationTypeId    : String(2);
        NotificationShortText : String(40);
        NotificationFormId    : String(2);
        TerminationId         : String(2);
        TerminationName       : String(30);
        ContractId            : String(13);
        ObjectId              : String(13);
        PartnerId             : String(10);
        FunctionalLocationId  : String(30);
        WorkplaceId           : String(8) not null;
        StatusId              : String(1);
        IsNotificationClosed  : Boolean;
        DesiredStartDate      : Timestamp;
        DesiredEndDate        : Timestamp;
        DueDate               : Timestamp;
        UpdatedAtDate         : Timestamp;
}

entity Object {
    key ObjectId             : String(13);
        ObjectType           : String(10);
        ObjectTypeName       : String(20);
        CompanyCode          : String(4);
        BusinessEntity       : String(8);
        RentalObject         : String(8);
        Building             : String(8);
        Property             : String(8);
        FunctionalLocationId : String(30);
        TypeOfUseId          : String(4);
        TypeOfUseName        : String(4);
        IsBuilding           : Boolean;
        IsProperty           : Boolean;
        SAddress             : SAddress;
}

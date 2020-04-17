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
        WorkplaceId           : String(8);
        StatusId              : String(1);
        IsNotificationClosed  : Boolean;
        DesiredStartDate      : Timestamp;
        DesiredEndDate        : Timestamp;
        DueDate               : Timestamp;
}

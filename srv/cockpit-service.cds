using de.datatrain as db from '../db/data-model-cockpit';

service CockpitService @(requires : [
'cockpit',
'admin'
]) {

    @readonly
    entity Tiles                       as projection on db.Tiles excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity Notifications               as projection on db.Notifications excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity Tasks                       as projection on db.Tasks excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity MailOrders                  as projection on db.MailOrders excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity NotificationAdditions       as projection on db.NotificationnAdditions excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity Objects                     as projection on db.Objects excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity Keys                        as projection on db.Keys excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity KeyNumbers                  as projection on db.KeyNumbers excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity Meters                      as projection on db.Meters excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity MeterReadings               as projection on db.MeterReadings excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity FixturesSet                 as projection on db.FixturesSet excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity FixturesNew                 as projection on db.FixturesNew excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity Contracts                   as projection on db.Contracts excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity ContractTerminations        as projection on db.ContractTerminations excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity FunctionalLocations         as projection on db.FunctionalLocations excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity FunctionalLocationAdditions as projection on db.FunctionalLocationAdditions excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity Materials                   as projection on db.Materials excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity MaterialConditions          as projection on db.MaterialConditions excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity MaterialFields              as projection on db.MaterialFields excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity Partners                    as projection on db.Partners excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity PartnerNewAddresses         as projection on db.PartnerNewAddresses excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity Participants                as projection on db.Participants excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    @readonly
    entity Contract2Partners           as projection on db.Contract2Partners excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };
}

// annotate CockpitService.Notifications with @(restrict : [{
//     grant : ['READ'], //  { grant: 'READ', where: 'Workplace = $user.workplace' },
//     to    : 'cockpit'
// }, ]);

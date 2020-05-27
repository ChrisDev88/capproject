using de.datatrain as db from '../db/data-model-cockpit';

@path:'cockpit'
service CockpitService @(requires : [ 'cockpit', 'admin' ]) {
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

    entity Objects                     as projection on db.Objects;
    entity Keys                        as projection on db.Keys;
    entity KeyNumbers                  as projection on db.KeyNumbers;

    //{* , ID as Id}
    entity Meters                      as projection on db.Meters excluding {
        createdBy,
        createdAt,
        modifiedBy,
        modifiedAt
    };

    entity MeterReadings               as projection on db.MeterReadings;
    entity FixturesSet                 as projection on db.FixturesSet;
    entity FixturesNew                 as projection on db.FixturesNew;
    entity Contracts                   as projection on db.Contracts;
    entity FunctionalLocations         as projection on db.FunctionalLocations;
    entity FunctionalLocationAdditions as projection on db.FunctionalLocationAdditions;
    entity Materials                   as projection on db.Materials;
    entity MaterialConditions          as projection on db.MaterialConditions;
    entity MaterialFields              as projection on db.MaterialFields;
}


annotate CockpitService.Tiles with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.Notifications with @(restrict : [{
    grant : ['READ'], //  { grant: 'READ', where: 'Workplace = $user.workplace' },
    to    : 'cockpit'
}, ]);

annotate CockpitService.Objects with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.Keys with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.KeyNumbers with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.Meters with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.MeterReadings with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.FixturesSet with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.Contracts with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.FunctionalLocations with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.FunctionalLocationAdditions with @(restrict : [{
    grant : ['READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.Materials with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.MaterialFields with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

annotate CockpitService.MaterialConditions with @(restrict : [{
    grant : ['WRITE', 'READ'],
    to    : 'cockpit'
}, ]);

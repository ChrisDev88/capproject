using de.datatrain as db from '../db/data-model-cockpit';

service BackendService @(requires : 'backend') {
    entity Notifications as projection on db.Notifications;
    entity Objects       as projection on db.Objects;
    entity Keys          as projection on db.Keys;
    entity KeyNumbers    as projection on db.KeyNumbers;
    entity Meters        as projection on db.Meters;
    entity MeterReadings as projection on db.MeterReadings;
    entity FixturesSet   as projection on db.FixturesSet;
    entity FixturesNew   as projection on db.FixturesNew;
    entity Contracts     as projection on db.Contracts;
}


annotate BackendService.Notifications with @(restrict : [{
    grant : [
        'WRITE'
    ],
    to    : 'backend'
}, ]);

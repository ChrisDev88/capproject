using de.datatrain as db from '../db/data-model-cockpit';

service CockpitService @(requires : 'authenticated-user') {
    entity Notifications as projection on db.Notifications;
    entity Objects       as projection on db.Objects;
    entity Keys          as projection on db.Keys;
    entity KeyNumbers    as projection on db.KeyNumbers;
}

annotate CockpitService.Notifications with @(restrict : [
{
    grant : 'CREATE',
    to    : 'admin'
},
{
    grant : 'READ',
    to    : 'admin'
}
]);

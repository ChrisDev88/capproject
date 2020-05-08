using de.datatrain as db from '../db/data-model-cockpit';

service CockpitService @(requires : 'authenticated-user') {
    entity Notifications as projection on db.Notification;
    entity Object        as projection on db.Object;
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

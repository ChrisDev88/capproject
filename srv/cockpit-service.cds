using de.datatrain as db from '../db/data-model-cockpit';

service CockpitService {
    entity Notifications as projection on db.Notification;
    entity Object        as projection on db.Object;
}

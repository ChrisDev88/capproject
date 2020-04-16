using de.datatrain as db from '../db/data-model';

service CockpitService {
    @readonly entity Notifications as projection on db.Notification;
}
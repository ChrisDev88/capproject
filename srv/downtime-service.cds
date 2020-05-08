using de.datatrain as db from '../db/data-model-downtime';

service DowntimeService @(requires: 'authenticated-user') {
    entity Downtimes as projection on db.Downtimes;
}

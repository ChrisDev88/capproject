using de.datatrain as db from '../db/data-model-downtime';

service DowntimeService {
    entity Downtimes as projection on db.Downtimes;
}

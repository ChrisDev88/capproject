using de.datatrain as db from '../db/data-model-downtime';

@path:'downtimes'
service DowntimeService {
    entity Downtimes as projection on db.Downtimes;
}

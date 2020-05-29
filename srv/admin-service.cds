using de.datatrain as db from '../db/data-model-cockpit';

@path:'admin'
service AdminService @(requires : 'admin') {
    entity Tiles                       as projection on db.Tiles;
}

// annotate AdminService.Tiles with @odata.draft.enabled;
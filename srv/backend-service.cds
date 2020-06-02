using de.datatrain as db from '../db/data-model-cockpit';

service BackendService @(requires : [
'backend',
'admin'
]) {
    entity Notifications               as projection on db.Notifications;
    entity Objects                     as projection on db.Objects;
    entity Keys                        as projection on db.Keys;
    entity KeyNumbers                  as projection on db.KeyNumbers;
    entity Meters                      as projection on db.Meters;
    entity MeterReadings               as projection on db.MeterReadings;
    entity FixturesSet                 as projection on db.FixturesSet;
    entity FixturesNew                 as projection on db.FixturesNew;
    entity Contracts                   as projection on db.Contracts;
    entity ContractTerminations        as projection on db.ContractTerminations;
    entity FunctionalLocations         as projection on db.FunctionalLocations;
    entity FunctionalLocationAdditions as projection on db.FunctionalLocationAdditions;
    entity Materials                   as projection on db.Materials;
    entity MaterialConditions          as projection on db.MaterialConditions;
    entity MaterialFields              as projection on db.MaterialFields;
}

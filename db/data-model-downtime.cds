namespace de.datatrain;

entity Downtimes {
   key id          : String(255);
       description : String(255);
       startTime   : Timestamp;
       endTime     : Timestamp;
}

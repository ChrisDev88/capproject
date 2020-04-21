using {
    Currency,
    cuid,
    managed,
    Country
} from '@sap/cds/common';

define type SAddress {
    Street       : String(60);
    HouseNumber1 : String(10);
    HouseNumber2 : String(10);
    zipCode      : String(10);
    City         : String(40);
    Country      : String(3);
    Region       : String(3);
}

define type SPosition {
    FloorId             : String(3);
    FloorName           : String(15);
    LocationOnFloorId   : String(2);
    LocationOnFloorName : String(10);
    BuildingSectionId   : String(2);
    BuildingSectionName : String(15);
}

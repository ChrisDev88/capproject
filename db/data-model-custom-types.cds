using {
    Currency,
    cuid,
    managed,
    Country
} from '@sap/cds/common';

aspect SAddress {
    Street       : String(60);
    HouseNumber1 : String(10);
    HouseNumber2 : String(10);
    ZipCode      : String(10);
    City         : String(40);
    Country      : String(3);
    Region       : String(3);
}



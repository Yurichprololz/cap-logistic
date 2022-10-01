namespace statusSpace;

entity DriverStatuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}

entity CarStatuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}

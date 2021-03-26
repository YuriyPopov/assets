table 99900 Asset
{
    Caption = 'Asset';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Description;
    DrillDownPageID = "Asset List";
    LookupPageID = "Asset List";

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(30; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location where("Use As In-Transit" = CONST(false));
        }
        field(40; "Location Name"; Text[100])
        {
            Caption = 'Location Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Location.Name where(Code = field("Location Code")));
        }
        field(50; "Asset Type"; Enum "Asset Types")
        {
            Caption = 'Asset Type';
            DataClassification = CustomerContent;
        }
        field(60; "Supplier Code"; Code[20])
        {
            Caption = 'Supplier';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(70; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(80; "Monthly Depreciation Amount"; Decimal)
        {
            Caption = 'Monthly Depreciation Amount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec."Starting Date" = 0D then
            Rec."Starting Date" := Today();
    end;
}
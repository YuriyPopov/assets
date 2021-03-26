table 99910 "Asset Setup"
{
    Caption = 'Asset Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(20; "Asset Nos."; Code[20])
        {
            Caption = 'Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
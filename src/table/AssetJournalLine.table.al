table 99901 "Asset Journal Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(20; "Transaction Type"; Enum "Asset Jnl. Transaction Type")
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateAmount();
            end;
        }
        field(30; "Asset No."; Code[20])
        {
            Caption = 'Asset No.';
            DataClassification = CustomerContent;
            TableRelation = Asset;

            trigger OnValidate()
            var
                Asset: Record Asset;
                xAsset: Record Asset;
                xDescription: Text[100];
            begin
                if xAsset.Get(xRec."Asset No.") then
                    xDescription := xAsset.Description;

                if (Rec.Description = '') or (Description = xDescription) then
                    if Asset.Get("Asset No.") then
                        Rec.Description := Asset.Description;
            end;
        }
        field(40; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(50; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(60; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = CustomerContent;
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateAmount();
            end;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    local procedure ValidateAmount()
    var
        AmountGreaterZeroErr: Label 'For the %1 transaction type the Amount must be greater than 0.';
        AmountLessZeroErr: Label 'For the %1 transaction type the Amount must be less than 0.';
    begin
        if Rec."Transaction Type" = Enum::"Asset Jnl. Transaction Type"::"Beginning Balance" then
            if Rec.Amount < 0 then
                Error(AmountGreaterZeroErr, Enum::"Asset Jnl. Transaction Type"::"Beginning Balance");

        if Rec."Transaction Type" = Enum::"Asset Jnl. Transaction Type"::"Monthly Depreciation" then
            if Rec.Amount > 0 then
                Error(AmountLessZeroErr, Enum::"Asset Jnl. Transaction Type"::"Monthly Depreciation");
    end;

}
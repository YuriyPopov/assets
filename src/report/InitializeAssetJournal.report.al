report 99900 "Initialize Asset Journal"
{
    Caption = 'Initialize Asset Journal';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Asset; Asset)
        {
            trigger OnAfterGetRecord()
            var
                AssetJournalLine: Record "Asset Journal Line";
                AssetJournalLine2: Record "Asset Journal Line";
                LineNo: Integer;
            begin
                if AssetJournalLine.FindLast() then
                    LineNo := AssetJournalLine."Line No.";
                LineNo += 10000;

                AssetJournalLine2.Init();
                AssetJournalLine2."Line No." := LineNo;
                AssetJournalLine2.Validate("Transaction Type", Enum::"Asset Jnl. Transaction Type"::"Monthly Depreciation");
                AssetJournalLine2.Validate("Asset No.", Asset."No.");
                AssetJournalLine2."Posting Date" := Today();
                AssetJournalLine2."Transaction Date" := Today();
                AssetJournalLine2.Validate(Amount, Asset."Monthly Depreciation Amount");
                AssetJournalLine2.Insert(true);
            end;
        }
    }
}
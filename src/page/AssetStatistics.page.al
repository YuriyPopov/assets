page 99903 "Asset Statistics"
{
    Caption = 'Asset Statistics';
    PageType = CardPart;
    SourceTable = Asset;

    layout
    {
        area(Content)
        {
            field(AccumulatedDepreciation; Rec."Accumulated Depreciation")
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    AssetJournalLine: Record "Asset Journal Line";
                begin
                    AssetJournalLine.SetRange("Asset No.", Rec."No.");
                    AssetJournalLine.SetRange("Transaction Type", Enum::"Asset Jnl. Transaction Type"::"Monthly Depreciation");
                    Page.Run(Page::"Asset Journal", AssetJournalLine);
                end;

            }
            field(ResidualValue; Rec."Residual Value")
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    AssetJournalLine: Record "Asset Journal Line";
                begin
                    AssetJournalLine.SetRange("Asset No.", Rec."No.");
                    Page.Run(Page::"Asset Journal", AssetJournalLine);
                end;
            }
        }
    }
}
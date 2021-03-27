report 99901 "Asset and Detail List"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Asset and Detail List';
    RDLCLayout = '.\AssetandDetailList.rdlc';

    dataset
    {
        dataitem(Asset; Asset)
        {
            RequestFilterFields = "No.", "Location Code", "Asset Type";
            column(AssetNo; "No.")
            {
            }
            column(AssetDescription; Description)
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Asset_Type; "Asset Type")
            {
            }
            dataitem(AssetJournalLine; "Asset Journal Line")
            {
                DataItemLink = "Asset No." = field("No.");
                column(TransactionDate; "Transaction Date")
                {
                }
                column(Amount; Amount)
                {
                }
            }
        }
    }
}
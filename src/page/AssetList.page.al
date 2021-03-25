page 99901 "Asset List"
{
    ApplicationArea = All;
    AdditionalSearchTerms = 'assets';
    Caption = 'Asset List';
    CardPageId = "Asset Card";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = Asset;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = All;
                }
                field("Supplier Code"; Rec."Supplier Code")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Monthly Depreciation Amount"; Rec."Monthly Depreciation Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
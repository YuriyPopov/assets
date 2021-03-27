page 99900 "Asset Card"
{
    Caption = 'Asset Card';
    PageType = Card;
    SourceTable = Asset;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Location Name"; Rec."Location Name")
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
        area(FactBoxes)
        {
            part(AssetCardPart; "Asset Statistics")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."), "Date Filter" = field("Date Filter");
            }
        }
    }
}
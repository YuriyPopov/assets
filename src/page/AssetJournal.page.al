page 99902 "Asset Journal"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Asset Journal';
    DelayedInsert = true;
    PageType = Worksheet;
    UsageCategory = Tasks;
    SourceTable = "Asset Journal Line";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Asset No."; Rec."Asset No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(InitializeAssetJournal)
            {
                ApplicationArea = All;
                Caption = 'Initialize Asset Journal';
                RunObject = Report "Initialize Asset Journal";
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
            }
        }
    }
}
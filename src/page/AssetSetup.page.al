page 99910 "Asset Setup"
{
    ApplicationArea = All;
    Caption = 'Asset Setup';
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Asset Setup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Asset Nos."; Rec."Asset Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}
namespace MNB;

page 65401 "MNB Sales List"
{
    PageType = List;
    SourceTable = "MNB Sales Header Local";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the customer name.';
                }
                field("MNB Credit Checked"; Rec."MNB Credit Checked")
                {
                    ToolTip = 'Specifies if credit check is completed.';
                }
                field("MNB Approval Status"; Rec."MNB Approval Status")
                {
                    ToolTip = 'Specifies the approval status.';
                }
            }
        }
    }
}
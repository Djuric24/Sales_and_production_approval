namespace MNB;

page 65431 "MNB Sales Approval Log"
{
    PageType = List;
    SourceTable = "MNB Sales Approval Log";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the entry number.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field("Action"; Rec."Action")
                {
                    ToolTip = 'Specifies the action.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the user id.';
                }
                field("Date Time"; Rec."Date Time")
                {
                    ToolTip = 'Specifies the data time.';
                }
            }
        }
    }
}
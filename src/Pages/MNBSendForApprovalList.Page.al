namespace MNB;

page 65410 "MNB Send For Approval List"
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
                field("MNB Approval Status"; Rec."MNB Approval Status")
                {
                    ToolTip = 'Specifies the approval status.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendForApproval)
            {
                Caption = 'Send for Approval';
                ToolTip = 'Send document for approval';
                Image = SendMail;

                trigger OnAction()
                var
                    Approval: Codeunit "MNB Sales Approval";
                begin
                    Approval.SendForApproval(Rec);
                end;
            }

            action(Approve)
            {
                Caption = 'Approve';
                ToolTip = 'Approve document';
                Image = Approve;

                trigger OnAction()
                var
                    Approval: Codeunit "MNB Sales Approval";
                begin
                    Approval.Approve(Rec);
                end;
            }

            action(Reject)
            {
                Caption = 'Reject';
                ToolTip = 'Reject document';
                Image = Cancel;

                trigger OnAction()
                var
                    Approval: Codeunit "MNB Sales Approval";
                begin
                    Approval.Reject(Rec);
                end;
            }
        }
    }
}
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

                field("MNB Customer No."; Rec."MNB Customer No.")
                {
                    ToolTip = 'Specifies the customer number.';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the customer name.';
                }

                field("Amount"; Rec."Amount")
                {
                    ToolTip = 'Specifies the amount.';
                }

                field("MNB Credit Checked"; Rec."MNB Credit Checked")
                {
                    ToolTip = 'Specifies if credit check is done.';
                    Editable = false;
                }

                field("MNB Credit Exceeded"; Rec."MNB Credit Exceeded")
                {
                    ToolTip = 'Indicates if credit limit is exceeded.';
                    Editable = false;
                }

                field("MNB Approval Status"; Rec."MNB Approval Status")
                {
                    ToolTip = 'Specifies the approval status.';
                    Editable = false;
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
                Image = SendMail;
                ToolTip = 'Send document for approval';

                Enabled = Rec."MNB Approval Status" = Enum::"MNB Sales Approval Status"::Open;

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
                Image = Approve;
                ToolTip = 'Approve document';

                Enabled = Rec."MNB Approval Status" = Enum::"MNB Sales Approval Status"::"Pending Approval";

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
                Image = Cancel;
                ToolTip = 'Reject document';

                Enabled = Rec."MNB Approval Status" = Enum::"MNB Sales Approval Status"::"Pending Approval";

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
namespace MNB;

enum 65403 "MNB Sales Approval Status"
{
    Caption = 'Sales Approval Status';

    value(0; Open)
    {
        Caption = 'Open';
    }

    value(1; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }

    value(2; Approved)
    {
        Caption = 'Approved';
    }

    value(3; Rejected)
    {
        Caption = 'Rejected';
    }
}
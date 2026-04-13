namespace MNB;

table 65403 "MNB Sales Approval Log"
{
    Caption = 'MNB Sales Approval Log';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(3; "Action"; Enum "MNB Sales Approval Status")
        {
            Caption = 'Action';
        }

        field(4; "User ID"; Text[50])
        {
            Caption = 'User ID';
        }

        field(5; "Date Time"; DateTime)
        {
            Caption = 'Date Time';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
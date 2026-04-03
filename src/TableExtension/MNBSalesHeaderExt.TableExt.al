namespace MNB;

tableextension 65402 "MNB Sales Header Ext" extends "MNB Sales Header Local"
{
    fields
    {
        field(50100; "MNB Credit Checked"; Boolean)
        {
            Caption = 'Credit Checked';
            Editable = true; // može korisnik da menja
        }

        field(65401; "MNB Approval Status"; Enum MNB."MNB Sales Approval Status")
        {
            Caption = 'Approval Status';
            Editable = false; // menja se kroz logiku Codeunit
        }
    }
}
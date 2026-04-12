namespace MNB;

codeunit 65405 "MNB Sales Approval"
{
    procedure SendForApproval(var SalesHeader: Record "MNB Sales Header Local")
    var
        Customer: Record "MNB Customer";
    begin

        if SalesHeader."MNB Approval Status" <> Enum::"MNB Sales Approval Status"::Open then
            Error('Only Open documents can be sent.');


        if SalesHeader."MNB Customer No." = '' then
            Error('Customer must be selected.');

        if not Customer.Get(SalesHeader."MNB Customer No.") then
            Error('Customer %1 does not exist.', SalesHeader."MNB Customer No.");


        if SalesHeader.Amount <= 0 then
            Error('Amount must be greater than 0.');


        SalesHeader."MNB Credit Checked" := true;

        if (Customer.Balance + SalesHeader.Amount) > Customer."Credit Limit" then begin

            SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::"Pending Approval";
            SalesHeader.Modify();

            Message(
                'Credit limit exceeded for customer %1. Document sent for approval.',
                Customer.Name
            );

            exit;
        end;


        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::"Pending Approval";
        SalesHeader.Modify();
    end;


    procedure Approve(var SalesHeader: Record "MNB Sales Header Local")
    begin

        if UserId <> 'ADMIN' then
            Error('Only ADMIN can approve.');


        if SalesHeader."MNB Approval Status" <> Enum::"MNB Sales Approval Status"::"Pending Approval" then
            Error('Only pending documents can be approved.');

        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::Approved;
        SalesHeader.Modify();
    end;


    procedure Reject(var SalesHeader: Record "MNB Sales Header Local")
    begin

        if UserId <> 'ADMIN' then
            Error('Only ADMIN can reject.');


        if SalesHeader."MNB Approval Status" <> Enum::"MNB Sales Approval Status"::"Pending Approval" then
            Error('Only pending documents can be rejected.');

        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::Rejected;
        SalesHeader.Modify();
    end;
}
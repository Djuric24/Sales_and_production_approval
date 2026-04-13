namespace MNB;

codeunit 65405 "MNB Sales Approval"
{
    procedure SendForApproval(var SalesHeader: Record "MNB Sales Header Local")
    var
        Customer: Record "MNB Customer";
        Log: Record "MNB Sales Approval Log";
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

        if (Customer.Balance + SalesHeader.Amount) > Customer."Credit Limit" then
            SalesHeader."MNB Credit Exceeded" := true
        else
            SalesHeader."MNB Credit Exceeded" := false;

        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::"Pending Approval";
        SalesHeader.Modify();

        Clear(Log);
        Log.Init();
        Log."Document No." := SalesHeader."Document No.";
        Log."Action" := Enum::"MNB Sales Approval Status"::"Pending Approval";
        Log."User ID" := CopyStr(UserId, 1, 50);
        Log."Date Time" := CurrentDateTime;
        Log.Insert();

        if SalesHeader."MNB Credit Exceeded" then
            Message('Credit limit exceeded. Sent for approval.');
    end;


    procedure Approve(var SalesHeader: Record "MNB Sales Header Local")
    var
        Log: Record "MNB Sales Approval Log";
    begin
        if UserId <> 'ADMIN' then
            Error('Only ADMIN can approve.');

        if SalesHeader."MNB Approval Status" <> Enum::"MNB Sales Approval Status"::"Pending Approval" then
            Error('Only pending documents can be approved.');

        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::Approved;
        SalesHeader.Modify();

        Clear(Log);
        Log.Init();
        Log."Document No." := SalesHeader."Document No.";
        Log."Action" := Enum::"MNB Sales Approval Status"::Approved;
        Log."User ID" := CopyStr(UserId, 1, 50);
        Log."Date Time" := CurrentDateTime;
        Log.Insert();
    end;


    procedure Reject(var SalesHeader: Record "MNB Sales Header Local")
    var
        Log: Record "MNB Sales Approval Log";
    begin
        if UserId <> 'ADMIN' then
            Error('Only ADMIN can reject.');

        if SalesHeader."MNB Approval Status" <> Enum::"MNB Sales Approval Status"::"Pending Approval" then
            Error('Only pending documents can be rejected.');

        SalesHeader."MNB Approval Status" := Enum::"MNB Sales Approval Status"::Rejected;
        SalesHeader.Modify();

        Clear(Log);
        Log.Init();
        Log."Document No." := SalesHeader."Document No.";
        Log."Action" := Enum::"MNB Sales Approval Status"::Rejected;
        Log."User ID" := CopyStr(UserId, 1, 50);
        Log."Date Time" := CurrentDateTime;
        Log.Insert();
    end;
}
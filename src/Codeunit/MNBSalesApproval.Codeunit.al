namespace MNB;

codeunit 65405 "MNB Sales Approval"
{
    SingleInstance = true;

    procedure SendForApproval(var SalesHeader: Record "MNB Sales Header Local")
    begin
        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::"Pending Approval";
        SalesHeader.Modify();
    end;

    procedure Approve(var SalesHeader: Record "MNB Sales Header Local")
    begin
        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::Approved;
        SalesHeader.Modify();
    end;

    procedure Reject(var SalesHeader: Record "MNB Sales Header Local")
    begin
        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::Rejected;
        SalesHeader.Modify();
    end;
}
namespace MNB;

permissionset 65407 "SalesManagerPerm"
{
    Assignable = true;

    Permissions =
        tabledata "MNB Sales Header Local" = RIMD,
        tabledata "MNB Customer" = R,
        tabledata "MNB Sales Approval Log" = RIMD;
}
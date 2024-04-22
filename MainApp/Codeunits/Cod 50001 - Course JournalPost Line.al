codeunit 50001 "Course Journal-Post Line"
{
    Permissions = TableData "Course Ledger Entry" = rimd;
    TableNo = "Course Journal Line";

    trigger OnRun()
    begin
        RunWithCheck(Rec);
    end;

    var
        CourseJournalLineGlobal: Record "Course Journal Line";
        CourseLedgerEntry: Record "Course Ledger Entry";
        NextEntryNo: Integer;

    procedure RunWithCheck(var CourseJournalLine2: Record "Course Journal Line")
    begin
        CourseJournalLineGlobal.Copy(CourseJournalLine2);
        Code();
        CourseJournalLine2 := CourseJournalLineGlobal;
    end;

    local procedure "Code"()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforePostCourseJnlLine(CourseJournalLineGlobal, IsHandled);
        if not IsHandled then
            if CourseJournalLineGlobal.EmptyLine() then
                exit;

        if NextEntryNo = 0 then begin
            CourseLedgerEntry.LockTable();
            NextEntryNo := CourseLedgerEntry.GetLastEntryNo() + 1;
        end;

        CourseLedgerEntry.Init(); //inicaliza variable
        CourseLedgerEntry.CopyFromCourseJnlLine(CourseJournalLineGlobal); //copia los datos q vengan de diario

        CourseLedgerEntry."Total Price" := Round(CourseLedgerEntry."Total Price");
        CourseLedgerEntry."Entry No." := NextEntryNo;

        OnBeforeCourseLedgEntryInsert(CourseLedgerEntry, CourseJournalLineGlobal);

        CourseLedgerEntry.Insert(true);

        NextEntryNo := NextEntryNo + 1;

        OnAfterPostCourseJnlLine(CourseJournalLineGlobal, CourseLedgerEntry);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostCourseJnlLine(var CourseJournalLine: Record "Course Journal Line"; var CourseLedgEntry: Record "Course Ledger Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostCourseJnlLine(var CourseJournalLine: Record "Course Journal Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCourseLedgEntryInsert(var CourseLedgerEntry: Record "Course Ledger Entry"; CourseJournalLine: Record "Course Journal Line")
    begin
    end;

}


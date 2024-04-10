codeunit 50000 "Course Sales Management"
{

    //usar el comando F1 > find event > indicar el evento a usar (si no sbes cual usar, mirar en codigo fuente), y crea la estructura
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignFieldsForNo', '', false, false)]
    local procedure "Sales Line_OnAfterAssignFieldsForNo"(var SalesLine: Record "Sales Line"; var xSalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
        CopyFromCourse(SalesLine, SalesHeader);
    end;

    local procedure CopyFromCourse(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header") //Copiado de tabla salesline codigo madre, metodo CopyFromResource, modificar añadir variables de ese code madre
    var
        //IsHandled: Boolean;
        Course: Record Course; //Cambiamos Resource a Course
    begin
        Course.Get(SalesLine."No.");
        //Course.CheckResourcePrivacyBlocked(false); borramos porque da ajuses de privacidad y no los necesitamos para los cursos
        /* OnCopyFromResourceOnBeforeTestBlocked(Course, IsHandled, SalesLine);
        if not IsHandled then
            Course.TestField(Blocked, false); lanza un evento de privacidad y bloqueo, borramos*/
        Course.TestField("Gen. Prod. Posting Group");
        SalesLine.Description := Course.Name;
        //SalesLine."Description 2" := Course."Name 2"; //Eliminamos estos campos comentados ya que no tenemos estos campos
        //SalesLine."Unit of Measure Code" := Course."Base Unit of Measure";
        //SalesLine."Unit Cost (LCY)" := Course."Unit Cost";
        SalesLine."Gen. Prod. Posting Group" := Course."Gen. Prod. Posting Group";
        SalesLine."VAT Prod. Posting Group" := Course."VAT Prod. Posting Group";
        //SalesLine."Tax Group Code" := Course."Tax Group Code";
        SalesLine."Allow Item Charge Assignment" := false; //funcionaldad de BC de cargo de producto
        SalesLine."Unit Price" := Course.Price;
        //SalesLine.OnCopyFromResourceOnBeforeApplyResUnitCost(Rec, Course, SalesHeader);
        //ApplyResUnitCost(FieldNo(SalesLine."No."));
        //InitDeferralCode();
        OnAfterAssignCourseValues(SalesLine, Course, SalesHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAssignCourseValues(var SalesLine: Record "Sales Line"; Course: Record Course; SalesHeader: Record "Sales Header")
    begin
    end;


    //Evento para añadir "Cursos" a el Enum de pedido de venta, para añadirlo el Enum y poder crear pedidos de Cursos.
    [EventSubscriber(ObjectType::Table, Database::"Option Lookup Buffer", 'OnBeforeIncludeOption', '', false, false)]
    local procedure "Option Lookup Buffer_OnBeforeIncludeOption"(OptionLookupBuffer: Record "Option Lookup Buffer" temporary; LookupType: Option; Option: Integer; var Handled: Boolean; var Result: Boolean; RecRef: RecordRef)
    begin
        if Option <> "Sales Line Type"::Course.AsInteger() then // decimos que queremos acceder al numero (As.Integer) y no al nombre
            exit;
        Result := true;
        Handled := true;
    end;

}
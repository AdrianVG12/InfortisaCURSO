report 50100 ReportCourseSales
{
    Caption = 'Course Sales', comment = 'ESP="Report Ventas de Cursos"';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName; //indica como se tiene que imprimir
    ProcessingOnly = true; // idnica el rpoceso, si imprimirlo y mostrarlo (false), o que sea un poceso de datos que no se muestre (true)

    dataset //conjunto de datos
    {
        dataitem(TablaCourse; Course) // dataitem ls talbas a usar en el report y column los campos //las columnas se usan si se va a imprimir
        {
            RequestFilterFields = "No.", "Duration (hours)", Type; //filtros de los campos indicados para que el ususario filtre por estos directamtne
            dataitem("Course Edition"; "Course Edition")
            {

                DataItemLink = "Course No." = field("No."); //El encalce entre los 2 data tiems es que el campo CourseNo, tiene que ser igual que el campo No. del data item principal
                DataItemTableView = sorting("Course No.", Edition);   //lo que hya aqui, no se muestra a el uauario 
                trigger OnAfterGetRecord()
                begin
                    Counter += 1;
                end;
            }
            trigger OnAfterGetRecord()

            begin
                Counter += 1;

            end;
        }

    }

    requestpage //lo primero que se ejecuta, se defina la pagina que se le muestra al ususrio previa a la ejecucion del report
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options', comment = 'ESP="Opciones"';
                    field(NameSuma; 2 + 2)
                    {
                        Caption = 'OptionSuma', comment = 'ESP="Opcion suma"';
                        ApplicationArea = All;
                    }
                    field(NameResta; AnOption)
                    {
                        Caption = 'OptionBool', comment = 'ESP="Opcion bool"';
                        ApplicationArea = All;
                    }
                    field(NameTest; AText)
                    {
                        Caption = 'OptionText', comment = 'ESP="Opcion Texto"';
                        ApplicationArea = All;
                    }
                }
            }

        }

        trigger OnOpenPage()
        var

        begin
            AText := 'Ejemplitoooo';
        end;
    }
    /* rendering // despues de definir los datos(dataset) y la pagina (requestpage) ,como pintar el objeto
        {
            layout(LayoutName)
            {
                Type = Excel;
                LayoutFile = 'mySpreadsheet.xlsx';
            }
        } */
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('Hay %1 interacciones', Counter); //el 1% se sustituye por Counter, si huebese un 2% se cambiaria por el segundo parametro a pasar
    end;

    var
        AnOption: Boolean;
        AText: Text;
        Counter: Integer;
}
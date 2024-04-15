codeunit 50141 "Library - courses"
{

    procedure CreateCourse() Course: Record Course;
    var
    //LibraryUtility: Codeunit "Library - Utility" //Librerias no instaladas por problemas con Dockers, mirar en un futuro.

    begin
        Course.Insert(true); //inicia el registro para una tabla
        Course.Validate(Name, 'Nombre de curso');
        Course.Validate(Price, 999);
        Course.Modify(true); //Insterta el registro en una tabla

        //NO PUEDO REALIZAR LA FUNCIONALDIAD DE TEST POR FALTA DE LIBRERIAS, REVISAR EN UN FUTURO
    end;


    procedure CreateCourseEdition(CourseNo: Code[20]) CourseEdition: Record "Course Edition"
    var

    begin
        CourseEdition."Course No." := CourseNo;
    end;
}
define(["jquery", "tableexport"], function ($, TableExport) {

    // DOM ready
    $(function () {

        // Initialize TableExport using jQuery.
     //  $('#studentDetails').tableExport();
      // $('#studentsemester').tableExport();

        // Initialize TableExport using vanilla JS.
    	
       var $selector = $("#eligibles");
       new TableExport($selector, {formats: ["xlsx", "xls"]});
       var $selector1=$("#studentDetails");
       new TableExport($selector1,{formats: ["xlsx", "xls"]});
       var $selector2=$("#studentsemester");
       new TableExport($selector2,{formats: ["xlsx"]});
       var $selector3 = $("#customized");
       new TableExport($selector3, {formats: ["xlsx", "xls"]});
      
    });

});

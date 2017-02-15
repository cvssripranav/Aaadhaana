<!DOCTYPE>
<html>
<head>
<title>CRUD operations using jTable in J2EE</title>
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).on("click", "#genmesa", function() {  // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
    $.get("MesaNombres", function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
    	var $select = $("#mesa");                           // Locate HTML DOM element with ID "someselect".
        $select.find("option").remove();                          // Find all child elements with tag name "option" and remove them (just to prevent duplicate options when button is pressed again).
        $.each(responseJson, function(index, item) {               // Iterate over the JSON object.
         $("<option>").val(item).text(item).appendTo($select); // Create HTML <option> element, set its value with currently iterated key and its text content with currently iterated item and finally append it to the <select>.
        });
    });
});

	$(document).ready(function() {
		$('#StudentTableContainer').jtable({
			title : 'Students List',
			actions : {
				listAction : 'MarksJTableController?action=markslist',
				createAction : 'MarksJTableController?action=markscreate',
				updateAction : 'MarksJTableController?action=marksupdate',
				deleteAction : 'MarksJTableController?action=marksdelete'
			},
			fields : {
				mroll : {
					title : 'Roll',
					width : '25%',
					key : true,
					list : true,
					edit : false,
					create : true
				},
				mscode : {
					title : 'Sub Code',
					width : '25%',
					edit : true
				},
				mmarks : {
					title : 'Marks',
					width : '25%',
					edit : true
				},
				mpof : {
					title : 'Pass/ Fail',
					width : '25%',
					edit : true
				}
			}
		});
		$('#StudentTableContainer').jtable('load');
	});
</script>

</head>
<body>
<div style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;">

		<h4>AJAX based CRUD operations using jTable in J2ee</h4>
		<div id="StudentTableContainer"></div>
	</div>
</body>
</html>
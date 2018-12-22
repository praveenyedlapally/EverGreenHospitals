/**
 * 
 */
   $(document).ready(function () {
        $("#location_id").on("change", function () {
            var location_id = $("#location_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "department.jsp",//your jsp page name
                    data: {location_id: location_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#dept_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
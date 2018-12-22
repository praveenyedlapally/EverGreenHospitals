/**
 * 
 */
    $(document).ready(function () {
        $("#state").on("change", function () {
            var state_name = $("#state").val();
                $("#error").html("");
                $.ajax({
                    url: 'CityNameRetrieval',
                    method: "POST",
                    data: {state_name: state_name},
                    success: function (data)
                    {
                        $("#city_name").html(data);//response sending to city.jsp page 
                    }
                });
        });
    });

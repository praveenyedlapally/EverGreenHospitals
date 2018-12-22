/**
 * 
 */
    $(document).ready(function () {
        $("#dept").on("change", function () {
            var dept_name = $("#dept").val();
                $("#error").html("");
                $.ajax({
                    url: "doctor.jsp",
                    method: "POST",
                    data: {dept_name: dept_name},
                    success: function (data)
                    {
                        $("#doctor_id").html(data);
                    }
                });
        });
    });
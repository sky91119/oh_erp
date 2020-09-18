<script>
    $(function () {
        let container = $('#pagination');
        container.pagination({
            dataSource: [
                {name: "hello1"},
                {name: "hello2"},
                {name: "hello3"},
                {name: "hello4"},
                {name: "hello5"},
                {name: "hello6"},
                {name: "hello7"},
                {name: "hello8"},
                {name: "hello9"},
                {name: "hello10"},
                {name: "hello11"},
                {name: "hello12"},
                {name: "hello13"},
                {name: "hello14"},
                {name: "hello15"},
                {name: "hello16"},
                {name: "hello17"},
            ],
            callback: function (data, pagination) {
                var dataHtml = '<ul>';

                $.each(data, function (index, item) {
                    dataHtml += '<li>' + item.name + '</li>';
                });

                dataHtml += '</ul>';

                $("#data-container").html(dataHtml);
            }
        })
    })
</script>
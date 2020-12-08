// Show searched data from returned

var textbox = document.getElementById("searchid");
textbox.addEventListener("keypress", function onEvent(event) {
    if (event.key === "Enter") {


        // when search key pressed find data and append it to the results table
        var data = $('.search').val();
        window.location.href="/search/law/"+data;
    }
    document.getElementById('divtable').style.display = 'none';
    $(".divseach").show();
 });

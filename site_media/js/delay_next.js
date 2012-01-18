function hide_next () {
    jQuery('div.content-nav a#next').hide();
}

function show_next() {
    jQuery('div.content-nav a#next').fadeIn();
}

function hide_then_show_next() {
    if ($('#user_name_span')[0].innerHTML == "P9999999") {
        return;
    }
    hide_next();
    setTimeout (show_next, 2000);
}

jQuery (hide_then_show_next);

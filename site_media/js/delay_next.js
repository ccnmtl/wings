function hide_next () {
    jQuery('div.content-nav a#next').hide();
}

function show_next() {
    jQuery('div.content-nav a#next').show();
}

function hide_then_show_next() {
    hide_next();
    setTimeout (show_next, 10000);
}

jQuery (hide_then_show_next);

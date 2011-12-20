function hide_next () {
    jQuery('div.content-nav a#next').hide();
}

function show_next() {
    jQuery('div.content-nav a#next').show();
}

function hide_then_show_next() {
    hide_next();
//    setTimeout (show_next, 5000);
// just while we develop the tests.
    setTimeout (show_next, 10);

}

jQuery (hide_then_show_next);

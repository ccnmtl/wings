function hide_next () {
    jQuery('div.content-nav a#next').hide();
}

function show_next() {
    jQuery('div.content-nav a#next').show();
}

function hide_then_show_next() {
    hide_next();
    if (1 == 1) {
    setTimeout (show_next, 2000);
    } else {
    // just while we develop the tests.
      setTimeout (show_next, 2);
    }
}

jQuery (hide_then_show_next);

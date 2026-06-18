// ==============================
// PERFORMANCE TABLE HIGHLIGHTING
// ==============================

$(function () {
    $('table.PerfTable tbody')
    .each(function () {
        var $this = $(this);
        $this
            .css('cursor', 'pointer')
            .data('isOffset', false)
            .mousedown(function (e) {  // using mousedown vs. click due to errors on dragging
                // we only need the body, not the header or footer
                var $tbody = $(this);
                // make sure we select the cell, not it's content
                var $clickedCell = $(e.target).is('td') ? $(e.target) : $(e.target).parents('td');
                // if this cell has a class of 'clickedCell', it's already highlighted
                var resetting = $clickedCell.hasClass('clickedCell');
                // if the body has 'isHighlighted' class, we need to clear the highlights first
                if ($tbody.hasClass('isHighlighted')) {
                    $tbody.find('.isHighlighted').andSelf().removeClass('isHighlighted');
                    $tbody.find('.clickedCell').removeClass('clickedCell');
                }

                if (!resetting) {
                    // highlight them all 
                    $tbody
                        .find('td')
                        .filter(function () {
                            return this.cellIndex + $(this).data('offset') == $clickedCell.data('offset') + $clickedCell[0].cellIndex; // the apparent position of this cell
                        })
                        .add($clickedCell.addClass('clickedCell').parent('tr'))
                        .add($tbody)
                        .addClass('isHighlighted')
                    ;
                }
            })
        ;
        OffsetCells($this);
    })
    ;
});

function GetInternetExplorerVersion()
    // Returns the version of Internet Explorer or a -1
    // (indicating the use of another browser).
{
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer')
    {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);
    }
    return rv;
}




function OffsetCells($tbody) {

    // set offset for all cells to zero
    var $allRows = $tbody.find('tr');
    var $allCells = $allRows.find('td');
    $allCells         // get all the cells
        .data('offset', 0)   // give them all an 'offset' value of zero
        .filter(function () {
            return (this.colSpan != 1 || this.rowSpan != 1); // narrow our selection to only those that span rows or cols
        })
        .each(function () {
            var $cell = $(this);
            var rowSpan = this.rowSpan;
            var colSpan = this.colSpan;
            var apparentIndex = parseInt(this.cellIndex) + $cell.data('offset');
            var startRowIndex = this.parentNode.sectionRowIndex;

            if (this.colSpan > 1) {
                var endRowIndex = startRowIndex + rowSpan;

                $allRows
                .slice(startRowIndex, endRowIndex)
                .find('td')
                .filter(function () {
                    return parseInt(this.cellIndex) + $(this).data('offset') > apparentIndex;
                })
                .each(function () {
                    var $this = $(this);
                    $this.data('offset', $this.data('offset') + colSpan - 1);
                })
                ;
            }
            if (this.rowSpan > 1) {
                startRowIndex++;
                var endRowIndex = this.parentNode.sectionRowIndex + rowSpan;

                $allRows
                .slice(startRowIndex, endRowIndex)
                .find('td')
                .filter(function () {
                    return parseInt(this.cellIndex) + $(this).data('offset') >= apparentIndex;
                }).each(function () {
                    var $this = $(this);
                    $this.data('offset', $this.data('offset') + 1);

                });
            }
        });

    $tbody.data('isOffset', true);
}

// ===================================== 
// STRING MANIPULATION UTILITY FUNCTIONS
// ===================================== 

String.prototype.format = function () {
    var p = /\{\d+\}/g;
    var a = arguments;
    return this.replace(p, function (capture) { return a[capture.match(/\d+/)]; });
}  // usage:  "Hello {0}!".format("world"); (or) var str = "Hello {0}!"; str.format("world");

String.format = function () {
    var p = /\{\d+\}/g;
    var a = Array.prototype.slice.call(arguments);
    var s = a.shift();
    return s.replace(p, function (capture) { return a[capture.match(/\d+/)]; });
}  // usage: String.format("{0} {1}!", "Hello", "world");

// Initializes a new instance of the StringBuilder class
// and appends the given value if supplied
StringBuilder = function (v) {
    this.s = new Array("");
    this.s[this.s.length] = v;
}

// Appends the given value to the end of this instance.
StringBuilder.prototype.append = function (v) {
    if (v) {
        this.s[this.s.length] = v;
    }
}

// Clears the string buffer
StringBuilder.prototype.clear = function () {
    this.s.length = 1;
}

// Converts this instance to a String.
StringBuilder.prototype.toString = function () {
    return this.s.join("");
}

// ===========================
// ELECTRONIC FLIGHT BAG (EFB)
// ===========================

function loadLinkByID(xmlFile) {
    try {//Internet Explorer
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    }
    catch (e) {
        try {//Firefox, Mozilla, Opera, etc.
            var xmlDoc = document.implementation.createDocument("", "", null);
        }
        catch (e) { alert(e.message) }
    }
    try {
        xmlDoc.validateOnParse = false;
        xmlDoc.async = false;
        xmlDoc.load(xmlFile);
        document.title = "content://" + xmlDoc.documentElement.childNodes(1).attributes.getNamedItem("id").value;
    }
    catch (e) { alert(e.message) }
}

// ===============================
// INTERACTIVE XML PUBLISHER (IXP)
// ===============================

function previewMode(isPreview) {
    var alertString = 'Links are disabled in the IXP preview window.';
    try {
        if (isPreview) {
            $('a').filter(function () {
                return $(this).find('img').length == 0;
            })
            .click(function () { alert(alertString); return false; })
			.attr({ title: alertString });
        }
    }
    catch (e)
    { alert('from utility.js file, previewMode():\n\n' + e.message); }
}

// =====================
// HEADER FRAME FUNCTION
// =====================

function writeHeaderFrame() {
    try {
        var headerFrame = window.top.frames['HeaderFrame'];
        var headerTable = document.getElementById('headerTable');
        if (headerFrame && headerTable) {
            headerFrame.document.body.style.backgroundColor = "Black";
            var headerTable = document.getElementById('headerTable');
            var headerFrameBody = headerFrame.document.documentElement.childNodes[1];
            headerFrameBody.innerHTML = headerTable.innerHTML;
        } else if (headerTable && $('div.BulletinMetaData, .TitlePage').length == 0) {
            // there is a headerTable, but no headerFrame (and it's not a bulletin or a title page)
            headerTable.style.display = 'inline';   // show the headerTable
        }
        revAndCocBars(false, false);
        // recalculate rev bars since everything gets moved down.
    } catch (e) { alert('from header.js, writeHeaderFrame():  ' + e.message); }
}

// =====================
// REVISION AND COC BARS
// =====================
function revAndCocBars(isEFBOutput, isIXPPreview) {

    if (!isIXPPreview) isIXPPreview = false;

    // these are used to detect changes in zoom level
    var heightElementRevs =
    $('<div style="position:absolute; left:-9999999px height:1em;">&#160;</div>')
        .prependTo('body')
        .get(0);
    heightElementRevs.currentHeight = heightElementRevs.offsetHeight;

    var heightElementCoCs =
    $('<div style="position:absolute; left:-9999999px height:1em;">&#160;</div>')
        .prependTo('body')
        .get(0);
    heightElementCoCs.currentHeight = heightElementCoCs.offsetHeight;


    insert(isEFBOutput);
    window.onresize = refresh;
    setInterval(
		function () {
		    if (heightElementRevs.currentHeight != heightElementRevs.offsetHeight) {
		        heightElementRevs.currentHeight = heightElementRevs.offsetHeight; refresh();
		    }
		    if (heightElementCoCs.currentHeight != heightElementCoCs.offsetHeight) {
		        heightElementCoCs.currentHeight = heightElementCoCs.offsetHeight; refresh();
		    }
		}, 500);

    function insert(isEFBOutput) {
        if (!(navigator.userAgent.match(/(iPad)|(iPhone)|(iPod)|(android)|(webOS)/i))) {
            var px = "px";
            var revHeader = "<p class='RevHeader'>Revision Details:</p><p class='RevContent'>";
            var revFooter = "</p><p class='RevFooter'>( click anywhere to hide )</p>";
            var isDayMode = document.styleSheets[0].href.match("ftidStyleDay");

            // set the foreground and background color for the rev bars
            var revBarColor = isDayMode ? "black" : "white";
            var bgColor = isDayMode ? 'white' : 'black';
            var revClass = isEFBOutput ? 'RevBarEFB' : 'RevBar';
            // select all the elements with RevMark class
            $revMarks = $('.RevMark')
            // change the class name to RevUnMarked to clear the old way of doing things
                        .removeClass('RevMark').addClass('RevUnMarked');

            // if there aren't any with class="RevMark", assume we've already done this once
            // and select all the elements of class="RevUnMarked" instead.
            if (!$revMarks.length) $revMarks = $('.RevUnMarked');
            $revMarks
            .each(function () {

                // the height of the element in pixels
                var thisHeight = this.offsetHeight + px;

                // the generic statement for when no rev info is given
                var noRevHighlight = 'No revision information specified.';

                // our new revbar
                $("<div class='" + revClass + "' />")


                // the toggle call is used to show/hide the revHighlight information
                // when the revBar is clicked.
                .toggle(
                    function () {
                        if (this.title != noRevHighlight) {
                            $(this).html(revHeader + this.title + revFooter)
                               .addClass('ShowHighlight')
                               .css({
                                   'background-color': '#FFFF99',
                                   'height': 'auto'
                               })
                        }
                    },
                    function () {
                        $(this).html('')
                               .removeClass('ShowHighlight')
                               .css({
                                   'background-color': revBarColor,
                                   'height': thisHeight
                               })
                    })
                .attr('title', this.title ? this.title : noRevHighlight)
                // if html object does not have children, an exception is thrown; replaced statements below
                // 'height': this.offsetHeight != 0 ? this.offsetHeight : this.children[0].offsetHeight,
                // 'top': this.offsetHeight != 0 ? offset(this) + px : offset(this.children[0]) + px,
                .css({
                    'background-color': revBarColor,
                    'left': '-.5em',
                    'height': this.offsetHeight != 0 ? this.offsetHeight : 15,
                    'top': this.offsetHeight != 0 ? offset(this) + px : offset(this) + px,
                    'cursor': this.title ? 'help' : 'auto'
                }).prependTo('body');
            });

            // Now do the COC bars
            $cocSpans = $('.coc')
                        .removeClass('coc').addClass('cocUnMarked');

            // if there aren't any with class="coc", assume we've already done this once
            // and select all the elements of class="cocUnMarked" instead.
            if (!$cocSpans.length) $cocSpans = $('.cocUnMarked');
            $cocSpans
            .each(function () {

                // the height of the element in pixels
                var thisHeight = this.offsetHeight + px;

                // our new coc bar
                $('<div class="cocBar" />')

                .css({
                    'left': (isEFBOutput && !isIXPPreview ? '.15em' : '-.85em'),
                    'height': this.offsetHeight,
                    'top': offset(this) + px,
                    'cursor': this.title ? 'help' : 'auto'
                }).prependTo('body');
            });


        }
    }

    function refresh() { $('.RevBar').remove(); $('.cocBar').remove(); insert(false); }

    function offset(obj) {

        // get the IE version number
        var IEVersion = -1; // GetInternetExplorerVersion();

        var top = 0;
        if (obj.offsetParent) {
            do {
                top += obj.offsetTop;
            } while (obj = obj.offsetParent);
        }

        if (document.all && (IEVersion < 0) && (!isEFBOutput || (isEFBOutput && isIXPPreview))) top -= 15;
        return top;
    }

}
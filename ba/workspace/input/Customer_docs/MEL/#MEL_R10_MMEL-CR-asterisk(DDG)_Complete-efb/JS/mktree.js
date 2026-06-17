/// <reference path="jquery.js"/>

$(document).ready(function() {
window.top.frames["DocFrame"].location = document.links[0].href;

    var plus = '<img class="plus" src="..\\js\\plus.gif"/>';
    var minus = '<img class="minus" src="..\\js\\minus.gif"/>';

    var $subLists = $('.mktree ul');
    $subLists.hide();

    var $expandableElements = $('.expands');
    var $expandAllButton = $('#expander');


    $expandableElements
      .click(function() {
          $(this).find('img').toggle().end()
                 .parent('li').children('ul').toggle();
      }).hover(function() { $(this).addClass('mouseOver'); },
			 function() { $(this).removeClass('mouseOver'); });

    $expandAllButton
      .toggle(function() {
          $subLists.show();
          $expandableElements
                    .find('.plus').hide().end()
	                .find('.minus').show();
          $expandAllButton.text('Collapse All').prepend(minus)
                    .find('.minus').show();
      }, function() {
          $subLists.hide();
          $expandableElements
                    .find('.minus').hide().end()
	                .find('.plus').show();
          $expandAllButton.text('Expand All').prepend(plus);
      })
      .hover(function() { $expandAllButton.toggleClass('mouseOver'); },
			 function() { $expandAllButton.toggleClass('mouseOver'); });
});
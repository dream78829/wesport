$(document).ready(function($) {
    

$("#new_record").progression({
  tooltipWidth: '200',
  tooltipPosition: 'left',
  tooltipOffset: '50',
  showProgressBar: true,
  showHelper: true,
  tooltipFontSize: '14',
  tooltipFontColor: 'fff',
  progressBarBackground: 'fff',
  progressBarColor: '6EA5E1',
  tooltipBackgroundColor:'a2cbfa',
  tooltipPadding: '10',
  tooltipAnimate: true
});

$("#new_record").submit(function(e) {
    e.preventDefault();
    $("#new_record").find('input[type="submit"]').val('✓ submitted');
});





});

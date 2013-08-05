$(document).ready(function(){
    $("tr.seller").click(function(){
        $("tr.detail-"+$(this).attr("pk")).toggle("fast");
    });
}); 

function toggle(source) {
  checkboxes = document.getElementsByName('pk_list[]');
  for (var i=0; i<checkboxes.length; i++) {
    checkboxes[i].checked = source.checked;
  }
}

function modalFunctions() {
  $('.modal-trigger').leanModal({
    opacity: .7
  });
  $(".button-collapse").sideNav();
  $('.cart').material_chip();
  $('.dropdown-button').dropdown();
}

$(document).on('turbolinks:load', modalFunctions)
$(document).ready(function(){
  Materialize.toast($toastContent, 5000, $toastClass);
});

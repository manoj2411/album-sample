function remove_element( _this) {
  $(_this.parentNode).find('.destroy').val("1");
  $( _this.parentElement).hide();
}
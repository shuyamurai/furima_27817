$(function(){
  $("#item_price").on('keyup', function(){
    var price = $("#item_price").val();
    if( 300 <= price && price <= 9999999) {
    var fee = Math.floor(price / 10);
    var profit = (price - fee);
    $("#add-tax-price").text(fee)
    $("#profit").text(profit);
    }else{
    $("#add-tax-price").text('');
    $("#profit").text('');
    }
  })
});
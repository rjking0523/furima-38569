window.addEventListener('load', function(){
  let itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    let taxPrice  = document.getElementById("add-tax-price");
    taxPrice.innerHTML = Math.floor(itemPrice.value * 0.10);
    let profit  = document.getElementById("profit");
    profit.innerHTML = itemPrice.value - Math.floor(itemPrice.value * 0.10);
  })
})
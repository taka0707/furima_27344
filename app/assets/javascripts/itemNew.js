window.addEventListener("load", function() {
  let price = document.querySelector("#price");
  
  price.addEventListener("keyup", function() {
    let PriceValue = document.querySelector("#price").value;
    let TaxPrice = document.querySelector("#add-tax-price");
    let profit = document.querySelector("#profit");
    if (PriceValue && !isNaN(PriceValue)) {
      TaxPrice.innerHTML = Math.floor(PriceValue * 0.1).toLocaleString();
      profit.innerHTML = Math.floor(PriceValue * 0.9).toLocaleString();
    } else {
      TaxPrice.innerHTML = ("半角数字のみ入力可能");
      profit.innerHTML = ("半角数字のみ入力可能");
    }
    
  });
});
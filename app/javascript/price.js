function tax () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    const itemTax = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.round(itemTax);
    const itemProfit = itemPrice.value - itemTax;
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.round(itemProfit);
  })
}

window.addEventListener('load', tax);
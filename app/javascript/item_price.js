window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.round(priceInput.value * 0.1);
  console.log(addTaxDom.innerHTML)
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
  console.log(addProfitDom.innerHTML)
  })
});
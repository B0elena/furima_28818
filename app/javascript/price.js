function price() {

  const itemprice = document.getElementById("item-price")
  const addtaxprice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  itemprice.addEventListener('input', function(){
    const values = itemprice.value
    addtaxprice.innerHTML = values * 0.1
    profit.innerHTML = values - addtaxprice.innerHTML
})
}
window.addEventListener('load', price)

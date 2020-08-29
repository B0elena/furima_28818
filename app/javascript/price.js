function price() {

  const itemprice = document.getElementById("item-price")
  const addtaxprice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemprice.addEventListener('input', function() {
    const values = itemprice.value
    valuess = values * 0.1
    addtaxprice.innerHTML = Math.round(valuess)
    profit.innerHTML = values - addtaxprice.innerHTML
  })
}

window.addEventListener('load', price)

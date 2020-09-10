window.addEventListener('load', function(){
  const inputprice = document.getElementById("item-price")
  const taxprice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  inputprice.addEventListener('input', function() {

    taxprice_value =  Math.floor(inputprice.value / 10)
    taxprice.innerHTML = taxprice_value

    profit_value =  Math.floor(inputprice.value / 10 * 9)
    profit.innerHTML = profit_value 
  })
})
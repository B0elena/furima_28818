function itemcoler() {

  const itemcoler = document.getElementById("i-coler")

  itemcoler.addEventListener('mouseover', function(){
    itemcoler.setAttribute("style", "color:#3ccace;")
  })

  itemcoler.addEventListener('mouseout', function(){
    itemcoler.removeAttribute("style", "color:#3ccace;")
  })
}
window.addEventListener('load', itemcoler)
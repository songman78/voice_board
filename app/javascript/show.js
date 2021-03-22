window.addEventListener('load', function(){
const go_show = document.getElementById("content")

go_show.addEventListener('mouseover', function(){
  console.log("over")
  this.setAttribute("style", "background-color: #C0C0C0;")
})

go_show.addEventListener('mouseout', function(){
  console.log("remove")
  this.removeAttribute("style", "background-color:#C0C0C0;")
})


  go_show.addEventListener('click', function() {
    console.log("ok")
  })


})
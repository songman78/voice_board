
  window.addEventListener('load', function(){
    
    const solution = document.getElementById("list-solution")
    const unsolved = document.getElementById("list-unsolved")
    const list= document.querySelectorAll(".list")
    const currentList = document.getElementById("current-list")
    
    solution.addEventListener('mouseover', function(){
      console.log("over")
      this.setAttribute("style", "background-color:#FFBEDA;")
    })
    solution.addEventListener('mouseout', function(){
      console.log("remove")
      this.removeAttribute("style", "background-color:#FFBEDA;")
    })

    unsolved.addEventListener('mouseover', function(){
      console.log("over")
      this.setAttribute("style", "background-color:#FFBEDA;")
    })
    unsolved.addEventListener('mouseout', function(){
      console.log("remove")
      this.removeAttribute("style", "background-color:#FFBEDA;")
    })

    // コースの値を取得し表示する
    list.forEach(function(list) {
      list.addEventListener('click', function() {
        value = list.innerHTML
        console.log(list.id)
      if (list.id == "list-solution") {
        currentList.innerHTML = "解決済"
      } else {
        currentList.innerHTML = "未解決"
      }
      })
    })
  })



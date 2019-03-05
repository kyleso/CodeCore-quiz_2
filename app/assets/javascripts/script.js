document.addEventListener("DOMContentLoaded", event => {
  const togglePlusMinus = document.querySelectorAll(".fa");
  const description = document.querySelectorAll(".lead")
  
  for (let i = 0; i < togglePlusMinus.length; i++) {
    togglePlusMinus[i].addEventListener('click', (event) => {
      if (description[i].style.display === "none") {
        description[i].style.display = "block";
      } else {
        description[i].style.display = "none";
      }
      if (togglePlusMinus[i].className === "fa fa-minus") {
        togglePlusMinus[i].className = "fa fa-plus";
      } else {
        togglePlusMinus[i].className = "fa fa-minus"
      }
    })
  }
});

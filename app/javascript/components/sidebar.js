const updateSidebar = () => {
  event.preventDefault();
  const dropdown = document.querySelector('.toggle-down');
  const submenu = document.querySelector('.sub-menu');
  const icon = document.querySelector('.fa-caret-down');
  if (dropdown){
  dropdown.addEventListener('click', function () {
      if(submenu.style.display === ""){
      submenu.style.display = "block";
      icon.classList.add("upward");
   } else {
      submenu.style.display = "";
      icon.classList.remove("upward");
   }
    });
  }
  }

export { updateSidebar };

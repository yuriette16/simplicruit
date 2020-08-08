const getCurrentDate = () => {
  var today = new Date().toDateString();
  const date = document.getElementById('dtText')
  if (date) {
  date.innerHTML=today;
  }
}


export { getCurrentDate };

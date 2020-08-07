const getCurrentDate = () => {
  var today = new Date().toDateString();
  document.getElementById('dtText').innerHTML=today;

}


export { getCurrentDate };

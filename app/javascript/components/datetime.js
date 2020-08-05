const getCurrentDate = () => {
  var today = new Date().toDateString();
  // document.getElementById('dtText').innerHTML=today;
  document.getElementById('dtText').textContent += today;
}


export { getCurrentDate };

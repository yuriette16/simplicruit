const fullPage = () => {
  const fullPage = document.getElementById('fullpage');
  if(fullPage){
    var myFullpage = new fullpage('#fullpage', {
      autoScrolling:false,
      navigation:true,
      scrollingSpeed: 2000

  });
  }
}

export { fullPage };
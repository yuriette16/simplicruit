let myFullpage = null;
const fullPage = () => {
  if (myFullpage){
    fullpage_api.destroy('all');
  }
  const fullPage = document.getElementById('fullpage');
  if(fullPage){
    myFullpage = fullpage('#fullpage', {
    autoScrolling:false,
    navigation:true,
    scrollingSpeed:9000,
  });

  }
}

export { fullPage };

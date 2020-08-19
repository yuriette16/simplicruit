const tweenMax = () => {
  const fullPage = document.getElementById('fullpage');
  if(fullPage){
 TweenMax.to('#screening', 0.5, { left: 200 });
  }
}

export { tweenMax };



const scoreCalculator = (Rails) => {
  const els = document.querySelectorAll('.range-slider__range');
  console.log('test111',els);
  els.forEach(el => {
    el.addEventListener('change', (event) =>{
      console.log('test222',el);
      // const form = document.querySelectorAll('.skill-form');
      // console.log('3',form);
      // Rails.fire(form,'submit')
    });
  });
}
export { scoreCalculator };

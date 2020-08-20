var rangeSlider = function(){
  var slider = $('.range-slider'),
      range = $('.range-slider__range'),
      value = $('.range-slider__value');
  if (slider && range && value){
  slider.each(function(){

    value.each(function(){
      var value = $(this).prev().attr('value')*10;
      $(this).html(value);
    });

    range.on('input', function(){
      $(this).next(value).html(this.value*10);
    });
  });
  }
};

export { rangeSlider };


// const slider = () => {
//   const slider = document.getElementById("slider");
//   const output = document.getElementById("number");
//   if (slider && output){
//     output.innerHTML = slider.value * 10; // Display the default slider value
//     // Update the current slider value (each time you drag the slider handle)
//     slider.oninput = function() {
//       output.innerHTML = this.value * 10;
//     }
//   }
// }


// const score = () => {
//   const calulate = (score) => {
//     const passingScore = document.getElementByid("passing_score");
//      finalScore == 0
//      finalScore += score.value * 10;
//     passingScore.innerHTML = finalScore;
//   }

//   const scores = document.querySelectorAll("slider");
//     scores.forEach(calulate)
// }

// export { score };

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { displayApplication, displayEditQuestion, changeQuestionMode } from '../components/buttons';
import { updateSidebar} from '../components/sidebar';
import { getCurrentDate } from '../components/datetime';
import { initSelect2 } from '../components/init_select2';
import { saveQuestionnaire } from '../components/form';
import { GetPosition } from '../components/selectposition';
import { GetPositionEdit } from '../components/selectposition';
import { fullPage } from '../components/fullpage';
import { dateTimePicker } from '../components/datetimepicker';
import { rangeSlider } from '../components/slider';
import { initSweetalert } from '../plugins/init_sweetalert';
// import { scoreIndicator } from '../components/score_indicator';


// import { updateButton } from '../components/switch';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  displayApplication();
  displayEditQuestion();
  changeQuestionMode();
  saveQuestionnaire();
  initSelect2();
  getCurrentDate();
  updateSidebar();
  GetPosition();
  GetPositionEdit();
  dateTimePicker();
  rangeSlider();
  // scoreIndicator();
  fullPage();

  // updateButton();
});

import "controllers"

var testVar = "TestVariable";
initSweetalert('#sweet-alert', {
  title: "Passing Score is Updating",
  text: "We will redirect you to the page soon.",
  icon: "success",
  timer: 3000,
  button: false
});



const dateTimePicker = () => {
  const el = document.getElementById('datetimepicker');
  if (el) {
    flatpickr(el, {
      altInput:        true,
      minDate:         "today",
      minuteIncrement: 1
    });
  }

}
export { dateTimePicker };

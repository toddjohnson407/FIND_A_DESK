import "bootstrap";
import flatpickr from 'flatpickr';

const startDateinput = document.getElementById('desk_check_in');
const endDateinput = document.getElementById('desk_check_out');

if (startDateinput && endDateinput) {
  flatpickr(startDateinput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',

    onChange: function(_, selectedDate) {
    if (selectedDate === '') {
      return endDateinput.disabled = true;
    }
    endDateCalendar.set('minDate', selectedDate);
    endDateinput.disabled = false;
  }
});
  const endDateCalendar =
    flatpickr(endDateinput, {
      dateFormat: 'd-m-Y',
    });
}

import './application.css';
// import flatpickr from 'flatpickr';
console.log("working");
import initDatePicker from '../components/datepicker';

initDatePicker();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import Typed from 'typed.js';

function loadDynamicBannerText() {
 new Typed('.text-banner', {
   strings: ["anywhere,", "any time."],
   typeSpeed: 200,
   loop: true
 });
 console.log('type is called')
}

export { loadDynamicBannerText };

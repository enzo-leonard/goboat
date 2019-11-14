import "bootstrap";

// Begin sticky bar
// When the user scrolls down 20px from the top of the document, slide down the navbar
// When the user scrolls to the top of the page, slide up the navbar (50px out of the top view)
<<<<<<< HEAD
window.onscroll = function () { scrollFunction() };

const navbar = document.getElementById("sticky-header");
const sticky = navbar.offsetTop;

function scrollFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky-header")
  } else {
    navbar.classList.remove("sticky-header");
  }
};
=======


>>>>>>> 30c1ac8f864195b2832374686be4ac4f600c7a49





import initMapbox from '../plugins/init_mapbox';
import initStickybar from '../components/initStickyBar';

initMapbox();
initStickybar();


// End sticky bar

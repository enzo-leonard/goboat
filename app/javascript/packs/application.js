import "bootstrap";

import initMapbox from '../plugins/init_mapbox';
import initStickybar from '../components/initStickyBar';
import initBooking from "../components/initBooking";

window.addEventListener("DOMContentLoaded", (event) => {
  initMapbox();
  initStickybar();
  initBooking();

  console.log("DOM entièrement chargé et analysé");
});


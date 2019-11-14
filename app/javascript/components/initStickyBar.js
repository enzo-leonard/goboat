const initStickybar = () => {
  const navbar = document.getElementById("sticky-header");
  if (navbar) {
    const sticky = navbar.offsetTop;
    window.onscroll = function () {
      scrollFunction()
    };

    function scrollFunction() {
      if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky-header")
      } else {
        navbar.classList.remove("sticky-header");
      }
    };
  }
}

export default initStickybar;


const initBooking = () => {
  const date_range = document.querySelector('#daterange')

  date_range.addEventListener('click', () => {
    console.log('click sur date range')
    const change = document.querySelector('.applyBtn.btn.btn-sm.btn-primary')
    console.log(change)

    if (change) {
      change.click


    change.addEventListener('click', () => {
      const range_value = document.querySelector('.drp-selected').innerHTML
      const date_begin = range_value.split('-')[0]
      const date_end = range_value.split('-')[1]
      const nb_day = document.querySelector('#nb-day');
      const sended_price = document.querySelector('#sended-price')
      const prix = document.querySelector('#prix');
      const price = document.querySelector('#price').innerHTML;
      const date1 = new Date(date_begin)
      const date2 = new Date(date_end)

      console.log(date_begin)
      console.log(date_end)

      const diffTime = Math.abs(date2 - date1);
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      console.log(diffDays);

      nb_day.innerHTML = diffDays
      prix.innerHTML = price * diffDays
      sended_price.value = price * diffDays
    })


  }





  });


  const commit = document.querySelector('form');




   commit.addEventListener('click', (event) => {
     event.preventDefault()
     event
   })

   $('form').submit(function () {
     const container = document.querySelector('.booking-container')
     const title = document.querySelector('#title-booking')
     console.log(title)
     title.innerHTML = "Boat booked !"
     title.style.color = 'white'
     container.style.border = "2px solid green"
     container.style.height = "70px";

     return true;
   });



}

export default initBooking

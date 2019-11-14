
const initBooking = () => {
  const btn_prix = document.querySelector('#btn-prix')
  const day_b = document.querySelector('#booking_date_begin_3i')
  const day_e = document.querySelector('#booking_date_end_3i')
  const commit = document.querySelector('form');

   const change_price = () => {
     const sended_price = document.querySelector('#sended-price')
     const nb_day = document.querySelector('#nb-day');
     const prix = document.querySelector('#prix');
     const price = document.querySelector('#price').innerHTML;
     const year_begin = document.querySelector('#booking_date_begin_1i').value
     const month_begin = document.querySelector('#booking_date_begin_2i').value
     const day_begin = document.querySelector('#booking_date_begin_3i').value
     const date_begin = `${year_begin}-${month_begin}-${day_begin}`
     const date1 = new Date(date_begin)

     const year_end = document.querySelector('#booking_date_end_1i').value
     const month_end = document.querySelector('#booking_date_end_2i').value
     const day_end = document.querySelector('#booking_date_end_3i').value
     const date_end = `${year_end}-${month_end}-${day_end}`
     const date2 = new Date(date_end)

     const msg = `comparason de la date ${date1} avec ${date2} `

     const diffTime = Math.abs(date2 - date1);
     const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
     console.log(diffDays);

     nb_day.innerHTML = diffDays
     prix.innerHTML = price * diffDays
     sended_price.innerHTML = price * diffDays
   }





   btn_prix.addEventListener('click', () => {
     const nb_day = document.querySelector('#nb-day');
     const sended_price = document.querySelector('#sended-price')
     const prix = document.querySelector('#prix');
     const price = document.querySelector('#price').innerHTML;
     const year_begin = document.querySelector('#booking_date_begin_1i').value
     const month_begin = document.querySelector('#booking_date_begin_2i').value
     const day_begin = document.querySelector('#booking_date_begin_3i').value
     const date_begin = `${year_begin}-${month_begin}-${day_begin}`
     const date1 = new Date(date_begin)

     const year_end = document.querySelector('#booking_date_end_1i').value
     const month_end = document.querySelector('#booking_date_end_2i').value
     const day_end = document.querySelector('#booking_date_end_3i').value
     const date_end = `${year_end}-${month_end}-${day_end}`
     const date2 = new Date(date_end)

     const msg = `comparason de la date ${date1} avec ${date2} `

     const diffTime = Math.abs(date2 - date1);
     const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
     console.log(diffDays);

     nb_day.innerHTML = diffDays
     prix.innerHTML = price * diffDays
     sended_price.value = price * diffDays
   })

   day_b.addEventListener('change', () => {
     const sended_price = document.querySelector('#sended-price')
     const nb_day = document.querySelector('#nb-day');
     const prix = document.querySelector('#prix');
     const price = document.querySelector('#price').innerHTML;
     const year_begin = document.querySelector('#booking_date_begin_1i').value
     const month_begin = document.querySelector('#booking_date_begin_2i').value
     const day_begin = document.querySelector('#booking_date_begin_3i').value
     const date_begin = `${year_begin}-${month_begin}-${day_begin}`
     const date1 = new Date(date_begin)

     const year_end = document.querySelector('#booking_date_end_1i').value
     const month_end = document.querySelector('#booking_date_end_2i').value
     const day_end = document.querySelector('#booking_date_end_3i').value
     const date_end = `${year_end}-${month_end}-${day_end}`
     const date2 = new Date(date_end)

     const msg = `comparason de la date ${date1} avec ${date2} `

     const diffTime = Math.abs(date2 - date1);
     const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
     console.log(diffDays);

     nb_day.innerHTML = diffDays
     prix.innerHTML = price * diffDays
     sended_price.value = price * diffDays
   })

   day_e.addEventListener('change', () => {
     const sended_price = document.querySelector('#sended-price')
     const nb_day = document.querySelector('#nb-day');
     const prix = document.querySelector('#prix');
     const price = document.querySelector('#price').innerHTML;
     const year_begin = document.querySelector('#booking_date_begin_1i').value
     const month_begin = document.querySelector('#booking_date_begin_2i').value
     const day_begin = document.querySelector('#booking_date_begin_3i').value
     const date_begin = `${year_begin}-${month_begin}-${day_begin}`
     const date1 = new Date(date_begin)

     const year_end = document.querySelector('#booking_date_end_1i').value
     const month_end = document.querySelector('#booking_date_end_2i').value
     const day_end = document.querySelector('#booking_date_end_3i').value
     const date_end = `${year_end}-${month_end}-${day_end}`
     const date2 = new Date(date_end)

     const msg = `comparason de la date ${date1} avec ${date2} `

     const diffTime = Math.abs(date2 - date1);
     const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
     console.log(diffDays);

     nb_day.innerHTML = diffDays
     prix.innerHTML = price * diffDays
     sended_price.value = price * diffDays
   })


   commit.addEventListener('click', (event) => {
     event.preventDefault()


     event

   })

   $('form').submit(function () {
     const container = document.querySelector('.booking-container')
     const title = document.querySelector('#title-booking')
     console.log(title)
     title.innerHTML = "Boat hooked !"
     title.style.color = 'green'
     container.style.border = "2px solid green"
     container.style.height = "70px";

     return true;
   });



}

export default initBooking

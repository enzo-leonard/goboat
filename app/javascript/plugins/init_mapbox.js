import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const map = document.querySelector('#map');
  if (map) {
    console.log('lancement de la map')
    mapboxgl.accessToken = 'pk.eyJ1IjoiZW56by1sIiwiYSI6ImNrMjV5aGZjZDFvejQzZ255amY4N29keHcifQ.hlztuK-Hrmxx2slpwQiZRg';
    const long = document.querySelector('#long').innerHTML;
    const lat = document.querySelector('#lat').innerHTML;

    console.log(lat);
    console.log(long)

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [lat, long],
      zoom: 12
      });


    new mapboxgl.Marker()
      .setLngLat([lat, long])
      .addTo(map);
  }
}
export default initMapbox ;

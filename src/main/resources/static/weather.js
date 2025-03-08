// 위치 정보 받기 성공
window.addEventListener('load', () => {
  navigator.geolocation.getCurrentPosition(success, fail);
});

// 위치 정보 받기 실패
const fail = () => {
  alert("좌표를 받아올 수 없음");
}

// API 호출하기
const API_KEY = 'c865596026261a7bdb59a1ac17aabc26';

const success = (position) => {
  const latitude = position.coords.latitude;
  const longitude = position.coords.longitude;

  getWeather(latitude, longitude);
};

const tempSection = document.querySelector('.temperature');
const placeSection = document.querySelector('.place');
const descSection = document.querySelector('.description');
const iconSection = document.querySelector('.icon'); // 아이콘


const getWeather = (lat, lon) => {
  fetch(
    `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=kr`
  )
    .then((response) => response.json())
    .then((json) => {
      console.log(json);

      // json에서 필요한 데이터 추출
      const temperature = json.main.temp;  // 온도
      const place = json.name;  // 위치
      const description = json.weather[0].description;  // 날씨 설명

      // 각 섹션에 데이터 표시
      tempSection.innerText = `${temperature}°C`;  // 온도 표시
      placeSection.innerText = place;  // 위치 표시
      descSection.innerText = description;  // 날씨 설명 표시
    })
    .catch((error) => {
      alert(error); // 에러 처리
    });
};

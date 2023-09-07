// HTML 요소 선택 후 할당
const jsTitle = document.querySelector(".js-title");  // 클래스가 "js-title"인 요소 선택
const jsRange = document.getElementById("js-range");  // id가 "js-range"인 input 요소 선택
const jsGuessForm = document.getElementById("js-guess");  // id가 "js-guess"인 form 요소 선택
const jsResult = document.querySelector("#js-result span"); // id가 "js-result"이고 내부에 span 요소를 포함하는 요소 선택

// min과 max 범위에서 랜덤한 정수를 생성함.
function generateRandomNumber(min, max) {   
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// 'jsRange' input 요소의 초기 값에 따라 제목을 업데이트함.
// span 요소 내에 현재 범위를 표시함.
jsTitle.innerHTML = `Generate a number between 0 and <span>${jsRange.value}</span>`;

// 범위 변경 listener
// 'jsRange' input 요소에 대한 "input" 이벤트 listener를 추가함.
// 범위를 조절할 때마다 제목의 'span'요소 내용을 업데이트하여 현재 범위를 반영함.
jsRange.addEventListener("input", () => {
  jsTitle.querySelector("span").textContent = jsRange.value;
});

// 제출 이벤트 리스너
jsGuessForm.addEventListener("submit", (e) => {   // form 요소에 대한 "submit" 이벤트 listener를 추가함.
  e.preventDefault();
  const userGuess = parseInt(document.getElementById("num").value);
  
  if (isNaN(userGuess) || userGuess < 0 || userGuess > parseInt(jsRange.value)) {
    jsResult.textContent = `Please enter a valid number between 0 and ${jsRange.value}.`;
  } else {
    const randomNumber = generateRandomNumber(0, parseInt(jsRange.value));
    if (userGuess === randomNumber) {
      jsResult.textContent = `You win! Your guess (${userGuess}) is correct.`;
    } else {
      jsResult.textContent = `You lose. The correct number was ${randomNumber}. Your guess was ${userGuess}.`;
    }
  }
});

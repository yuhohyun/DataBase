// Get HTML elements
const jsTitle = document.querySelector(".js-title");
const jsRange = document.getElementById("js-range");
const jsGuessForm = document.getElementById("js-guess");
const jsResult = document.querySelector("#js-result span");

// Generate a random number within the user-defined range
function generateRandomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Update the title to display the user-defined number range
jsTitle.innerHTML = `Generate a number between 0 and <span>${jsRange.value}</span>`;

// Event listener for range input change
jsRange.addEventListener("input", () => {
  jsTitle.querySelector("span").textContent = jsRange.value;
});

// Event listener for form submission
jsGuessForm.addEventListener("submit", (e) => {
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

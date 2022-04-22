/* search-category JS */
// Get select
var large = document.getElementById("large-select");
var middle = document.getElementById("middle-select");
var small = document.getElementById("small-select");

var selectValue_large;
var selectValue_middle;
var selectValue_small;

// Listen for click
large.addEventListener("click", selectDisabled_large);
middle.addEventListener("click", selectDisabled_middle);

// Function
function selectDisabled_large() {
  selectValue_large = parseInt(large.options[large.selectedIndex].value); //옵션 값을 얻어와서 숫자로 형변환
  //옵션 값이 숫자라면 true, 아니라면 false
  if (Number.isInteger(selectValue_large)) {
    middle.disabled = false;
  } else {
    middle.disabled = true;
    small.disabled = true;
  }
}
function selectDisabled_middle() {
  selectValue_middle = parseInt(middle.options[middle.selectedIndex].value); //옵션 값을 얻어와서 숫자로 형변환
  //옵션 값이 숫자라면 true, 아니라면 false
  if (Number.isInteger(selectValue_middle)) {
    small.disabled = false;
  } else {
    small.disabled = true;
  }
}


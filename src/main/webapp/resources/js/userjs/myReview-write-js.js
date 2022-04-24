// Get modal element
var modal = document.getElementById("react-modal");
// Get open modal button
var modalOpenBtn = document.getElementById("modalOpenBtn");
// Get close button
var modalCloseBtn = document.getElementById("modalCloseBtn");
// Get body
var body = document.getElementsByClassName("modalScroll")[0];
// Get modalBack element
var modalBack = document.getElementsByClassName("react-modal__content-wrap")[0];

// Listen for open click
modalOpenBtn.addEventListener("click", openModal);
// Listen for close click
modalCloseBtn.addEventListener("click", closeModal);
// Listen for outside click
window.addEventListener("click", outsideClick);

// Function to open modal
function openModal() {
	modal.style.display = "flex";
	body.style.overflow = "hidden";
}
// Function to close modal
function closeModal() {
	modal.style.display = "none";
	body.style.overflow = "auto";
}
// Function to close modal if outside click
function outsideClick(e) {
	if (e.target == modalBack) {
		modal.style.display = "none";
	}
}

function favorite() {
  const favorite = document.getElementById("favorite");
  favorite.addEventListener("click", function() {
    if (favorite.getAttribute("style") == "background-color:#ffb340") {
      this.removeAttribute("style", "background-color:#ffb340")
    } else {
      this.setAttribute("style", "background-color:#ffb340")
    }
  });
}
window.addEventListener("load", favorite);
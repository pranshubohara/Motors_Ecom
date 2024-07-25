
const videoFiles = ['../image/video1.mp4', '../image/video2.mp4', '../image/video3.mp4']; // List of video file names
let currentVideoIndex = 0;

const videoSlider = document.getElementById('video-slider');

// Add event listener to play the next video when the current one ends
videoSlider.addEventListener('ended', playNextVideo);

// Add event listener to change the video when clicked
videoSlider.addEventListener('click', playNextVideo);

function playNextVideo() {
  // Increment the currentVideoIndex and loop back to the beginning if necessary
  currentVideoIndex = (currentVideoIndex +1) % videoFiles.length;
  
  // Set the src attribute of the video element to the next video file
  videoSlider.src = videoFiles[currentVideoIndex];

  // Play the video
  videoSlider.play()
    .catch(error => {
      console.error('Error playing video:', error);
    });
}

/*cart js*/



function toggleDropdown() {
    var dropdown = document.getElementById("responsiveDropdown");
    dropdown.classList.toggle("active");
}


// Function to update cart item count
function updateCartItemCount(count) {
    const itemCountElement = document.querySelector('.item-count');
    itemCountElement.textContent = count;
}


//code for profile pic 


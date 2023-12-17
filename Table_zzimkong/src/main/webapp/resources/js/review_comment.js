document.getElementById('commentIcon').addEventListener('click', function() {
    document.getElementById('commentPopup').style.display = 'block';
});

document.getElementById('closePopup').addEventListener('click', function() {
    document.getElementById('commentPopup').style.display = 'none';
});

document.getElementById('submitComment').addEventListener('click', function() {
    // Add code here to handle the comment submission
    document.getElementById('commentPopup').style.display = 'none';
});

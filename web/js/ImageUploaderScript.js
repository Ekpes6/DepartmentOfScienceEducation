/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function escapeTags(str){
    return String(str)
            // .replace(/ /g, '&#39;')
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
}

window.onload = function(){
    var msgBox = document.getElementById('msgBox');

    var uploadProp = {
        btn: document.getElementById('uploadBtn'),
        pictureBox: document.getElementById('uploadImage'),
        progressBar: document.getElementById('progressBar'),
        progressOuter: document.getElementById('progressOuter'),
        messageBox: msgBox,
        imageType: 'profileImage'
    };
    initiateUpload(uploadProp);

};

function initiateUpload(uploadProp){
    var uploader = new ss.SimpleUpload({
        button: uploadProp.btn,
        url: 'image-uploader',
        name: 'uploadfile',
        data: {imageType: uploadProp.imageType},
        multiple: true,
        multipart: true,
        maxUploads: 1,
        maxSize: 1024,
        queue: false,
        hoverClass: 'hover',
        focusClass: 'focus',
        responseType: 'json',
        progressUrl: 'upload-progress',
        sessionProgressName: 'fileUploadProgressListener',
        onSizeError: function(filename, fileSize){
            alert(filename + ' is too big. (' + fileSize + 'KB max file size)');
        },
        startXHR: function(){
            uploadProp.progressOuter.style.display = 'block'; // make progress bar visible
            this.setProgressBar(uploadProp.progressBar);
        },
        onSubmit: function(){
            uploadProp.messageBox.innerHTML = ''; // empty the message box
            uploadProp.btn.innerHTML = 'Uploading...'; // change button text to "Uploading..."
        },
        onComplete: function(filename, response){
            uploadProp.btn.innerHTML = 'Choose Another File';
            uploadProp.progressOuter.style.display = 'none'; // hide progress bar when upload is completed

            if(!response){
                uploadProp.messageBox.innerHTML = 'An error occurred and the upload failed.';
                return;
            }else{
                uploadProp.messageBox.innerHTML = '<strong>' + escapeTags(filename) + '</strong>' + ' successfully uploaded.';
                // var gl = 'http://localhost:8080/ProfileImage/thumbnails/';
                uploadProp.pictureBox.src = response[0].url;
                return;
            }
        },
        onError: function(){
            uploadProp.progressOuter.style.display = 'none';
            uploadProp.messageBox.innerHTML = 'Unable to upload file';
        }
    });
}
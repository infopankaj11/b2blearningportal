
function newImage(arg) {
    if (document.images) {
        rslt = new Image();
        rslt.src = arg;
        return rslt;
    }
}

function changeImages() {
    if (document.images && (preloadFlag == true)) {
        for (var i = 0; i < changeImages.arguments.length; i += 2) {
            document[changeImages.arguments[i]].src = changeImages.arguments[i + 1];
        }
    }
}

var preloadFlag = false;
function preloadImages() {
    if (document.images) {
        PAdmin_over = newImage("images/PAdmin-over.gif");
        userAdmin_over = newImage("images/userAdmin-over.gif");
        examination_over = newImage("images/examination-over.gif");
        exercise_over = newImage("images/exercise-over.gif");
        survey_over = newImage("images/survey-over.gif");
        module_over = newImage("images/module-over.gif");
        reports_over = newImage("images/reports-over.gif");
        preloadFlag = true;
    }
}

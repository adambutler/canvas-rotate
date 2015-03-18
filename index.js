var bx, canvas, context, h, hh, hw, w;

canvas = document.getElementById("myCanvas");

context = canvas.getContext("2d");

w = canvas.width;

h = canvas.height;

hw = canvas.width / 2;

hh = canvas.height / 2;

bx = 20;

context.fillStyle = "rgba(255,0,0,0.5)";

context.fillRect(0, 0, w, hh);

context.fillStyle = "rgba(0,255,0,0.5)";

context.fillRect(0, hh, w, hh);

context.fillStyle = "blue";

context.fillRect(0, 0, bx, bx);

context.fillStyle = "cyan";

context.fillRect(bx, 0, bx, bx);

context.fillStyle = "orange";

context.fillRect(w - bx, 0, bx, bx);

context.fillStyle = "yellow";

context.fillRect(w - bx - bx, 0, bx, bx);

context.fillStyle = "magenta";

context.fillRect(0, hh - bx, bx, bx);

context.fillStyle = "pink";

context.fillRect(bx, hh - bx, bx, bx);

context.fillStyle = "black";

context.fillRect(w - bx, hh - bx, bx, bx);

context.fillStyle = "gray";

context.fillRect(w - bx - bx, hh - bx, bx, bx);

window.getTempCanvas = function(canvas) {
  var tempCanvas;
  tempCanvas = document.createElement('canvas');
  tempCanvas.width = canvas.width;
  tempCanvas.height = canvas.height;
  return tempCanvas;
};

window.rotate = function(degrees) {
  var tempCanvas, tempCanvasContext;
  console.log(degrees);
  tempCanvas = getTempCanvas(canvas);
  tempCanvasContext = tempCanvas.getContext("2d");
  tempCanvasContext.drawImage(canvas, 0, 0);
  $("#preview").html("").append(tempCanvas);
  canvas.width = tempCanvas.height;
  canvas.height = tempCanvas.width;
  context.clearRect(0, 0, canvas.width, canvas.height);
  context.translate(canvas.width / 2, canvas.height / 2);
  context.rotate(degrees * (Math.PI / 180));
  context.translate(-tempCanvas.width / 2, -tempCanvas.height / 2);
  context.drawImage(tempCanvas, 0, 0, tempCanvas.width, tempCanvas.height);
  context.translate(canvas.width / 2, canvas.height / 2);
  context.rotate(-degrees * (Math.PI / 180));
  return context.translate(-canvas.width / 2, -canvas.height / 2);
};

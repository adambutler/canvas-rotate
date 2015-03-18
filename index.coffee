canvas = document.getElementById("myCanvas")
context = canvas.getContext("2d")

w = canvas.width
h = canvas.height

hw = canvas.width/2
hh = canvas.height/2

bx = 20

context.fillStyle = "rgba(255,0,0,0.5)"
context.fillRect(0,0,w,hh)

context.fillStyle = "rgba(0,255,0,0.5)"
context.fillRect(0,hh,w,hh)

context.fillStyle = "blue"
context.fillRect(0,0,bx,bx)

context.fillStyle = "cyan"
context.fillRect(bx,0,bx,bx)

context.fillStyle = "orange"
context.fillRect(w-bx,0,bx,bx)

context.fillStyle = "yellow"
context.fillRect(w-bx-bx,0,bx,bx)

context.fillStyle = "magenta"
context.fillRect(0,hh-bx,bx,bx)

context.fillStyle = "pink"
context.fillRect(bx,hh-bx,bx,bx)

context.fillStyle = "black"
context.fillRect(w-bx,hh-bx,bx,bx)

context.fillStyle = "gray"
context.fillRect(w-bx-bx,hh-bx,bx,bx)


window.getTempCanvas = (canvas) ->
  tempCanvas = document.createElement('canvas')
  tempCanvas.width = canvas.width;
  tempCanvas.height = canvas.height;
  return tempCanvas

window.rotate = (degrees) ->

  console.log degrees

  # create a new canvas
  tempCanvas = getTempCanvas(canvas)
  tempCanvasContext = tempCanvas.getContext("2d")

  # draw the existing canvas onto the tempCanvas
  tempCanvasContext.drawImage canvas, 0, 0

  $("#preview").html("").append tempCanvas

  # Resize the canvas
  canvas.width = tempCanvas.height
  canvas.height = tempCanvas.width

  # Clear the canvas
  context.clearRect 0, 0, canvas.width, canvas.height

  # Move registration point to the center of the canvas
  context.translate (canvas.width / 2), (canvas.height / 2)

  # Rotate 90 degrees
  context.rotate (degrees * (Math.PI / 180))

  # Move registration point back to the top left corner of canvas
  context.translate -tempCanvas.width/2, -tempCanvas.height/2

  context.drawImage tempCanvas, 0, 0, tempCanvas.width, tempCanvas.height

  # Reset the rotation
  context.translate (canvas.width / 2), (canvas.height / 2)
  context.rotate (-degrees * (Math.PI / 180))
  context.translate -canvas.width/2, -canvas.height/2

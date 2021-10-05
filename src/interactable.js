import interact from "interactjs";

export const interactable = el => {
const position = { x: 0, y: 0 }
  interact(el)
    .draggable({
      inertia: true
    })
    .on("dragmove", event => {
        position.x += event.dx
        position.y += event.dy
    
        event.target.style.transform =
            `translate(${position.x}px, ${position.y}px)`
    });
};
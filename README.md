# WebWrap

Easily wrap your WebApp into a frameless macOS Application.

To hide the app call "window.macOS.hide()" from JavaScript.
```
<button onclick="window.macOS.hide()">CLOSE</button>
```

to move the window include the "move.js" file in the "web" directory. This small piece of JavaScript attaches an event handler to ".window-drag-handle" Elements and communicates its position to the Mac-Window via "window.macOS.moveBy".

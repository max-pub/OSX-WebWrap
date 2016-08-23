# WebWrap

Easily wrap your WebApps into a frameless macOS Application.

to hide the app call "window.macOS.hide()"

to move the window include the "move.js" file in the "web" directory. This small piece of JavaScript attaches an event handler to ".window-drag-handle" Elements and communicates its position to the Mac-Window via "window.macOS.moveBy".

# WebWrap

Easily wrap your WebApp into a frameless macOS Application.

To hide the app call "window.macOS.hide()" from JavaScript.
For example:
```html
<button onclick="window.macOS.hide()">CLOSE</button>
```

To move the window include the "macOS.moveWindow.js" file in the "web" directory. 
This small piece of JavaScript attaches an event handler to ".window-drag-handle" Elements and communicates its position to the Mac-Host-Window via "window.macOS.moveBy".
You can also call this command directly if you so prefer:
```javascript
window.macOS.moveBy(10,10);
```

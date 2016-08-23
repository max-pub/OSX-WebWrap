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

Everything interesting happens here:
[AppDelegate](https://github.com/max-pub/WebWrap/blob/master/WebWrap/AppDelegate.swift)

Download the Demo to see for yourself:
[DEMO](https://github.com/max-pub/WebWrap/releases/download/1.0/WebWrap.app.zip)

you can replace the web-contents in the DEMO.app to have your own web-app run instantly

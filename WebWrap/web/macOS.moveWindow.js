setTimeout(function() {
           if (!'macOS' in window) return;
           moving = false;
           
           var handles = document.getElementsByClassName('window-drag-handle');
           console.log('add drag-handles for', handles);
           
           for (var i = 0; i < handles.length; i++)
           handles[i].addEventListener('mousedown', function(event) {
                                       moving = true;
                                       base = {
                                       x: event.screenX,
                                       y: event.screenY
                                       };
                                       });
           
           window.addEventListener('mousemove', function(event) {
                                   if (!moving) return;
                                   window.macOS.moveBy(event.screenX - base.x, event.screenY - base.y);
                                   base = {
                                   x: event.screenX,
                                   y: event.screenY
                                   };
                                   });
           
           window.addEventListener('mouseup', function(event) {
                                   moving = false;
                                   });
           
           }, 100);
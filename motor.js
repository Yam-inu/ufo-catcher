w().ready(function() { 

    var motor = "STOP";
  
  // 「前進」ボタンが押されたときのイベント処理
    $('#forward').bind(BUTTON_DOWN, function(event) {
      // 押されたとき
      if(motor == "STOP") {
        $(this).addClass('ledon');
        change_motor('FOWARD');
      }
    }).bind(BUTTON_UP, function(event) {
      // 離したとき
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「後退」ボタンが押されたときのイベント処理
    $('#backward').bind(BUTTON_DOWN, function(event) {
      if(motor == "STOP") {
        $(this).addClass('ledon');
        change_motor('BACKWARD');
      }
    }).bind(BUTTON_UP, function(event) {
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「右」ボタンが押されたときのイベント処理
    $('#right').bind(BUTTON_DOWN, function(event) {
      if(motor == "STOP") {
        $(this).addClass('ledon');
        change_motor('RIGHT');
      }
    }).bind(BUTTON_UP, function(event) {
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「左」ボタンが押されたときのイベント処理
    $('#left').bind(BUTTON_DOWN, function(event) {
      if(motor == "STOP") {
        $(this).addClass('ledon');
        change_motor('LEFT');
      }
    }).bind(BUTTON_UP, function(event) {
        $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
   // 関数：モーターを動かすマクロ呼び出し
    function change_motor(type) {
      motor = type;
      if(type == "FOWARD") {             // 前進
        w().callMacro('FW');
      } else if(type == "BACKWARD") {    // 後進
        w().callMacro('BK'); 
      } else if(type == "RIGHT") {       // 右旋回
        w().callMacro('RT');
      } else if(type == "LEFT") {        // 左旋回
        w().callMacro('LT');
      } else if(type == "STOP") {       // 停止
        w().callMacro('ST');
      }
    }
  });

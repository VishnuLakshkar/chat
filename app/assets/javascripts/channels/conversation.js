var count = 0;
App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    // var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");

    // if (data['window'] !== undefined) {
    //   var conversation_visible = conversation.is(':visible');

    //   if (conversation_visible) {
    //     var messages_visible = (conversation).find('.panel-body').is(':visible');

    //     if (!messages_visible) {
    //       conversation.removeClass('panel-default').addClass('panel-success');
    //     }
    //     conversation.find('.messages-list').find('ul').append(data['message']);
    //   }
    //   else {
    //     $('#conversations-list').append(data['window']);
    //     conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    //     conversation.find('.panel-body').toggle();
    //   }
    // }
    // else {
    //   conversation.find('ul').append(data['message']);
    // }

    // var messages_list = conversation.find('.messages-list');
    // var height = messages_list[0].scrollHeight;
    // messages_list.scrollTop(height);

    if (document.URL.match(/(\/home\/index)/)) {
      var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
      conversation.find('.messages-list').find('ul').append(data['message']);

      var messages_list = conversation.find('.messages-list');
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
      count = 0;
    }
    else {
      $(".navbar").find("sup").text(++count);
    }
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});
$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  if (values[2]['value'].trim().length > 0) {
    App.conversation.speak(values);    
  }
  $(this).trigger('reset');
});


// more notes below
// ./consumer - action cable from rails so we can use some features from action cable
import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initChatroomCable };

// code with a bunch of comments

// const initChatroomCable = () => {
//   const messagesContainer = document.getElementById('messages');
//   // safetynet to make sure all other pages where messageContainer don't exists does not run into errors
//   // javascript/packs/application.js is ran on every page and it also runs this file via imports, see Internal imports
//   if (messagesContainer) {
//     // dataset.chatroomId - can be traced back to show.html.erb
//     // <div id="messages" data-chatroom-id="<%= @chatroom.id %>">
//     const id = messagesContainer.dataset.chatroomId;

//     // consumer is name chosen for action cable
//     // subscriptions.create - subscribe to a certain channel upon landing on a page
//     // "ChatroomChannel" is the name of the object from app/channels/chatroom_channel.rb
//     // id: id - is the id retrieved from the html, needed to be able to join the right
//     // id: id - not needed if app only has one general channel @42 mins of the lecture
//     consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//         // data comes from messages_controller#create... ChatroomChannel.broadcast_to...
//         // data is the string containing the html structure

//         // will just log the typed message in the console
//         // console.log(data); // called when data is broadcast in the cable
//       received(data) {
//         console.log(data); // called when data is broadcast in the cable
//       },
//     });
//   }
// }

// export { initChatroomCable };

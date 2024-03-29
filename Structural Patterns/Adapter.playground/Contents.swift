import UIKit

protocol MessageSender {
    func send(message: String)
}

class SlackMessenger: MessageSender {
    func send(message: String) {
        print("Sent message \(message) to Slack")
    }
}

class JabberMessenger: MessageSender {
    func send(message: String) {
        print("Sent message \(message) to Jabber")
    }
}

class HipChatMessenger {
    func send(message: String, identifier: String) {
        print("Sent message \(message) with \(identifier) to HipChat ")
    }
}

class HipChatMessengerAdapter: MessageSender {
    private let hipChat = HipChatMessenger()
    func send(message: String) {
        hipChat.send(message: message, identifier: UUID().uuidString)
    }
}

class Messenger {
    private let messengers: [MessageSender] = [SlackMessenger(), JabberMessenger(), HipChatMessengerAdapter()]
    
    func sendToAllMessengers(message: String) {
        for messenger in messengers {
            messenger.send(message: message)
        }
    }
}

let messenger = Messenger()
messenger.sendToAllMessengers(message: "Hello there form ibrahim")

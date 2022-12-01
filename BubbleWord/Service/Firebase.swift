//
//  Firebase.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 26/11/22.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

class FirebaseService {
    
    static var standard = FirebaseService()

    var ref = Database.database().reference()
    var refRooms = Database.database().reference().child("rooms")
    
    var room: Room!
    var participants: [Participant] = []
    
    func createRoom(completionHandler: @escaping (String) -> Void) {
        self.ref.child("rooms").child("ABCD").setValue([
            "code": "ABCD",
            "hasBegun": "false",
            "participants": [
                "1": UserDefaults.standard.string(forKey: "username")
            ]
        ])
        completionHandler("abcd")
    }
    
    func getParticipants(completionHandler: @escaping ([Participant]) -> Void) {
        
        var participants: [Participant] = []
        refRooms.child("ABCD").child("participants").observe(DataEventType.value, with: { snapshot in
            
            let values = snapshot.value as? [String: AnyObject]
            
//            values?.forEach({ value in
                print("# \(values?["a"] as? String ?? "")")
//            })
//            let username = value?["1"] as? String ?? ""
//            let user = User(username: username)
            
//            let value = snapshot.value as! [String: Any]
//            let count = 1...value.count
//
//            for number in count {
//                print(number)
//                let participant = Participant(id: UUID(), name: value["\(number)"] as? String ?? "")
//                participants.append(participant)
//            }
        })
        completionHandler(participants)
    }
    
//    func joinRoom(completionHandler: @escaping (String) -> Void) {
//        refRooms.child("ABCD").child("participants").observe(DataEventType.value, with: { snapshot in
//            let value = snapshot.value as! [String: Any]
//            let count = 1...value.count
//
//            var dic: [String: Any]
//
//            for number in count {
//                print(number)
//                let item: [String: Any] = [
//                       "\(number)": "new value"
//                   ]
//                dic.append(item)
//            }
//        )
//
//        self.participants.append(Participant(id: UUID(), name: UserDefaults.standard.string(forKey: "username") ?? "Alpaca Anônima"))
//    }
    
    func getRoom(completionHandler: @escaping (String) -> Void) {
        
        ref.child("rooms").child("ABCD").observe(DataEventType.value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let code = value?["code"] as? String ?? ""
            let hasBegun = value?["hasBegun"] as? Bool ?? false
//            let participants = value?["participants"] as! [String: Any]
//
//            let count = 1...participants.count
//
//            for number in count {
//                print(number)
//                let participant = Participant(id: UUID(), name: participants["\(number)"] as? String ?? "")
//                self.participants.append(participant)
//            }
//            print(self.participants)
            
            self.room = Room(
                code: code,
                participants: [],
                hasBegun: hasBegun,
                letters: [
                ],
                question: Question(
                    questionText: "Texto da pergunta",
                    questionColor: 1
                )
            )
            
            print(self.room)
            
        }) { error in
          print(error.localizedDescription)
        }
        completionHandler("foi")
    }
    
}

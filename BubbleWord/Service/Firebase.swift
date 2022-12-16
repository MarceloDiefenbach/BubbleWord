//
//  Firebase.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 26/11/22.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase
import Firebase
import FirebaseFirestore

class FirebaseService {
    
    static var instance: FirebaseService = FirebaseService()
    
    enum ErrorType: Error {
        case noCurrentCode
        case noParticipantsFound
    }
    
    // MARK: - Variables
    
    static var standard = FirebaseService()
    var ref = Database.database().reference()
    var refRooms = Database.database().reference().child("rooms")
    var participants: [Participant] = []
    var roomCode: String = ""
    var username: String = UserDefaults.standard.string(forKey: "username") ?? "Anonimo"
    
    // MARK: - Functions
    
    func randomString(length: Int = 5) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        //TODO: - here we need to verify if already exist some room with this code
        return String((0..<length).map{ _ in letters.randomElement() ?? "A" })
    }
    
    // MARK: - Requests
    
    func createRoom(completion: @escaping (String) -> Void) {
        roomCode = randomString().uppercased()
        
        self.refRooms.child(self.roomCode).setValue([
            "code": self.roomCode,
            "hasBegun": "false",
            "letters": [],
            "isStopped": false,
            "actualTheme": "",
            "participants": [
                "0": self.username
            ]
        ], withCompletionBlock: { (error, ref) -> Void in
            if error != nil {
                completion("error")
            } else {
                completion(self.roomCode)
            }
        })
    }
    
    func getParticipants(completion: @escaping (Result<[Participant], Error>) -> Void) {
        var participantsList: [Participant] = []
        
        refRooms.child(self.roomCode).child("participants").getData(completion: { err, snapshot in
            if let participants = snapshot?.value as? [String] {
                for participant in participants {
                    participantsList.append(Participant(id: UUID(), name: participant))
                }
                completion(.success(participantsList))
            } else {
                completion(.failure(ErrorType.noParticipantsFound))
            }
        })
    }
    
    func participantsListener(completion: @escaping (Result<[Participant], Error>) -> Void) {
        var participantsList: [Participant] = []
        
        refRooms.child(self.roomCode).child("participants").observe(DataEventType.value, with: { snapshot in
            participantsList = []
            if let participants = snapshot.value as? [String] {
                for participant in participants {
                    participantsList.append(Participant(id: UUID(), name: participant))
                }
                completion(.success(participantsList))
            } else {
                completion(.failure(ErrorType.noParticipantsFound))
            }
        })
    }
    
    func joinRoom(code: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        self.roomCode = code.uppercased()
        
        self.getParticipants() { result in
            switch result {
            case .success(let success):
                var participants = success.map( { $0.name } )
                participants.append(self.username)
                
                self.refRooms.child(self.roomCode).updateChildValues(["participants": participants]) { err, ref in
                    print(err)
                    completion(.success(true))
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(.failure(ErrorType.noParticipantsFound))
            }
        }
    }
    
    func leaveRoom(completion: @escaping (Result<Bool, Error>) -> Void) {
        self.getParticipants { result in
            switch result {
            case .success(let success):
                var participants = success.map( { $0.name } )
                if let index = participants.firstIndex(of: self.username) {
                    participants.remove(at: index)
                }
                self.refRooms.child(self.roomCode).updateChildValues(["participants": participants]) { err, ref in
                    print(err)
                    completion(.success(true))
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(.failure(ErrorType.noParticipantsFound))
            }
        }
    }
    
    func deleteRoom(completion: @escaping (Result<Bool, Error>) -> Void) {
        self.refRooms.child(self.roomCode).removeValue()
        //TODO: - here we need to verify if an error occurred
    }
    
    
    func saveLetters(letters: [Letter]) {
        
        //TODO: - This save letters on roomCode/letters but some letters are starting with false on state. IDK how to fix this
        for (index, letter) in letters.enumerated() {
            self.refRooms.child(self.roomCode).child("letters").child("\(index)").setValue(["letter": letter.letter, "state": true, "colorIndex": letter.colorIndex])
        }
        //TODO: - here we need to verify if an error occurred
    }
    
    func getLetters(completion: @escaping ([Letter]) -> Void) {
        var letters: [Letter] = []
        self.refRooms.child(roomCode).child("letters").observe(.value, with: { (snapshot) in
            letters = []
            for child in snapshot.children {
                let data = child as! DataSnapshot
                if let letterDict = data.value as? [String:Any] {
                    let letter = Letter(letter: letterDict["letter"] as? String ?? "", state: letterDict["state"] as? Bool ?? false, colorIndex: letterDict["colorIndex"] as? Int ?? 1)
                    letters.append(letter)
                }
            }
            completion(letters)
        })
    }
    
    func markLetterAsUded(_ letter: Letter) {
        self.refRooms.child(roomCode).child("letters").observe(.value, with: { (snapshot) in
            
            for child in snapshot.children {
                let data = child as! DataSnapshot
                let letterDict = data.value as! [String:Any]
                if let letterFirebase = letterDict["letter"] as? String {
                    if letterFirebase == letter.letter {
                        data.ref.updateChildValues(["state": false])
                    }
                } else {
                    print("found nil")
                }
            }
        })
    }
    
    func stopGame() {
        self.refRooms.child(roomCode).child("isStopped").setValue(true)
        //TODO: - here we need to verify if an error occurred
    }
    
    func resumeGame() {
        self.refRooms.child(roomCode).child("isStopped").setValue(false)
        //TODO: - here we need to verify if an error occurred
    }
    
    func startGame() {
        self.refRooms.child(roomCode).child("hasBegun").setValue(true)
        //TODO: - here we need to verify if an error occurred
    }
    
    func hasBegun(completion: @escaping (Bool) -> Void) {
        self.refRooms.child(roomCode).child("hasBegun").observe(.value, with: { snapshot in
            if let value = snapshot.value as? Bool {
                if value == true {
                    print("already start")
                    completion(true)
                } else {
                    print("still waiting")
                    completion(false)
                }
            }
        })
    }
    
    func isStoped(completion: @escaping (Bool) -> Void) {
        self.refRooms.child(roomCode).child("isStopped").observe(.value, with: { snapshot in
            if let value = snapshot.value as? Bool {
                if value == true {
                    print("is Stoped")
                    completion(true)
                } else {
                    print("is running")
                    completion(false)
                }
            }
        })
    }
    
    func getActualTheme(completion: @escaping (String) -> Void) {
        self.refRooms.child(roomCode).child("actualTheme").observe(.value, with: { (snapshot) in
            if let data = snapshot.value as? String {
                print(data)
                completion(data)
            }
            //TODO: - here we need to verify if an error occurred
        })
    }
    
    func changeActualTheme(theme: String) {
        self.refRooms.child(roomCode).child("actualTheme").setValue(theme)
        //TODO: - here we need to verify if an error occurred
    }
    
    func updateTimeRemaining(time: Int) {
        self.refRooms.child(self.roomCode).child("timeRemaining").setValue(time)
        //TODO: - here we need to verify if an error occurred
    }
    
    func getTimeRemaining(completion: @escaping (Int) -> Void) {
        self.refRooms.child(roomCode).child("timeRemaining").observe(.value, with: { (snapshot) in
            if let data = snapshot.value as? Int {
                completion(data)
            }
            //TODO: - here we need to verify if an error occurred
        })
    }
}

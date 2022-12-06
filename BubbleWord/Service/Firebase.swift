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
    
    enum ErrorType: Error {
        case noCurrentCode
        case noParticipantsFound
    }
    
    // MARK: - Variables
    
    static var standard = FirebaseService()
    var ref = Database.database().reference()
    var refRooms = Database.database().reference().child("rooms")
    var room: Room!
    var participants: [Participant] = []
    var currentCode: String? = "ABCD"
    
    // MARK: - Functions
    
    func randomString(length: Int = 5) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        //TODO: - here we need to verify if already exist some room with this code
        return String((0..<length).map{ _ in letters.randomElement() ?? "A" })
    }
    
    // MARK: - Requests
    
    func createRoom(completion: @escaping (String) -> Void) {
        let code = randomString()
        
        self.refRooms.child(code).setValue([
            "code": code,
            "hasBegun": "false",
            "participants": [
                "0": UserDefaults.standard.string(forKey: "username")
            ]
        ], withCompletionBlock: { (error, ref) -> Void in
            if error != nil {
                completion("error")
            } else {
                UserDefaults.standard.set(code, forKey: "roomCode")
                completion(code)
            }
        })
        
        self.currentCode = code
    }
    
    func getParticipants(code: String, completion: @escaping (Result<[Participant], Error>) -> Void) {
        var participantsList: [Participant] = []
        
        refRooms.child("KAXZM").child("participants").getData(completion: { err, snapshot in
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
        
        guard let currentCode = currentCode else {
            completion(.failure(ErrorType.noCurrentCode))
            return
        }
        
        refRooms.child(currentCode).child("participants").observe(DataEventType.value, with: { snapshot in
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
        self.getParticipants(code: code) { result in
            switch result {
            case .success(let success):
                var participants = success.map( { $0.name } )
                let username: String = UserDefaults.standard.string(forKey: "username") ?? "Anonimo"
                participants.append(username)
                //TODO: - this return error
                self.refRooms.child(code).updateChildValues(["participants": participants]) { err, ref in
                    completion(.success(true))
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(.failure(ErrorType.noParticipantsFound))
            }
        }
    }
    
    
}

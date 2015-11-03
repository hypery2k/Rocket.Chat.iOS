////
////  RoomHistoryManager.swift
////  Rocket.Chat.iOS
////
////  Created by Kornelakis Michael on 10/15/15.
////  Copyright © 2015 Rocket.Chat. All rights reserved.
////
//
//import UIKit
//import ObjectiveDDP
//import SwiftyJSON
//
//class RoomHistoryManager  {
//    
//    var meteor:MeteorClient
//    var res:JSON?
//    
//    init() {
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        self.meteor = appDel.meteorClient
//        
//    }
//    
//    let defaultLimit = 50
//    
//    var histories = [NSString():[NSString():Bool()]]
//    
//    
//    func getMoreIfIsEmpty(roomId: NSString) {
//        var room:NSDictionary
//        
//        room = getRoom(roomId)
//        
//    if (room["loaded"] as? Int == 0) {
//    
//            getMore(roomId, limit: defaultLimit)
//            
//        }
//        
//    }
//    
//    
//    func getMore(roomId: NSString, var limit: Int?) {
//        var room:NSDictionary
//        
//        if let _ = limit{
//            print(limit)
//        }else {
//            limit = defaultLimit
//        }
//        
//        room = getRoom(roomId)
//
//        
//        let roomHasMore = room["hasMore"] as! Bool
//        if roomHasMore != true {
//            return
//        }
//        
//        //room["isLoading"] = true
//        setRoomsProperties(roomId, property: "isLoading", value: true)
//       
//
//        //find lastMessage from ChatMessage collection
//        let chatmessages = self.meteor.collections["rocketchat_message"] as! M13MutableOrderedDictionary
//        
//        let lastMessage = chatmessages.lastEntry()
//        print(lastMessage)
//        
//        
//        let now = NSDate()
//        
//        let formData = NSDictionary(dictionary: [
//            "$date": now.timeIntervalSince1970*1000
//            ])
//
//        
//        meteor.callMethodName("loadHistory", parameters: ["GENERAL", formData, limit!], responseCallback: { (response, error) -> Void in
//            
//            if error != nil {
//                
//                print("Error:\(error.description)\n")
//                return
//                
//            } else {
//                
//                
//           //     room["loaded"] = true
//                
//                self.res = JSON(response)
//                
//            }
//        })
//        
//        
//    }
//    
//    
//    func getRoom(roomId: NSString) -> NSDictionary {
//     
//        if histories[roomId] == nil {
//            
//            histories = [
//                roomId:[
//                    "hasMore": true,
//                    "isLoading": false,
//                    "unreadNotLoaded": false,
//                    "loaded": false
//                ]
//                
//            ]
//            
//        }
//        print("Histories: \(histories)\n")
////        let histories2 = NSDictionary(dictionary: (histories[roomId] as? Dictionary)!)
////        print("Histories2: \(histories2)\n")
//        return histories[roomId]!
//        
//    }
//    
//    func setRoomsProperties(roomId: NSString, property: NSString, value: Bool) {
//        
//        histories[roomId]![property] = value
//        
//    }
//    
//}

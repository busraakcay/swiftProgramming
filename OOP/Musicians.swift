//
//  Musicians.swift
//  OOPwithSwift
//
//  Created by Busra Akcay on 22.08.2023.
//

import Foundation

// genelde bir şeyin kategorisi yapıldığında kullanılır
enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians{
    
    // Property
    var name : String
    var age : Int
    var instrument : String
    var musicianType : MusicianType
    
    // Initializer (Constructor)
    init(name: String, age: Int, instrument: String, musicianType: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.musicianType = musicianType
    }
    
    //method
    func sing(){
        print("nothing else matter")
    }
}

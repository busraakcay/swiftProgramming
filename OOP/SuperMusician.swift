//
//  SuperMusician.swift
//  OOPwithSwift
//
//  Created by Busra Akcay on 23.08.2023.
//

import Foundation

// inheritance -- SuperMusicians class is a sub class of Musicians
class SuperMusicians : Musicians {
    func sing2(){
        print("enter night")
    }
    
    override func sing() {
        super.sing()
        print("sad but true")
    }
}

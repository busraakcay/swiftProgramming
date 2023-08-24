//
//  main.swift
//  OOPwithSwift
//
//  Created by Busra Akcay on 22.08.2023.
//

/**** Access Levels  */
/**
 *private --- çok özel, hangi sınıftaysa sadece ortada kullanılır
 *fileprivate --- sadece tanımlanan dosya içerisinde kullanılabilir
 *internal --- default
 *public --- başka bir yerden ulaşılabilir fakat içerik değiştirilemez
 *open --- tüm dosyalara her şekilde ulaşılabilir, içeriği değiştirilebilir
 */

import Foundation

let james = Musicians(name: "james", age: 50, instrument: "guitar", musicianType: .Vocalist)
let kirk = SuperMusicians(name: "kirk", age: 55, instrument: "guitar", musicianType: .LeadGuitar)

/*musiciansObj.age = 50
 musiciansObj.name = "james heltfield"
 musiciansObj.instrument = "guitar"*/

print(james.age)
print(kirk.musicianType)
kirk.sing()
//kirk.sing2()


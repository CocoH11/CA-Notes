//
//  Note.swift
//  CA-Notes
//
//  Created by aubert andrea on 06/02/2020.
//  Copyright © 2020 CorentinAndreaCorp. All rights reserved.
//

import Foundation

class Note {
    var titre: String
    var contenu: String
    var date: Date
    //var localisation
    
    init(titre:String, contenu:String, date:Date ) {
        self.titre=titre;
        self.contenu=contenu;
        self.date=date;
    }
}

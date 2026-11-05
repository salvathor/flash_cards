//
//  Flashcard.swift
//  MyApp
//
//  Created by Salvador Lopez on 05/11/26.
//

import Foundation

struct FlashCard: Identifiable {
    
    let id = UUID()
    let pregunta: String
    let respuesta: String
    
}

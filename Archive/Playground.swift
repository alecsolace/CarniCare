//
//  Playground.swift
//  CarniCare
//
//  Created by Alexander Aguirre on 13/6/25.
//

import Playgrounds
import FoundationModels

#Playground(body: {
    
    let session = LanguageModelSession()
    let response = try await session.respond(to: "Generate 10 names for sarracenia cultivars, in each name explain your reasoning as to why call it that")
})

//
//  API.swift
//  ChatAI
//
//  Created by Pavel Neprin on 2/3/23.
//

import OpenAISwift
import SwiftUI

class ViewModel: ObservableObject {
    init() {}

    var openAI: OpenAISwift?
    
    enum MessageType {
        case text, error
    }
    
    func setup() {
        openAI = OpenAISwift(authToken: "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")
    }
  
    func send(text: String, completion: @escaping((String, MessageType) -> Void)) {
        openAI?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                let messageType : MessageType = .text
                completion(output, messageType)
            case .failure(let error):
                let output = error.localizedDescription
                let messageType : MessageType = .error
                completion(output, messageType)
            }
        })
    }
}

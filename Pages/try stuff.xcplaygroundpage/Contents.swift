import Foundation

func spinWords(in sentence: String) -> String {
    sentence
        .split(separator: " ")
        .map { "\($0)" }
        .map { $0.count > 4 ? String($0.reversed()) : $0 }
        .joined(separator: " ")
}



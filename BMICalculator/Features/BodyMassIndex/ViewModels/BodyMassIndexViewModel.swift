//
//  BodyMassIndexViewModel.swift
//  BMICalculator
//
//  Created by Handy Handy on 16/04/23.
//

import Foundation
import Combine

class BodyMassIndexViewModel: ObservableObject {
    var bodyMassIndexRepository = BodyMassIndexRepository()
    
    // UI control
    @Published var segment = 0
    @Published var weight = 76.0
    @Published var height = 166.0
    @Published var savedBodyMassIndex = [BodyMassIndex]()
    
    var result: Double {
        getBMIResult(weight: weight, height: height)
    }
    
    var scale: IndexScale {
        getBMIScale(result: result)
    }
    func getBMIResult(weight: Double, height: Double) -> Double {
        return weight * 10_000 / (height * height)
    }
    
    func getBMIScale(result: Double) -> IndexScale {
        switch result {
        case 0..<18.5:
            return .underweight
        case 18.6..<24.9:
            return .normal
        case 25..<29.9:
            return .overweight
        case 30..<34.9:
            return .obese
        default:
            return .extremlyObese
        }
    }
    
    func saveResult() {
        let newBodyMassIndex = BodyMassIndex(
            savedAt: Date(), result: result, scale: scale)
        bodyMassIndexRepository.add(newBodyMassIndex)
        updateSavedHistories()
    }
    
    func updateSavedHistories() {
        self.savedBodyMassIndex = bodyMassIndexRepository.savedBodyMassIndex
    }
    
    func isEmptyHistory() -> Bool {
        return bodyMassIndexRepository.savedBodyMassIndex.count == 0
    }
}


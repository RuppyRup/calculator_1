//
//  calculater_logic.swift
//  calculator
//
//  Created by student on 28.02.17.
//  Copyright © 2017 Илья Лошкарёв. All rights reserved.
//

import Foundation
let maxLength = 100000.0

class Calculator {
    private var d : Double = 0
    private var _wasActivated: Bool = false
    
    public var result : Double { get { return self.d } set { self.d = newValue } }
    
    public var wasActivated: Bool { get { return self._wasActivated } set { self._wasActivated = newValue } }
    
    static func+(_ cal:Calculator, _ c: Double) throws -> Calculator {
        guard cal.result + c < maxLength else {
            throw MyErrors.tooLongNumb("слишком большое число")
        }
        cal.result += c
        return cal
    }
    
    static func-(_ cal:Calculator, _ c: Double) -> Calculator {
        cal.result -= c
        return cal
    }
    
    static func*(_ cal:Calculator, _ c: Double) -> Calculator {
        cal.result *= c
        return cal
    }
    
    static func/(_ cal:Calculator, _ c: Double) throws -> Calculator {
        guard c * c > 0.000001 else {
            throw MyErrors.divideByZero("попытка делить на ноль")
        }
        cal.result /= c
        return cal
    }
    
    static func/=( _ cal:inout Calculator, _ c: Double) throws {
        do {
            try cal = cal / c
        }
        catch {
            throw MyErrors.divideByZero("попытка делить на ноль")
        }
    }
    
    static func*=(_ cal:inout Calculator, _ c: Double) {
        cal = cal * c
    }
    
    static func-=(_ cal:inout Calculator, _ c: Double) {
        cal = cal - c
    }
    
    static func+=(_ cal:inout Calculator, _ c: Double) throws {
        do {
            try cal = cal + c
        } catch {
            throw MyErrors.tooLongNumb("слишком большое число")
        }
        
    }
}

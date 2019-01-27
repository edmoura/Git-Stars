//
//  Currency.swift
//  GitStars
//
//  Created by Edson iMAC on 27/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

protocol Currency {
    static var code: String { get }
    static var factor: NSDecimalNumber { get }
    static var locale: String { get }
    static var decimalSeparator: String { get }
}

enum GBP: Currency {
    static let code = "GBP"
    static let factor: NSDecimalNumber = 1.44
    static let locale = ""
    static let decimalSeparator = "."
}

enum EUR: Currency {
    static let code = "EUR"
    static let factor: NSDecimalNumber = 1.13
    static let locale = ""
    static let decimalSeparator = "."
}

enum USD: Currency {
    static let code = "USD"
    static let factor: NSDecimalNumber = 1.0
    static let locale = ""
    static let decimalSeparator = "."
}

enum BRL: Currency {
    static let code = "BRL"
    static let factor: NSDecimalNumber = 1.0
    static let locale = "pt_BR"
    static let decimalSeparator = ","
}

struct Money<Cur: Currency>: CustomStringConvertible, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    let amount: NSDecimalNumber
    var description: String {
        let f = NumberFormatter()
        f.locale = Locale(identifier: Cur.locale)
        f.numberStyle = .currency
        f.currencyCode = Cur.code
        f.currencyDecimalSeparator = Cur.decimalSeparator
        return f.string(from: self.amount)!
    }
    init(floatLiteral value: FloatLiteralType) { self.amount = NSDecimalNumber(floatLiteral: value)}
    init(integerLiteral value: IntegerLiteralType) {self.amount = NSDecimalNumber(integerLiteral: value)}
    init(_ amount: NSDecimalNumber) { self.amount = amount }
    
    func convertTo<C: Currency>() -> Money<C> {
        let baseAmount = amount.multiplying(by: Cur.factor)
        let convertedAmount = baseAmount.dividing(by: C.factor)
        return Money<C>(convertedAmount)
    }
}

extension Money {
    var gbp: Money<GBP> { return convertTo() }
    var eur: Money<EUR> { return convertTo() }
    var usd: Money<USD> { return convertTo() }
    var real: Money<BRL> { return convertTo() }
}

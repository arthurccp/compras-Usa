//
//  TaxesCalculator.swift
//  Compras USA
//
//  Created by Arthur on 03/12/2021.
//  Copyright © 2021 br.com.arthursilva. All rights reserved.
//

import Foundation

class taxesCalculator{
    static let shared = taxesCalculator()
    var dolar: Double = 5.6
    var iof: Double = 4.0
    var StateTax: Double = 7.0
    var ShoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    
    var shoppingValueInReal: Double {
        return ShoppingValue*dolar
    }
    var StateTaxValue: Double {
        return ShoppingValue*StateTax/100
    }
    var iofValue: Double {
        return (ShoppingValue + StateTax) * iof/100
    }
    
    func calculate(usingCreditCard:Bool) -> Double {
        
        var finalValue: Double = ShoppingValue + StateTax
        if usingCreditCard {
            finalValue += iof
        }
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String)-> Double{
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String{
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
        
    }
    
    private init(){
            formatter.usesGroupingSeparator = true
    }
}

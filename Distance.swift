//
//  Distance.swift
//  DogusGuleryuz
//
//  Created by Dogus Guleryuz on 2023-03-13.
//

import Foundation

class Distance: CustomStringConvertible {
  
  private(set) var miles: Int
  private(set) var yards: Int
  private(set) var feet: Int
  private(set) var inches: Int
  
  init?(inches: Int) {
    if inches < 0 {
      return nil
    }
    self.miles = inches / 63360
    self.yards = (inches % 63360) / 36
    self.feet = (inches % 36) / 12
    self.inches = inches % 12
  }
  
  init?(miles: Int, yards: Int, feet: Int, inches: Int) {
    if miles < 0 || yards < 0 || feet < 0 || inches < 0 {
      return nil
    }
    let total = (miles * 63360) + (yards * 36) + (feet * 12) + inches
    self.miles = total / 63360
    self.yards = (total % 63360) / 36
    self.feet = (total % 36) / 12
    self.inches = total % 12
  }
  
  init?(){
    miles = 0
    yards = 0
    feet = 0
    inches = 0
  }
  
  static func +(lhs: Distance, rhs: Distance) -> Distance {
    let total = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches +
    (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return Distance(miles: total / 63360, yards: (total % 63360) / 36, feet: (total % 36) / 12, inches: total % 12)!
  }
  
  static func -(lhs: Distance, rhs: Distance) -> Distance? {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    if lhsTotal < rhsTotal {
      return Distance()!
    }
    let total = lhsTotal - rhsTotal
    if total > 0
    {
      return Distance(miles: total / 63360, yards: (total % 63360) / 36, feet: (total % 36) / 12, inches: total % 12)!
      
    }else
    {
      return nil
    }
  }
  
  static func *(lhs: Distance, rhs: Int) -> Distance {
    if rhs <= 0 {
      return Distance()!
    }
    let total = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let multiplied = total * rhs
    return Distance(miles: multiplied / 63360, yards: (multiplied % 63360) / 36, feet: (multiplied % 36) / 12, inches: multiplied % 12)!
  }
  
  static func <(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal < rhsTotal
  }
  
  static func >(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal > rhsTotal
  }
  
  static func <=(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal <= rhsTotal
  }
  
  static func >=(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal >= rhsTotal
  }
  
  static func ==(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal == rhsTotal
  }
  
  static func !=(lhs: Distance, rhs: Distance) -> Bool {
    let lhsTotal = (lhs.miles * 63360) + (lhs.yards * 36) + (lhs.feet * 12) + lhs.inches
    let rhsTotal = (rhs.miles * 63360) + (rhs.yards * 36) + (rhs.feet * 12) + rhs.inches
    return lhsTotal != rhsTotal
  }
  
  static func +=(lhs: Distance, rhs: Int) {
    if rhs > 0 {
      lhs.inches += rhs
      if lhs.inches >= 12 {
        lhs.inches -= 12
        lhs.feet += 1
      }
      if lhs.feet >= 3 {
        lhs.feet -= 3
        lhs.yards += 1
      }
      lhs.miles += lhs.yards / 1760
      lhs.yards %= 1760
    }
  }
  
  var description: String {
    if miles == 0 && yards == 0 && feet == 0 {
      return "(\(inches)\")"
    } else if miles == 0 && yards == 0 {
      return "(\(feet)'\(inches)\")"
    } else if miles == 0 {
      return "(\(yards)y \(feet)'\(inches)\")"
    } else {
      return "(\(miles)m \(yards)y \(feet)'\(inches)\")"
    }
  }
}

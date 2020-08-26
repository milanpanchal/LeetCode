/*:
# 412. Fizz Buzz [Easy]
  https://leetcode.com/problems/fizz-buzz/

 ---

### Problem Statement:

 Write a program that outputs the string representation of numbers from 1 to n.

 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.


### Example:

 ```
 n = 15,

 Return:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]
 ```
 
 */


import UIKit

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var result = [String]()
        for i in 1...n {
            if i%15 == 0 {
                result.append("FizzBuzz")
            } else if i%3 == 0 {
                result.append("Fizz")
            } else if i%5 == 0 {
                result.append("Buzz")
            } else {
                result.append(String(i))
            }
        }
        return result
    }
    
    func fizzBuzz1(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var result = [String]()
        for num in 1...n {
            if num % 3 == 0 {
                result.append(num % 5 == 0 ? "FizzBuzz" : "Fizz")
            } else {
                result.append(num % 5 == 0 ? "Buzz" : "\(num)")
            }

        }
        return result
    }
}


let sol = Solution()
sol.fizzBuzz(15)

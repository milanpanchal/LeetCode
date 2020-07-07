/*:
# 66. Plus One
  https://leetcode.com/problems/plus-one/

 ---

### Problem Statement:

 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.


### Example:

 ```
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.

 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.

 ```

 */

import UIKit

class Solution {

    // 109 / 109 test cases passed.
    // Status: Accepted
    // Runtime: 8 ms
    // Memory Usage: 21.1 MB

    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        
        for i in stride(from: digits.count-1, through: 0, by: -1) {
            if digits[i] < 9 {
               digits[i] += 1
                break
            }
            
            digits[i] = 0
        }

        if digits.first == 0 {
            digits.insert(1, at: 0)
        }
        
        return digits
    }
    
    // If numner is less than Int.Max
    func plusOne1(_ digits: [Int]) -> [Int] {
        return String(Int(digits.map(String.init).joined())! + 1).utf8.map{ Int($0) - 48 }
    }
}

let sol = Solution()
let sTime = Date().timeIntervalSince1970
sol.plusOne([1,2,3]) // [1,2,4]
sol.plusOne([4,3,2,1]) // [4,3,2,2]
sol.plusOne([1,2,0]) // [1,2,1]
sol.plusOne([1,2,9]) // [1,3,0]
sol.plusOne([1,9,9]) // [2,0,0]
sol.plusOne([9,9,9]) // [1,0,0,01zsasa`a`   wss `sa     A]
let eTime = Date().timeIntervalSince1970
print("Difference: ", eTime - sTime)


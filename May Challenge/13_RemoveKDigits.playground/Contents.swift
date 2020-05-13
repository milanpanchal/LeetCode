/*:
# Remove K Digits
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3328/

 ---

### Problem Statement:

 Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

### Example:

 ```
 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.

 ```
 
 ### Notes:
 + The length of num is less than 10002 and will be ≥ k.
 + The given num does not contain any leading zero.
 
 */

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        
        if k <= 0 { return num }
        if num.count <= k { return "0" }
        
        var totalDigitsToBeRemoved = k
        
        var stack = [String.Element]()
        for digit in num {
            
            while let lastDigit = stack.last, digit < lastDigit, totalDigitsToBeRemoved > 0 {
                stack.removeLast()
                totalDigitsToBeRemoved -= 1
            }
            
            stack.append(digit)
        }
        
        while totalDigitsToBeRemoved > 0 {
            stack.removeLast()
            totalDigitsToBeRemoved -= 1
            
        }
        
        // Removing Leading Zeros
        while stack.first == "0" {
            stack.removeFirst()
        }
        
        
        return stack.count > 0 ? String(stack) : "0"
    }
}

let obj = Solution()
obj.removeKdigits("1432219", 3) // 1219
obj.removeKdigits("10200", 1) // 200
obj.removeKdigits("10", 2) // 0
obj.removeKdigits("100", 1) // 0


/*:
# Add Digits
  https://leetcode.com/submissions/detail/371930172/?from=/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3402/

 ---

### Problem Statement:
 Given a non-negative integer `num`, repeatedly add all its digits until the result has only one digit.


### Example:

 ```
 Input: 38
 Output: 2
 Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
              Since 2 has only one digit, return it.

 ```
 
 ### Follow up::
 + Could you do it without any loop/recursion in O(1) runtime?

 ### Hint:
 + A naive implementation of the above process is trivial. Could you come up with other methods?
 + What are all the possible results?
 + How do they occur, periodically or randomly?
 + You may find this Wikipedia article useful. https://en.wikipedia.org/wiki/Digital_root
 
 */


import UIKit

class Solution {
    
    // Using Recursion
    func addDigits(_ num: Int) -> Int {
        if num < 10 {
            return num
        }
        
        var sum = 0
        var num = num
        while num > 0 {
            sum += num % 10
            num /= 10
        }
        
        return addDigits(sum)
    }
    
    // Without Recursion
    func addDigits1(_ num: Int) -> Int {
        guard num >= 10 else {
            return num
        }
        
        var digitalRoots = 0
        var num = num
        
        while num > 0 {
            digitalRoots += num % 10
            num /= 10
            
            if num == 0, digitalRoots > 9 {
                num = digitalRoots
                digitalRoots = 0
            }
        }
        
        return digitalRoots
    }
    
    // Using Math equation
    // Time Complexity: O(1)
    // Space Complexity: O(1)

    func addDigits2(_ num: Int) -> Int {
        if num == 0 { return 0 }
        if num % 9 == 0 { return 9 }
        return num % 9
    }
    
    // Using Math equation
    // Combining last 2 cases
    
    func addDigits3(_ num: Int) -> Int {
        return num == 0 ? 0 : 1 + (num - 1) % 9
    }

}

let sol = Solution()
sol.addDigits(38) // 2
sol.addDigits1(38) // 2
sol.addDigits2(38) // 2
sol.addDigits3(38) // 2

/*:
# Power of Four
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3412/

 ---

### Problem Statement:

 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.


### Example:

 ```
 Input: 16
 Output: true

 Input: 5
 Output: false

 ```
 
 ### Follow up:
 + Could you solve it without loops/recursion?
 
 */


import UIKit

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        return num > 0 && (num & (num - 1)) == 0 && (num - 1) % 3 == 0
    }

    func isPowerOfFour2(_ num: Int) -> Bool {
        let logValue = log(Double(num)) / log(4)
        return num > 0 && logValue == trunc(logValue)
    }

}

let sol = Solution()
sol.isPowerOfFour(16)
sol.isPowerOfFour(5)
sol.isPowerOfFour(8)


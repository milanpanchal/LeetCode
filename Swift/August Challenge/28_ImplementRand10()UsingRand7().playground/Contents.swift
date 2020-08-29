/*:
# Implement Rand10() Using Rand7()
 https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3439/

 ---

### Problem Statement:
 
 Given the API `rand7` which generates a uniform random integer in the range 1 to 7, write a function `rand10` which generates a uniform random integer in the range 1 to 10. You can only call the API `rand7` and you shouldn't call any other API. Please don't use the system's `Math.random()`.

 Notice that Each test case has one argument `n`, the number of times that your implemented function `rand10` will be called while testing.



### Example:

 ```
 Input: n = 1
 Output: [2]

 Input: n = 2
 Output: [2,8]

 Input: n = 3
 Output: [3,8,10]

 ```
 
 ### Constraints:
 + 1 <= n <= 10^5

 ### Follow up:
 + What is the [expected](https://en.wikipedia.org/wiki/Expected_value) value for the number of calls to `rand7()` function?
 + Could you minimize the number of calls to `rand7()`?
 
 */


import UIKit

/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */

class Solution: SolBase {
    func rand10() -> Int {
        let result = (rand7() - 1) * 7 + rand7()

        if result <= 40 {
            return result % 10 + 1
        }

        return rand10()
    }
}

let sol = Solution()
sol.rand10()

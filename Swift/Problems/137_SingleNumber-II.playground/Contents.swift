/*:
# 137. Single Number II
https://leetcode.com/problems/single-number-ii/

 ---

### Problem Statement:

 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

### Example:

 ```
 Input: [2,2,3,2]
 Output: 3

 Input: [0,1,0,1,0,1,99]
 Output: 99

 ```

 ### Notes:
 + Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 */

import UIKit

class Solution {
    
    //    11 / 11 test cases passed.
    //    Status: Accepted
    //    Runtime: 56 ms
    //    Memory Usage: 21.5 MB
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        var res = [Int:Int]()
        
        for n in nums {
            res[n, default: 0] += 1
        }
        
        for (k,v) in res {
            if v == 1 { return k}
        }
        return -1
    }
    
    func singleNumberHOF(_ nums: [Int]) -> Int {
        let res = nums.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
        return res.first(where: { $0.value == 1 })?.key ?? -1
        
    }
}

let sol = Solution()
sol.singleNumber([2,2,3,2]) // 3
sol.singleNumberHOF([0,1,0,1,0,1,99]) // 99


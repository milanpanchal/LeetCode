/*:
# 136. Single Number
  https://leetcode.com/problems/single-number/

 ---

### Problem Statement:
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

### Example:

 ```
 Input: [2,2,1]
 Output: 1
 
 Input: [4,1,2,1,2]
 Output: 4
 ```
 
 ### Notes:
 + Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 */


import UIKit

class Solution {

//    16 / 16 test cases passed.
//    Status: Accepted
//    Runtime: 120 ms
//    Memory Usage: 21 MB

    func singleNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var count = 0
        while count < nums.count - 1 {
            if nums[count] != nums[count+1] {
                return nums[count]
            }
            count += 2
        }
        return nums.last ?? Int.max
    }
    
    func singleNumber2(_ nums: [Int]) -> Int {
        var res = nums[0]
        for i in 1..<nums.count {
            res ^= nums[i]
        }
        
        return res
    }
    
//    16 / 16 test cases passed.
//    Status: Accepted
//    Runtime: 96 ms
//    Memory Usage: 20.6 MB

    func singleNumber3(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}

let sol = Solution()
sol.singleNumber([2,2,1]) // 1
sol.singleNumber([4,1,2,1,2]) // 4

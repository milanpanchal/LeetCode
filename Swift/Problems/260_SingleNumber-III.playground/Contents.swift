/*:
# 260. Single Number III
  https://leetcode.com/problems/single-number-iii/

 ---

### Problem Statement:

 Given an array of numbers `nums`, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.


### Example:

 ```
 Input:  [1,2,1,3,2,5]
 Output: [3,5]

 ```
 
 ### Notes:
 + The order of the result is not important. So in the above example, `[5, 3]` is also correct.
 + Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?

 */


import UIKit

class Solution {
    
    //    30 / 30 test cases passed.
    //    Status: Accepted
    //    Runtime: 100 ms
    //    Memory Usage: 21.7 MB
    
    func singleNumber(_ nums: [Int]) -> [Int] {
        var hashMap = [Int: Int]()
        
        for n in nums {
            hashMap[n] = (hashMap[n] == nil) ? 1 : nil
        }
        return Array(hashMap.keys)
    }
    
    func singleNumber1(_ nums: [Int]) -> [Int] {
        let diff = nums.reduce(0, ^)
        let mask = diff & -diff
        let num1 = nums.reduce(into: Int(0), {
            if $1 & mask != 0 { $0 ^= $1 }
        })
        
        return [num1, num1 ^ diff]
    }
    
    func singleNumber3(_ nums: [Int]) -> [Int] {
        var set: Set<Int> = []
        
        for n in nums {
            if set.contains(n) {
                set.remove(n)
            } else {
                set.insert(n)
            }
        }
        
        return Array(set)
    }
}

let sol = Solution()
sol.singleNumber([1,2,1,3,2,5]) // [3,5]


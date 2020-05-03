/*:

 # 1. Two Sum
 https://leetcode.com/problems/two-sum/
 
 ---

### Problem Statement:

 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.


### Example:

```
 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].


 ```
 */
import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (index, value) in nums.enumerated() {
            let secondValue = target - value
                        
            if let secondValIndex = nums.lastIndex(of: secondValue), secondValIndex != index {
                return [index, secondValIndex]
            }
        }
        return []
    }
    
    // Optimized Solution
    func twoSumRevised(_ nums: [Int], _ target: Int) -> [Int] {
        
        var mapping = [Int: Int]()
        
        for (index, value) in nums.enumerated() {
            let secondValue = target - value
                        
            if let secondValIndex = mapping[secondValue] {
                return [secondValIndex, index]
            }
            mapping[value] = index
        }
        
        return []
    }
}

let obj = Solution()
obj.twoSum([2, 7, 11, 15], 9) // [0, 1]
obj.twoSum([3, 2, 4], 6) // [1, 2]
obj.twoSum([3, 3], 6) // [0, 1]



obj.twoSumRevised([2, 7, 11, 15], 9) // [0, 1]
obj.twoSumRevised([3, 2, 4], 6) // [1, 2]
obj.twoSumRevised([3, 3], 6) // [0, 1]

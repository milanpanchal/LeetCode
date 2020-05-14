/*:
# Majority Element

 https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3321/
 
 ---

### Problem Statement:

 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.


### Example:

```
 Input: [3,2,3]
 Output: 3

 Input: [2,2,1,1,1,2,2]
 Output: 2
 ```

 */

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        precondition(nums.count > 0, "nums size should be more than 0")
        // check for best condition
        if nums.count == 1 {
            return nums.first!
        }
        
        var dict = [Int: Int]()
        
        for n in nums {
            dict[n] = (dict[n] ?? 0) + 1
        }
        
        let majorityElementSize = nums.count/2 + 1
        print(nums.count, majorityElementSize)
        for (key, val) in dict {
            if val >= majorityElementSize {
                return key
            }
        }
        return -1
    }
    
    func majorityElementRevisied(_ nums: [Int]) -> Int {
           var result: Int = nums[0]
           var count: Int = 1
           for i in 1..<nums.count {
               if count == 0 {
                   result = nums[i]
                   count = 1
               } else if result == nums[i] {
                   count += 1
               } else {
                   count -= 1
               }
           }
           return result
       }
}

let obj = Solution()
obj.majorityElement([3,2,3])
obj.majorityElement([2,2,1,1,1,2,2])
obj.majorityElement([2,2,1,1,1,2,2,1])


obj.majorityElementRevisied([3,2,3])
obj.majorityElementRevisied([2,2,1,1,1,2,2])
obj.majorityElementRevisied([2,2,1,1,1,2,2,1])

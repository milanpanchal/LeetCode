/*:
# 3Sum
  https://leetcode.com/explore/featured/card/july-leetcoding-challenge/545/week-2-july-8th-july-14th/3384/

 ---

### Problem Statement:
 
 Given an array `nums` of n integers, are there elements a, b, c in `nums` such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

### Example:

 ```
 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 
 ```
 
 ### Constraints:
 + So, we essentially need to find three numbers x, y, and z such that they add up to the given value. If we fix one of the numbers say x, we are left with the two-sum problem at hand!

 + For the two-sum problem, if we fix one of the numbers, say `x` , we have to scan the entire array to find the next number `y` which is `value - x` where value is the input parameter. Can we change our array somehow so that this search becomes faster?

 + The second train of thought for two-sum is, without changing the array, can we use additional space somehow? Like maybe a hash map to speed up the search?

 ### Notes:
 + The solution set must not contain duplicate triplets.
 
 */

import UIKit

// TLE - Time limit exception
// Brute force solution
class Solution1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j + 1..<nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        if !result.contains([nums[i], nums[j], nums[k]]) {
                            result.append([nums[i], nums[j], nums[k]])
                        }
                    }
                }
            }
        }
        print(result)
        return result
    }
        
}

// Using twoSum function
class Solution2 {
    var result = [[Int]]()

    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count >= 3 else {
            return []
        }
        
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            twoSum(i + 1, nums.count - 1, nums, -nums[i])
        }
        
        return result
    }
    
    func twoSum(_ start: Int, _ end: Int, _ nums: [Int], _ target: Int) {
        var start = start
        var end = end
        while start < end {
            if nums[start] + nums[end] == target {
                result.append([-target, nums[start], nums[end]])
                start += 1
                end -= 1
                
                while start < end && nums[start] == nums[start - 1] {
                    start += 1
                }
                
                while start < end && nums[end] == nums[end + 1] {
                    end -= 1
                }
            }
            else if nums[start] + nums[end] < target {
                start += 1
            }
            else {
                end -= 1
            }
        }
    }
}

// 313 / 313 test cases passed.
// Status: Accepted
// Runtime: 432 ms
// Memory Usage: 23.4 MB

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
      
        let nums = nums.sorted()
        var current = 0
        
        while current < (nums.count - 2) {
            
            var start = current + 1
            var end = nums.count - 1
            let firstValue = nums[current]
            while start < end {
                let sum = firstValue + nums[start] + nums[end]
                
                if sum == 0 {
                    result.append([firstValue, nums[start], nums[end]])
                }
                    
                if sum < 0 {
                    let currentStart = start
                    while start < end && nums[start] == nums[currentStart] {
                        start += 1
                    }
                } else {
                    let currentEnd = end
                    while start < end && nums[end] == nums[currentEnd] {
                        end -= 1
                    }
                }
            }
            
            let currentIndex = current
            while current < (nums.count - 2) && nums[current] == nums[currentIndex] {
                current += 1
            }
        }
        
        return result
    }

}
let sol = Solution2()
sol.threeSum([-1,0,1,2,-1,-4]) // [[-1, 0, 1], [-1, -1, 2]]
sol.threeSum([13,-14,-10,-4,4,4,0,-14,5,-9,-3,-10,14,7,-3,-4,-3,12,-14,2,-11,-6,0,-7,13,-2,-7,-11,-14,-13,5,14,-12,11,-13,-1,-8,2,0,4,1,4,10,-8,-11,-8,3,1,11,4,-12,8,5,-4,-14,-4,9,-13,-8,2,-11,12,-7,14,0,-5,-2,7,5,5,-3,13,-6,-8,-10,-10,-9,0,6,-12,11,2,11,1,13,4,12,-1,6,-11,-14,2,9,-6,1,-6,-4,14,-13,8,4,-1,6,6,-2,11,11,4,-4,-5,-1,-8,12,-13,1,10,7,-10,-14,-10,-5,-13,0,11])


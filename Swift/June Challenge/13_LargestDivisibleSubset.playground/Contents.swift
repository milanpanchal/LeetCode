/*:
# Largest Divisible Subset
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3359/

 ---

### Problem Statement:

 Given a set of `distinct` positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:

 ```Si % Sj = 0 or Sj % Si = 0.```

 If there are multiple solutions, return any subset is fine.


### Example:

 ```
 Input: [1,2,3]
 Output: [1,2] (of course, [1,3] will also be ok)

 Input: [1,2,4,8]
 Output: [1,2,4,8]

 ```

 
 */

import UIKit


//41 / 41 test cases passed.
//Status: Accepted
//Runtime: 104 ms
//Memory Usage: 21.4 MB

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        
        guard nums.count > 1 else {
            return nums
        }
        
        let sortedNums = nums.sorted()
        var dp = Array(repeating: 0, count: sortedNums.count)
        var prev = Array(repeating: -1, count: sortedNums.count)
        var maxIndex = 0
        
        for i in 1..<sortedNums.count {
            for j in 0..<i {
                if (sortedNums[i] % sortedNums[j] == 0),
                    (dp[i] < dp[j] + 1) {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
            
            // Update maxSubset size
            if dp[i] > dp[maxIndex] {
                maxIndex = i
            }
            
        }
        
        var maxSubset = [Int]()
        while maxIndex >= 0 {
            maxSubset.append(sortedNums[maxIndex])
            maxIndex = prev[maxIndex]
        }
        
        return maxSubset
    }
}
//
//largestDivisibleSubset([1,2,3])             // [1, 2] or [1, 3]
//largestDivisibleSubset([1, 16, 7, 8, 4])    // [1, 16, 8, 4]
//largestDivisibleSubset([2, 4, 3, 8])        // [2, 4, 8]

class Solution2 {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        guard !nums.isEmpty else { return [] }
        var dict = [Int: [Int]]()
        for i in 0..<nums.count {
            dict[i] = [nums[i]]
        }
        var resArray = [nums[0]]
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 || nums[j] % nums[i] == 0 {
                   var array = dict[j, default: []]
                   array.append(nums[i])
                   if dict[i, default: []].count < array.count {
                       dict[i, default: []] = array
                   }
                    
                   if resArray.count < array.count {
                       resArray = array
                   }
                }
            }
        }
        
        return resArray
    }
}

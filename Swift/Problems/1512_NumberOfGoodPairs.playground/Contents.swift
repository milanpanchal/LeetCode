/*:
# 1512. Number of Good Pairs
  https://leetcode.com/problems/number-of-good-pairs/

 ---

### Problem Statement:
 
 Given an array of integers nums.

 A pair `(i,j)` is called good if `nums[i] == nums[j]` and `i < j`.

 Return the number of good pairs.

### Example:

 ```
 Input: nums = [1,2,3,1,1,3]
 Output: 4
 Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.

 Input: nums = [1,1,1,1]
 Output: 6
 Explanation: Each pair in the array are good.

 Input: nums = [1,2,3]
 Output: 0

 ```
 
 ### Constraints:
 + 1 <= nums.length <= 100
 + 1 <= nums[i] <= 100

 */

import UIKit

class Solution {
    
//    48 / 48 test cases passed.
//    Status: Accepted
//    Runtime: 12 ms
//    Memory Usage: 20.5 MB

    func numIdenticalPairs(_ nums: [Int]) -> Int {
 
        if nums.count <= 1 {
            return 0
        }

        var count = 0
        
        for i in 0..<nums.count - 1 {
            for j in i+1..<nums.count where nums[i] == nums[j] {
                count += 1
            }
        }
        
        return count
    }
}

let sol = Solution()
sol.numIdenticalPairs([1,2,3,1,1,3])    // 4
sol.numIdenticalPairs([1,1,1,1])        // 6
sol.numIdenticalPairs([1,2,3])          // 0

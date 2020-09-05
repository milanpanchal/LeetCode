/*:
# 02. Contains Duplicate III

 https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3446/

 ---

### Problem Statement:

 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.


### Example:

 ```
 Input: nums = [1,2,3,1], k = 3, t = 0
 Output: true

 Input: nums = [1,0,1,1], k = 1, t = 2
 Output: true

 Input: nums = [1,5,9,1,5,9], k = 2, t = 3
 Output: false
 ```

 
 ### Constraints:
 + 0 <= nums.length <= 2 * 10^4
 + -2^31 <= nums[i] <= 2^31 - 1
 + 0 <= k <= 10^4
 + 0 <= t <= 2^31 - 1


 ### Hint:
 + Time complexity O(n logk) - This will give an indication that sorting is involved for k elements.
 + Use already existing state to evaluate next state - Like, a set of k sorted numbers are only needed to be tracked. When we are processing the next number in array, then we can utilize the existing sorted state and it is not necessary to sort next overlapping set of k numbers again.

 
 */

import UIKit

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        
        if nums.count < 2 {
            return false
        }
        
        var indices = [Int](0 ..< nums.count)
        indices = indices.sorted(by: { a, b in nums[a] < nums[b] } )
        
        for i in 0 ..< nums.count {
            let x = indices[i]
            for j in (i + 1) ..< nums.count {
                let y = indices[j]
                let diffNums = nums[y] - nums[x]
                let diffIndex = abs(x - y)
                if diffNums > t {
                     break
                }
                if diffIndex <= k {
                    return true
                }
            }
        }
        return false
    }
}

let sol = Solution()
sol.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0)  // true
sol.containsNearbyAlmostDuplicate([1,0,1,1], 1, 2)  // true
sol.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3)  // false

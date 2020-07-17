/*:
# Top K Frequent Elements
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3393/

 ---

### Problem Statement:
 Given a non-empty array of integers, return the `k` most frequent elements.

### Example:

 ```
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]

 Input: nums = [1], k = 1
 Output: [1]

 ```
 
 ### Note:
 + You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 + Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 + It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
 + You can return the answer in any order.

 */

import UIKit

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
     
        return []
    }
}

let sol = Solution()
sol.topKFrequent([1,1,1,2,2,3], 2) // [1, 2]
sol.topKFrequent([1], 1) // [1]

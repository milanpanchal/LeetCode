/*:
# 274. H-Index [Medium]
  https://leetcode.com/problems/h-index/

 ---

### Problem Statement:

 Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

 According to the [definition of h-index on Wikipedia](https://en.wikipedia.org/wiki/H-index): "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."


### Example:

 ```
 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
              received 3, 0, 6, 1, 5 citations respectively.
              Since the researcher has 3 papers with at least 3 citations each and the remaining
              two with no more than 3 citations each, her h-index is 3.

 ```
 
 ### Hint:
 + An easy approach is to sort the array first.
 + What are the possible values of h-index?
 + A faster approach is to use extra space.


 ### Notes:
 + If there are several possible values for h, the maximum one is taken as the h-index.

 */


class Solution {
    
//    82 / 82 test cases passed.
//    Status: Accepted
//    Runtime: 16 ms
//    Memory Usage: 21.5 MB
    func hIndex(_ citations: [Int]) -> Int {
        
        guard !citations.isEmpty else {
            return 0
        }
        
        let citations = citations.sorted(by: >)
        var count = 0
        
        for c in citations {
            if count + 1 > c {
                return count
            }
            
            count += 1
        }
        
        return count
    }
    
    func hIndex2(_ citations: [Int]) -> Int {
        
        guard !citations.isEmpty else {
            return 0
        }
        
        let count = citations.count
        var papers = Array(repeating: 0, count: count + 1)
        for i in stride(from: 0, to: count, by: 1) {
            if citations[i] > count {
                papers[count] += 1
            } else {
                papers[citations[i]] += 1
            }
        }
        
        var t = 0
        for i in stride(from: count, through: 0, by: -1) {
            t = t + papers[i]
            if t >= i { return i }
        }
        return 0
    }
        
}

let sol = Solution()
sol.hIndex([3,0,6,1,5]) // 3
sol.hIndex2([3,0,6,1,5]) // 3


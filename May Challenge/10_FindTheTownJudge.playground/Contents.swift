/*:
# Find the Town Judge
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3325/

 ---

### Problem Statement:

 In a town, there are `N` people labelled from `1` to `N`.  There is a rumor that one of these people is secretly the town judge.

 If the town judge exists, then:

 1. The town judge trusts nobody.
 2. Everybody (except for the town judge) trusts the town judge.
 3. There is exactly one person that satisfies properties 1 and 2.

 You are given `trust`, an array of pairs `trust[i] = [a, b]` representing that the person labelled `a` trusts the person labelled `b`.

 If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return` -1`.


### Example:

 ```
 Input: N = 2, trust = [[1,2]]
 Output: 2

 Input: N = 3, trust = [[1,3],[2,3]]
 Output: 3

 Input: N = 3, trust = [[1,3],[2,3],[3,1]]
 Output: -1

 Input: N = 3, trust = [[1,2],[2,3]]
 Output: -1

 Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
 Output: 3
 
 ```
 

 ### Notes:
 + 1 <= N <= 1000
 + trust.length <= 10000
 + trust[i] are all different
 + trust[i][0] != trust[i][1]
 + 1 <= trust[i][0], trust[i][1] <= N
 
 */

class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        if N == 1 { return 1 }
        if trust.count <= 0 { return -1 }
        
        var trustCounter = Array(repeating: 0, count: N)
        
        for eachPair in trust {
            let person = eachPair[0], trustPerson = eachPair[1]
            trustCounter[person - 1] -= 1
            trustCounter[trustPerson - 1] += 1
        }
        
        for (index, count) in trustCounter.enumerated() {
            if count == N-1 {
                return index + 1
            }
        }
        return -1
    }
}

let obj = Solution()
obj.findJudge(2, [[1,2]]) // 2
obj.findJudge(3, [[1,3],[2,3]]) // 3
obj.findJudge(3, [[1,3],[2,3],[3,1]]) // -1
obj.findJudge(3, [[1,2],[2,3]]) // -1
obj.findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]]) // 3
obj.findJudge(1, []) // 1


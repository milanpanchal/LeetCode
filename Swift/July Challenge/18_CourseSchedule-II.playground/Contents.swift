/*:
# Course Schedule II
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3394/

 ---

### Problem Statement:
 
 There are a total of n courses you have to take, labeled from `0` to `n-1`.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.


### Example:

 ```
 Input: 2, [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
              course 0. So the correct course order is [0,1] .

 Input: 4, [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,1,2,3] or [0,2,1,3]

 ```
 
 ### Constraints:
 + This problem is equivalent to finding the topological order in a directed graph. If a cycle exists, no topological ordering exists and therefore it will be impossible to take all courses.
 + Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera explaining the basic concepts of Topological Sort. (https://class.coursera.org/algo-003/lecture/52)
 + Topological sort could also be done via BFS.

 ### Notes:
 + The input prerequisites is a graph represented by a list of edges, not adjacency matrices.
 + You may assume that there are no duplicate edges in the input prerequisites.
 
 */


import UIKit

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
    }
}

let sol = Solution()


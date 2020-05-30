/*:
# Course Schedule
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/538/week-5-may-29th-may-31st/3344/
 
 ---

### Problem Statement:

 There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses-1`.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: `[0,1]`

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?


### Example 1:

 ```
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0. So it is possible.

 ```

 ### Example 2:

 ```
 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0, and to take course 0 you should
              also have finished course 1. So it is impossible.

 ```

 ### Constraints:
 + The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 + You may assume that there are no duplicate edges in the input prerequisites.
 + 1 <= numCourses <= 10^5


 ### Hint:
 + This problem is equivalent to finding if a cycle exists in a directed graph. If a cycle exists, no topological ordering exists and therefore it will be impossible to take all courses.

 + Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera explaining the basic concepts of Topological Sort.

 + Topological sort could also be done via BFS.
 
 */

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var array = Array(repeatElement(Array(repeatElement(0, count: numCourses)), count: numCourses))
        var inDegree = Array(repeatElement(0, count: numCourses))
        var count = 0
        var queue = [Int]()
        
        for val in prerequisites {
            let firstVal = val[0]
            let lastVal = val[1]
            if array[lastVal][firstVal] == 0  {
                inDegree[firstVal] += 1
            }
            array[lastVal][firstVal] = 1
        }
        for i in 0..<inDegree.count {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        while queue.count > 0 {
            let course = queue.removeFirst()
            count += 1
            for i in 0..<numCourses {
                if array[course][i] != 0 {
                    inDegree[i] -= 1
                    if inDegree[i] == 0 {
                        queue.append(i)
                    }
                }
            }
        }
        
        return count == numCourses
    }
}

Solution().canFinish(2, [[1, 0]]) // true
Solution().canFinish(2, [[1, 0], [0, 1]]) // false


enum Status {
    case visited
    case inProgress
    case notStarted
}

class Solution1 {
    func canFinish(_ n: Int, _ prerequisites: [[Int]]) -> Bool {
        var G = [Int: [Int]]()
        var visited = Array(repeating: Status.notStarted, count: n)
        
        for pair in prerequisites {
            G[pair[1], default: []].append(pair[0])
        }
        
        func hasCycle(_ u: Int) -> Bool {
            if visited[u] == .visited {
                return false
            }
            if visited[u] == .inProgress {
                return true
            }
            
            visited[u] = .inProgress
            
            for v in G[u, default: []] {
                if hasCycle(v) {
                    return true
                }
            }
            
            visited[u] = .visited
            
            return false
        }
        
        for u in 0..<n {
            if hasCycle(u) {
                return false
            }
        }
        
        return true
    }
}

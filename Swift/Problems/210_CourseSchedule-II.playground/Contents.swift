/*:
# Course Schedule II
  https://leetcode.com/problems/course-schedule-ii/

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

// Using Depth First Search Algo
class Solution {
   
//    44 / 44 test cases passed.
//    Status: Accepted
//    Runtime: 148 ms
//    Memory Usage: 22.1 MB

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var stack:[Int] = []
        var graph:[[Int]] = Array(repeating: [], count: numCourses)
        var visited:[Int] = Array(repeating: 0, count: numCourses)

        for subArray in prerequisites {
            graph[subArray[0]].append(subArray[1])
        }
        // print(graph)
        
        for i in 0..<numCourses {
            if dfs(graph, visited: &visited, i, &stack) {
                return []
            }
        }
        
        return stack
    }
    
    private func dfs(_ graph: [[Int]], visited: inout[Int], _ course: Int, _ stack: inout[Int]) -> Bool {
        
        if visited[course] == 2 { return false } // already visited
        if visited[course] == 1 { return true } // cycle detection
        visited[course] = 1
        
        for i in 0..<graph[course].count {
            if dfs(graph, visited: &visited, graph[course][i], &stack) {
                return true
            }
        }
        
        stack.append(course)
        visited[course] = 2
        
        return false
    }
}

// Using Node Indegree
class Solution2 {
    
//    44 / 44 test cases passed.
//    Status: Accepted
//    Runtime: 192 ms
//    Memory Usage: 21 MB

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        var inDegreeNodeCount = Array(repeating: 0, count: numCourses)
        var array = Array(repeating: [Int](), count: numCourses)
        
        for course in prerequisites {
            array[course[1]].append(course[0])
            inDegreeNodeCount[course[0]] += 1
        }
        
        var queue = [Int]()
        var result = [Int]()
        
        // Get all the courses whose in-degree = 0
        for i in 0..<numCourses where inDegreeNodeCount[i] == 0 {
            queue.append(i)
        }

        while !queue.isEmpty {
            let removedCourse = queue.removeFirst()
            result.append(removedCourse)
            
            // Decrease in-degree by 1 and add in to stack if its reach to 0
            for course in array[removedCourse] {
                inDegreeNodeCount[course] -= 1
                if inDegreeNodeCount[course] == 0 {
                    queue.append(course)
                }
                
            }
        }
        
        return result.count == numCourses ? result : [Int]()
    }
}

let sol = Solution2()
sol.findOrder(2, [[1,0]]) // [0,1]
sol.findOrder(4, [[1,0],[2,0],[3,1],[3,2]]) // [0,1,2,3] or [0,2,1,3]

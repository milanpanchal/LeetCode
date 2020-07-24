/*:
# 797. All Paths From Source to Target (Medium)
  https://leetcode.com/problems/all-paths-from-source-to-target/

 ---

### Problem Statement:
 Given a directed, acyclic graph of `N` nodes.  Find all possible paths from node `0` to node `N-1`, and return them in any order.

 The graph is given as follows:  the nodes are 0, 1, ..., graph.length - 1.  graph[i] is a list of all nodes j for which the edge (i, j) exists.


### Example:

 ```
 Input: [[1,2], [3], [3], []]
 Output: [[0,1,3],[0,2,3]]
 Explanation: The graph looks like this:
 
 0--->1
 |    |
 v    v
 2--->3
 
 There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

 ```
 
 ### Notes:
 + The number of nodes in the graph will be in the range `[2, 15]`.
 + You can print different paths in any order, but you should keep the order of nodes inside one path.
 
 */


import UIKit

// 26 / 26 test cases passed.
// Status: Accepted
// Runtime: 152 ms
// Memory Usage: 21.7 MB

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        
        var result = [[Int]]()
        var path = [0] // path always starts from node 0
        dfs(graph, 0, &path, &result)
        return result

    }
    
    private func dfs(_ graph: [[Int]], _ node: Int, _ path: inout [Int], _ result: inout [[Int]]) {
        if node == graph.count - 1 { // path ends at node N - 1
            result.append(path)
        }

        for n in graph[node] {
            path.append(n)
            dfs(graph, n, &path, &result)
            path.removeLast() // backtracking
        }
    }

}

class Solution1 {
    
    var seenPaths = [Int: [[Int]]]()

    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        
        guard graph.count > 0 else {
            return [[]]
        }
        
        return allPaths(from: 0, to: graph.count - 1, graph: graph)
    }
        
    func allPaths(from: Int, to: Int, graph: [[Int]]) -> [[Int]] {
       
        if from == to {
            return [[to]]
        }
        
        if let paths = seenPaths[from] {
            return paths
        }
        
        var paths = [[Int]]()
        for next in graph[from] {
            let nextPaths = allPaths(from: next, to: to, graph:graph)
            paths += nextPaths
        }
        
        let fromPaths = paths.map { [from] + $0 }
        seenPaths[from] = fromPaths
        return fromPaths
    }
}

let sol = Solution()
sol.allPathsSourceTarget([[1,2],[3],[3],[]]) // [[0,1,3], [0,2,3]]
 

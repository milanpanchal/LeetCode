/*:
# Count Complete Tree Nodes
 https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3369/
 
 ---

### Problem Statement:
 Given a complete binary tree, count the number of nodes.

 Note:

 [Definition of a complete binary tree from Wikipedia:](https://en.wikipedia.org/wiki/Binary_tree#Types_of_binary_trees)
 
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2^h nodes inclusive at the last level h.



### Example:

 ```
 Input:
     1
    / \
   2   3
  / \  /
 4  5 6

 Output: 6
 ```
 
 */
import UIKit


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    
    
    //    18 / 18 test cases passed.
    //    Status: Accepted
    //    Runtime: 84 ms
    //    Memory Usage: 22 MB
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        return 1 + countNodes(root!.left) + countNodes(root!.right)
        
    }
}

let node = TreeNode(1)
node.left = TreeNode(2)
node.right = TreeNode(3)
node.left?.left = TreeNode(4)
node.left?.right = TreeNode(5)
node.right?.left = TreeNode(6)

let sol = Solution()
sol.countNodes(node)


/*:
# Construct Binary Search Tree from Preorder Traversal
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3339/
 
 ---

### Problem Statement:

 Return the root node of a binary search tree that matches the given `preorder` traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of `node.left` has a value `<` `node.val`, and any descendant of `node.right` has a value `>` `node.val`.  Also recall that a preorder traversal displays the value of the `node` first, then traverses `node.left`, then traverses `node.right`.)

 It's guaranteed that for the given test cases there is always possible to find a binary search tree with the given requirements.


### Example:

 ```
 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]

       8
      / \
     5   10
    / \   \
   1   7   12

 ```
 
 ### Constraints:
 + 1 <= preorder.length <= 100
 + 1 <= preorder[i] <= 10^8
 + The values of preorder are distinct.
 
 */

import UIKit

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

extension TreeNode {
    func add(_ element: Int) {
        if element > val {
            if let right = right {
                right.add(element)
            }
            else {
                right = TreeNode(element)
            }
        }
        else {
            if let left = left {
                left.add(element)
            }
            else {
                left = TreeNode(element)
            }
        }
    }
}

class Solution {
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        
        guard let rootValue = preorder.first else {
            return nil
        }
        
        let rootNode = TreeNode(rootValue)
        
        for eachElement in preorder[1...] {
            rootNode.add(eachElement)
        }
        return rootNode
    }
    
}

/*:
# Delete Node in a BST
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/553/week-5-august-29th-august-31st/3443/

 ---

### Problem Statement:

 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 + Search for a node to remove.
 + If the node is found, delete the node.

### Example:

 ```
 root = [5,3,6,2,4,null,7]
 key = 3

     5
    / \
   3   6
  / \   \
 2   4   7

 Given key to delete is 3. So we find the node with value 3 and delete it.

 One valid answer is [5,4,6,2,null,null,7], shown in the following BST.

     5
    / \
   4   6
  /     \
 2       7

 Another valid answer is [5,2,6,null,4,null,7].

     5
    / \
   2   6
    \   \
     4   7
 
 ```
 
 ### Notes:
 + Time complexity should be O(height of tree).

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

// 85 / 85 test cases passed.
// Status: Accepted
// Runtime: 80 ms
// Memory Usage: 22.4 MB

class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        guard let root = root else {
            return nil
        }
        
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
                let minNode = findMin(root.right!)
                root.val = minNode.val
                root.right = deleteNode(root.right, root.val)
            }
        }
        
        return root
    }
    
    func findMin(_ root: TreeNode) -> TreeNode {
        var root = root
        
        while let leftNode = root.left {
            root = leftNode
        }
        
        return root
    }
}

let node = TreeNode(5)
node.left = TreeNode(3)
node.right = TreeNode(6)
node.left?.left = TreeNode(2)
node.left?.right = TreeNode(4)
node.right?.right = TreeNode(7)


let sol = Solution()
sol.deleteNode(node, 3)

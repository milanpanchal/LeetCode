/*:
# Kth Smallest Element in a BST
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3335/

 ---

### Problem Statement:

 Given a binary search tree, write a function `kthSmallest` to find the kth smallest element in it.


### Example 1:

 ```
 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 
 Output: 1
 ```

 ### Example 2:

 ```
 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1

 Output: 3
 ```
 ### Follow up:
 + What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

 ### Notes:
 + You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 */

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
    // DFS: Inorder strategy
    // Time complexity : O(N) to build a traversal.
    // Space complexity : O(N) to keep an inorder traversal.

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var list = [Int]()
        
        func inOrderTraversal(_ root: TreeNode?) {
            
            guard let node = root else {return}
            
            inOrderTraversal(node.left)
            list.append(node.val)
            inOrderTraversal(node.right)
        }
        
        inOrderTraversal(root)
        
        return list[k-1]
    }
}


class Solution2 {
    // DFS: Inorder strategy
    // Time complexity : O(N) to build a traversal.
    // Space complexity : O(N) to keep an inorder traversal.
    
    private func inOrderTraversal(_ root: TreeNode?, _ arr: inout [Int]) -> [Int] {
        
        guard let node = root else { return arr }
        
        inOrderTraversal(node.left, &arr)
        arr.append(node.val)
        inOrderTraversal(node.right, &arr)
        return arr
    }
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var list = [Int]()
        inOrderTraversal(root, &list)
        
        return list[k-1]
    }
}

class Solution3 {
    // Iteration approch
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        
        var findIndex = k
        var node = root
        
        while true {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            findIndex -= 1
            if (findIndex == 0) {
                return node!.val
            }
            node = node?.right
        }
        
    }
}

let node = TreeNode(3)
node.left = TreeNode(1)
node.right = TreeNode(4)
node.left?.right = TreeNode(2)

let node2 = TreeNode(5)
node2.left = TreeNode(3)
node2.right = TreeNode(6)
node2.left?.left = TreeNode(2)
node2.left?.right = TreeNode(4)
node2.left?.left?.left = TreeNode(1)

let obj = Solution3()
obj.kthSmallest(node, 1)
obj.kthSmallest(node2, 3)

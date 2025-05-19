class TreeNode:
    def __init__(self, value=0, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def maxDepth(root: TreeNode) -> int:
    if root is None:
        return 0  # Base case: empty tree has depth 0
    
    left_depth = maxDepth(root.left)  # Recursively get left subtree depth
    right_depth = maxDepth(root.right)  # Recursively get right subtree depth

    return max(left_depth, right_depth) + 1  # Add 1 for the current node

# Example usage:
root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left.left = TreeNode(4)
root.left.right = TreeNode(5)

print(maxDepth(root))  # Output: 3 ✅

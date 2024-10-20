require_relative "lib/bfs_knight"

def main()
  knight_moves([0,0], [3, 3])
  knight_moves([3,3], [0, 0])
end

main()
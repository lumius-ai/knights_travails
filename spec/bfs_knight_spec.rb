require_relative "../lib/bfs_knight"

describe "BFS_knight functions" do
  describe "knight_neighbors" do
    n1 = [3,3]
    n1_neighbors = [[2,5], [4,5], [2,1], [4,1], [5,4], [1,4], [5,2], [1,2]]

    n2 = [0,7]
    n2_neighbors = [[1,5], [2,6]]
    xit "Gets all neighbors from coordinate" do
      
      expect(knight_neighbors(n1)).to eq(n1_neighbors)
    end

    xit "Ignores coords not on the board" do

      expect(knight_neighbors(n2)).to eq(n2_neighbors)
    end
  end

  describe "bfs_dict" do
    n1 = [3, 3]
    d1 = Hash[[3,3] => nil]
    n2 = [4, 3]

    xit "handles source and target being the same" do
      expect(bfs_dict(n1, n1)).to eq(d1)
    end


    xit "returns correct record of bfs search for target" do
      # No idea how to calculate the path by hand
      expect(bfs_dict(n1, n2).length).to eq(4)
    end
  end

  describe "bfs_path" do
    
    d1 = {
      [1,1] => nil, #origin
      [2,1] => [1,1],
      [2,2] => [1,1], # move 2
      [2,3] => [1,1],
      [3,1] => [2,2],
      [3,2] => [2,2],
      [3,3] => [2,2] # target
    }
    xit "correctly determines shortest path" do
      # Multiple possible paths, but the shortest is 3 moves
      expect(bfs_path(d1, [3,3]).length).to eq(3)
    end
  end

  describe "knight_moves" do
    s1 = knight_moves([-1, 8], [3, 3])
    s2 = knight_moves([3, 3], [-1, 8])

    it "handles invalid source" do

      expect(s1.nil?).to eq(true)
    end

    it "handles invalid target" do

      expect(s2.nil?).to eq(true)
    end

    xit "Correctly prints shortest path string" do

      # Read out the string on output

    end
  end
end

require_relative "../lib/bfs_knight"

describe "BFS_knight functions" do
  describe "knight_neighbors" do
    n1 = [3,3]
    n1_neighbors = [[2,5], [4,5], [2,1], [4,1], [5,4], [1,4], [5,2], [1,2]]

    n2 = [0,7]
    n2_neighbors = [[1,5], [2,6]]
    it "Gets all neighbors from coordinate" do
      
      expect(knight_neighbors(n1)).to eq(n1_neighbors)
    end

    it "Ignores coords not on the board" do

      expect(knight_neighbors(n2)).to eq(n2_neighbors)
    end
  end

  describe "bfs_dict" do
    n1 = [3, 3]
    d1 = Hash[[3,3] => nil]
    n2 = [4, 3]

    it "handles source and target being the same" do
      expect(bfs_dict(n1, n1)).to eq(d1)
    end


    it "returns correct record of bfs search for target" do
      # Multiple possible paths so just test path length
      expect(bfs_dict(n1, n2).length).to eq(4)
    end
  end

  describe "bfs_path" do
    
    d1 = bfs_dict([3, 3], [4, 3])
    it "correctly determines shortest path" do
      # Multiple possible paths, but the shortest is 3 moves
      expect(bfs_path(d1).length).to eq(4)
    end
  end

  describe "knight_moves" do
    s1 = knight_moves([-1, 8], [3, 3])
    s2 = knight_moves([3, 3], [-1, 8])
    s3 = knight_moves([3, 3], [4, 3])

    it "handles invalid source" do

      expect(s1.null?).to eq(true)
    end

    it "handles invalid target" do

      expect(s2.null?).to eq(true)
    end

    it "Correctly prints shortest path string" do

      # Read out the string on output

    end
  end
end

module Transformer
  def self.root
    @root ||= File.expand_path '../../../', __FILE__
  end

  def self.root=(path)
    @root = path
  end
end

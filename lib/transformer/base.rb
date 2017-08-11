module Transformer
  def self.root
    @root ||= File.expand_path '../../../', __FILE__
  end

  def self.root=(path)
    @root = path
  end

  def self.assumptions_path
    @assumptions_path ||= Pathname.new(root).join('assumptions.yml')
  end
end

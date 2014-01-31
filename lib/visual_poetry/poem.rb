class VisualPoetry::Poem
  attr_reader :title
  def initialize(title, &block)
    @title = title
    @fragments = []
    VisualPoetry::Fragment.clear_ids!
    self.instance_eval(&block)
  end

  def fragment(*args)
    @fragments << VisualPoetry::Fragment.new(*args) 
  end

  def ids
    @fragments.map(&:id)
  end

  def text
    @fragments.map(&:content).join(' ')
  end
end

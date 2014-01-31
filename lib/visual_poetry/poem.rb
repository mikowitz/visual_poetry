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

  def css
    css_content = File.readlines(VisualPoetry.template('css')).map(&:rstrip)
    css_content << ""
    @fragments.each do |fragment|
      css_content << "##{fragment.id} {"
      css_content << "  top: #{fragment.position[1]}px;"
      css_content << "  left: #{fragment.position[0]}px;"
      css_content << "}\n"
    end
    css_content.join("\n")
  end
end

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
    @fragments.each do |fragment|
      css_content << ''
      css_content << fragment.css
    end
    css_content.join("\n")
  end

  def css_file(file_path=title)
    File.open("#{file_path}.css", 'w') {|f| f << css }
  end
end

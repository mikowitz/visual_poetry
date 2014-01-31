class VisualPoetry::Fragment
  attr_reader :id, :content, :position, :delay 
  @@ids = {}

  def initialize(*args)
    parse_arguments(args)
  end

  def self.clear_ids!
    @@ids = {}
  end

  def css
    [
      "##{id} {",
      "  top: #{position[1]}px;",
      "  left: #{position[0]}px;",
      "}"
    ].join("\n")
  end

  private

  def parse_arguments(args)
    @content = args.find{|arg| arg.is_a?(String)}
    @position = args.find{|arg| arg.is_a?(Array) && arg.size == 2} || [0, 0]
    @delay = args.find{|arg| arg.is_a?(Fixnum) } || 1500
    @id = !!@content ? set_id : 'blank'
  end

  def set_id
    id = @content.downcase.gsub(/<[^>]*>|\W/, '')
    if @@ids.keys.include? id
      id += (@@ids[id] += 1).to_s
    else
      @@ids[id] = 1
    end
    id
  end
end

require 'spec_helper'

describe VisualPoetry::Poem, 'creation' do
  before do
    @poem1 = VisualPoetry::Poem.new('my first poem') do
      fragment "Isn't"
      fragment "this"
      fragment "awesome?"
    end

    @poem2 = VisualPoetry::Poem.new('my second poem') do
      fragment "This...."
      fragment "is"
      fragment "awesome"
    end
  end

  it 'should reset ids for each poem' do
    expect(@poem1.ids).to match_array %w(isnt this awesome)
    expect(@poem2.ids).to match_array %w(this is awesome)
  end
end

describe VisualPoetry::Poem do
  before do
    @poem1 = VisualPoetry::Poem.new('I Know a Man') do
      fragment 'As I sd to my', [25, 30]
      fragment 'friend, because I am', [30, 80]
      fragment 'always talking,--John, I', [27, 95]
    end
  end

  it '#text should return the content of the poem' do
    expect(@poem1.text).to eq 'As I sd to my friend, because I am always talking,--John, I'
  end

  it '#css_file should return a .css file with the proper content' do
    css_file = @poem1.css_file
    expect(css_file).to be_the_same_file_as fixture_file_path('test.css')
  end
end

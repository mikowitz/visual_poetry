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
      fragment 'As I sd to my'
      fragment 'friend, because I am'
      fragment 'always talking,--John, I'
    end
  end

  it '#text should return the content of the poem' do
    expect(@poem1.text).to eq 'As I sd to my friend, because I am always talking,--John, I'
  end
end

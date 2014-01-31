require 'spec_helper'

describe VisualPoetry::Fragment, 'creation' do
  before :each do
    VisualPoetry::Fragment.clear_ids!
  end

  it 'should fill in default settings' do
    fragment = create_fragment

    expect(fragment.id).to eq 'blank'
    expect(fragment.content).to be nil
    expect(fragment.position).to eq [0, 0]
    expect(fragment.delay).to eq 1500
  end

  it 'should not care about parameter order' do
    fragment = create_fragment 'fragment', [20, 20], 3000
    fragment2 = create_fragment 2500, [10, 10], 'another'

    expect(fragment.id).to eq 'fragment'
    expect(fragment.position).to eq [20, 20]
    expect(fragment.delay).to eq 3000

    expect(fragment2.id).to eq 'another'
    expect(fragment2.position).to eq [10, 10]
    expect(fragment2.delay).to eq 2500
  end

  it 'should iterate ids for identical content' do
    fragment = create_fragment 'fragment'
    fragment2 = create_fragment 'fragment'
    fragment3 = create_fragment 'fragment'


    expect(fragment.id).to eq 'fragment'
    expect(fragment2.id).to eq 'fragment2'
    expect(fragment3.id).to eq 'fragment3'
  end
end


describe VisualPoetry::Fragment, '#id' do
  it 'should be the content stripped of all markup and non-word-characters' do
    fragment = create_fragment("<span class=fancy>this 'ere is a full-sentence.</span>")

    expect(fragment.id).to eq 'thisereisafullsentence'
  end
end

def create_fragment(*args)
  VisualPoetry::Fragment.new(*args)
end

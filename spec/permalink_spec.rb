require File.expand_path('../spec_helper', __FILE__)

describe Mongoid::Permalink do
  it 'adds permalink field' do
    Document.fields['permalink'].type.must_equal String
  end


  describe 'setting permalink' do
    subject { Document.create(permalink: permalink, name: 'Name') }
    let(:value) { subject.permalink }


    describe 'providing an empty permalink' do
      let(:permalink) { '' }


      it 'parameterizes name instead' do
        value.must_equal 'name'
      end
    end


    describe 'providing an permalink' do
      let(:permalink) { 'custom permalink' }


      it 'parameterizes it' do
        value.must_equal 'custom-permalink'
      end
    end


    describe 'providing an permalink with trailing spaces' do
      let(:permalink) { '  custom permalink  ' }


      it 'parameterizes it and removes the spaces' do
        value.must_equal 'custom-permalink'
      end
    end


    describe 'providing an permalink with special characters' do
      let(:permalink) { 'Donald E. Knuth' }


      it 'parameterizes it and makes it pretty' do
        value.must_equal 'donald-e-knuth'
      end
    end
  end


  describe 'having localized permalink fields' do
    subject { Localized.new }


    it 'works too' do
      { en: 'English', de: 'Deutsch' }.each do |locale, permalink|
        I18n.locale = locale
        subject.permalink = permalink
        subject.save
        
        subject.permalink.must_equal permalink.parameterize
      end
    end
  end
end

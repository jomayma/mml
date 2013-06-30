require 'spec_helper'

describe Book do
  describe 'searching on GBdb by keyword' do
    it 'should call GBdb by title keywords' do
      #mocking the GoogleBooks gem
      #GoogleBooks = mock('gbdb')
      #GoogleBooks.stub(:search)
      
      GoogleBooks.should_receive(:search).with('El Quijote')
      Book.find_in_gbooks('El Quijote')
    end
  end
end

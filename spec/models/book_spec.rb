require 'spec_helper'

describe Book do
  describe 'searching on GBdb by keyword' do
    it 'should call GBdb by title keywords' do
      #mocking the GoogleBooks gem
      #GoogleBooks = mock('gbdb')
      #GoogleBooks.stub(:search)
      params = {:search_terms => 'El Quijote',:user_ip => '127.0.0.1'}
      
      GoogleBooks.should_receive(:search).with(params[:search_terms],{},params[:user_ip])
      Book.find_in_gbooks(params)
    end
  end
end

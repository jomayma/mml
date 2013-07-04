require 'spec_helper'

describe BooksController do
  before :each do
    #first we must mock the current_user
    Reader.stub(:find_by_id).and_return(mock('reader'))
    #mocking result objects
    @fake_result = mock('book')
    @fake_results = [mock('book1'),mock('book2')]
  end
  describe 'adding books to the library' do
    it 'should call a model method that create a book' do  
      @fake_result.stub(:title)
      Book.should_receive(:create!).and_return(@fake_result)
      post :create, {:book => {:title =>'El Quijote'} }
    end
  end
  describe 'searching books on Google books' do
    it 'should call a model method that performs google book search' do
      params = {"search_terms"=>"El Quijote", "controller"=>"books", "action"=>"search_gbdb", "user_ip"=>"0.0.0.0"}
      Book.should_receive(:find_in_gbooks).with(params).and_return(@fake_results)
      post :search_gbdb, {:search_terms => "El Quijote"}
    end
    it 'should select the Search Results template for rendering' do
      Book.stub(:find_in_gbooks).and_return(@fake_results)
      post :search_gbdb, {:search_terms => "El Quijote"}
      response.should render_template('search_gbdb')
    end
    it 'should make the google book search results available to that template' do
      Book.stub(:find_in_gbooks).and_return(@fake_results)
      post :search_gbdb, {:search_terms => "El Quijote"}
      assigns(:books).should == @fake_results
    end
  end
end

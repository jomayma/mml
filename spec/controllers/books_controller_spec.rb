require 'spec_helper'

describe BooksController do
  describe 'adding books to the library' do
    it 'should call a model method that create a book' do
      #first we must mock the current_user
      Reader.should_receive(:find_by_id).and_return(mock('reader'))
      
      fake_result = mock('book1')
      Book.should_receive(:create).with({:title =>'El Quijote'}).and_return(fake_result)
      post :create, {:book => {:title =>'El Quijote'} }
    end
  end
  describe 'searching books on Google books' do
    it 'should call a model method that performs google book search' do
      #first we must mock the current_user
      Reader.should_receive(:find_by_id).and_return(mock('reader'))
      
      fake_results = [mock('book1'),mock('book2')]
      Book.should_receive(:find_in_gbooks).with("El Quijote").and_return(fake_results)
      post :search_gbdb, {:search_terms => "El Quijote"}
    end
    it 'should select the Search Results template for rendering' do
      flunk 'No template exists yet'
    end
    it 'should make the google book search results available to that template'
  end
end

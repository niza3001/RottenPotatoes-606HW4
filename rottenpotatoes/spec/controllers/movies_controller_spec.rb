require 'spec_helper'

describe MoviesController do

def sample_attr
  {:rating =>'G', :release_date => 2016-11-23 , :director =>'Christofer Nolan'}
end

describe "GET index" do
  context "has RESTful URL" do
    it "assigns all movies as @movies" do
      movie = Movie.create! sample_attr
      session[:sort] = "title"
      session[:ratings] = {"G"=>"1"}
      get :index, :sort =>session[:sort], :ratings=> session[:ratings]
      assigns(:movies).should eq([movie])
    end
  end

  context "no RESTful URL" do
    it "is missing the sort parameter" do
      session[:sort] = "title"
      session[:ratings] = {"G"=>"1"}
      get :index
      response.should redirect_to(movies_path(:sort=>session[:sort], :ratings=>session[:ratings]))
    end
    it "is missing the ratings parameter" do
      session[:sort] = "release_date"
      session[:ratings] = {"G"=>"1"}
      get :index, :sort => session[:sort]
      response.should redirect_to(movies_path(:sort=>session[:sort], :ratings=>session[:ratings]))
    end
  end
end

describe "GET show" do
  it "assigns the requested movie as @movie" do
    movie = Movie.create! sample_attr
   get :show, :id => movie.id
   assigns(:movie).should eq(movie)
  end
end


describe "POST create" do
  describe "with valid params" do
    it "creates a new movie" do
      expect {
        post :create, :movie => sample_attr
      }.to change(Movie, :count).by(1)
    end

    it "assigns a newly created movie as @movie" do
      post :create, :movie => sample_attr
      assigns(:movie).should be_a(Movie)
      assigns(:movie).should be_persisted
    end

    it "redirects to the homepage" do
      post :create, :movie => sample_attr
      response.should redirect_to(movies_path)
    end
  end
end

describe "GET edit" do
  it "assigns the requested movie as @movie" do
   movie = Movie.create! sample_attr
   get :edit, :id => movie.id
   assigns(:movie).should eq(movie)
  end
end

describe "PUT update" do
  describe "with valid params" do
    it "updates the requested movie" do
      movie = Movie.create! sample_attr
      Movie.any_instance.should_receive(:update_attributes!).with({'title' => 'params'})
      put :update, :id => movie.id, :movie => {'title' => 'params'}
    end

    it "assigns the requested movie as @movie" do
      movie = Movie.create! sample_attr
      put :update, :id => movie.id, :movie => sample_attr
      assigns(:movie).should eq(movie)
    end

    it "redirects to the homepage" do
      movie = Movie.create! sample_attr
      put :update, :id => movie.id, :movie => sample_attr
      response.should redirect_to(movie_path(movie))
    end
  end
end

describe "DELETE destroy" do
  it "destroys the requested movie" do
    movie = Movie.create! sample_attr
      expect {
      delete :destroy, :id => movie.id
      }.to change(Movie, :count).by(-1)
    end

  it "redirects to the movies list" do
    movie = Movie.create! sample_attr
    delete :destroy, :id => movie.id
    response.should redirect_to(movies_path)
  end
end

#This tests the given cucumber scenarios
describe "GET same_director" do
  describe "with director" do
    it "assigns all movies as @movies" do
      movie = Movie.create! sample_attr
      get :same_director, :id=> movie.id
      assigns(:movies).should eq([movie])
    end
  end

  describe "without director" do
    it "redirects to the homepage" do
      movie = Movie.create!
      get :same_director, :id=> movie.id
      response.should redirect_to movies_path
    end
  end
end

end

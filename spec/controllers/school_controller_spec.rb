require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
   describe "GET index" do
   subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("schools/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("schools/show")
    end
  end

  describe '#create' do
    subject { post :create, :params => { :school => { :email => Faker::Internet.email, :name => Faker::Name.name, :pitch => Faker::Name.name, :subdomain => Faker::Internet.slug } } }

    it "redirects to school_url(@school)" do
      expect(subject).to redirect_to(school_url(assigns(:school)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:school).id
    end

    it "redirects_to(@school)" do
      expect(subject).to redirect_to(assigns(:school))
    end

    it "redirects_to /schools/:id" do
      expect(subject).to redirect_to("/schools/#{assigns(:school).id}")
    end
  end
end

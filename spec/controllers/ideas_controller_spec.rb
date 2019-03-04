require "rails_helper"

RSpec.describe IdeasController, type: :controller do
  describe "#new" do
    it "renders the new idea template" do
      get(:new)
      expect(response).to(render_template(:new))
    end
    it "sets an instance variable with a new idea" do
      get(:new)
      expect(assigns(:idea)).to(be_a_new(Idea))
    end
  end

  describe "#create" do
    context "with valid parameters" do
      def valid_request
        post(:create, params: { idea: FactoryBot.attributes_for(:idea) })
      end

      it "creates a new idea in the database" do
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the show page of the idea" do
        valid_request
        idea = Idea.last
        expect(response).to(redirect_to(idea_url(idea.id)))
      end
    end

    context "with invalid parameters" do
      def invalid_request
        post(:create, params: { idea: FactoryBot.attributes_for(:idea, title: nil) })
      end

      it "deson't create an idea in the database" do
        count_before = Idea.count
        invalid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before)
      end

      it "renders the new idea template" do
        invalid_request
        expect(response).to(render_template(:new))
      end
    end
  end
end

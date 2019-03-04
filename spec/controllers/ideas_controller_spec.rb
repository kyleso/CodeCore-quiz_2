require "rails_helper"

RSpec.describe IdeasController, type: :controller do
  describe "#new" do
    it "renders the new idea template" do
      get(:new)
      expect(response).to(render_template(:new))
    end
    it "sets an instance variable with a new idea" do
      get(:new)
      edpect(assigns(:idea)).to(be_a_new(Idea))
    end
  end
end

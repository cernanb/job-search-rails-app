require 'rails_helper'

RSpec.describe Job, :type => :model do
  before(:each) do
    @job = Job.create(title: "Web Developer", company: "Google", description: "Work for Google.")
    @user = User.create(email: "user@email.com", password: "password")

  end

  it 'has a title' do
    expect(@job.title).to eq("Web Developer")
  end
  it 'has a company' do
    expect(@job.company).to eq("Google")
  end
  it 'has a description' do
    expect(@job.description).to eq("Work for Google.")
  end

  describe 'applications' do
    it 'has many applications' do
      @application = Application.create(user_id: @user.id, job_id: @job.id)
      @job.applications << @application

      expect(@job.applications).to include(@application)
    end
  end

  describe 'users' do
    it 'has many users through applications' do
      @application = @user.applications.build(job_id: @job.id, cover_letter: "This is the cover letter.")
      @application.save

      expect(@job.users).to include(@user)
    end

  end

end

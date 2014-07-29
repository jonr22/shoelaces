require 'spec_helper'

feature 'GitHub' do
  scenario 'Shoelaces a project with --github option' do
    repo_name = 'test'
    run_shoelaces("--github=#{repo_name}")

    expect(FakeGithub).to have_created_repo(repo_name)
  end
end

require File.expand_path('../../lib/git_shortcuts', __FILE__)

describe 'git_shortcuts' do
  before(:all) do
    @git_instance = Git.new(File.expand_path('..', __FILE__))
    @git_instance.create_test_cases
  end

  after(:all) do
    @git_instance.clean_up_git_folder
  end

  describe 'get_last_n_commits' do
    before(:all) do
      @last_2_commits = @git_instance.get_last_n_commits(2)
    end
    it { @last_2_commits.count.should == 2 }
    it { @git_instance.show(@last_2_commits[0]).match(/commit message main line 4/).should_not be_nil }
    it { @git_instance.show(@last_2_commits[1]).match(/commit message main line 3/).should_not be_nil }
  end

  describe 'squash' do
    before(:all) do
      @git_instance.squash
      @all_commits = @git_instance.get_all_commits
      @squashed_commit = @git_instance.show(@all_commits[0])
    end
    it { @all_commits.count.should == 4 }
    it { @squashed_commit.match(/\+3\n\+4/).should_not be_nil }
    it { @squashed_commit.match(/commit message main line 3/).should_not be_nil }
  end
end

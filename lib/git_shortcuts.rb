class Git
  def initialize(path)
    @path = path
  end

  attr_accessor :path

  def show(commit_hash)
    `cd #{path} && git show #{commit_hash}`
  end

  def test_commit_message(n)
    "\"" + (["commit message main line #{n}"] + [[
      'commit message description line 1',
      'commit message description line 2',
      'commit message description line 3',
    ].join("\n")]).join("\n\n") + "\""
  end

  def create_test_cases
    `cd #{path} && rm -Rf .git`
    `cd #{path} && echo '' > test.txt`
    `cd #{path} && git init`

    5.times do |k|
      `cd #{path} && echo "#{k}" >> test.txt`
      `cd #{path} && git add test.txt`
      `cd #{path} && git commit -m #{test_commit_message(k)}`
    end
  end

  def current_commit_message
    `cd #{path} && git log -1 --pretty=%B`
  end

  def squash
    all_commits = get_all_commits

    `cd #{path} && git reset --hard HEAD~1`

    commit_message = current_commit_message

    `cd #{path} && git reset --hard HEAD~1`

    `cd #{path} && git cherry-pick -n #{all_commits[1]}`
    `cd #{path} && git cherry-pick -n #{all_commits[0]}`

    `cd #{path} && git commit -m "#{commit_message}"`
  end

  def clean_up_git_folder
    `cd #{path} && rm -Rf .git`
  end

  def get_all_commits
    `cd "#{path}" &&  git log`.
      split("\n").
      select { |x| x.match(/^commit (.*)$/) }.
      map { |x| x.match(/^commit (.*)$/)[1] }
  end

  def get_last_n_commits(n)
    get_all_commits[0..(n - 1)]
  end
end
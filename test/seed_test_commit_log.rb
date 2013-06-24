def test_commit_message(n)
  "\"" + (["commit message main line #{n}"] + [[
    'commit message description line 1',
    'commit message description line 2',
    'commit message description line 3',
  ].join("\n")]).join("\n\n") + "\""
end

`rm -Rf .git`
`echo '' > test.txt`
`git init`

5.times do |k|
  `echo "#{k}" >> test.txt`
  `git add test.txt`
  `git commit -m #{test_commit_message(k)}`
end
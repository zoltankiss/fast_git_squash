Fast Git Squash
===============

Squash your top 2 git commits in one command, faster than `git rebase -i`.

Ever have the situation that you notice something stupid, change it, commit, and then you end up with the following `git log`:

```
Author: Zoltan Kiss <kissx012@umn.edu>
Date:   Sun Jun 23 19:33:15 2013 -0500

    temp

commit e0806fab06d5a1bbc2651a68cb86590c9ec53c33
Author: Zoltan Kiss <kissx012@umn.edu>
Date:   Sun Jun 23 19:28:27 2013 -0500

    something important
```

Now you want to:

1) type `git rebase -i HEAD~2`
2) in your text editor enter f under 'temp' commit.
3) quit out of your text editor.
4) Squashing is complete.

Or: you could type in `squash_commits` into your command prompt.

all you have to do is `git clone` this project, and add to your .bash_rc the following line:

`alias squash_commits='ruby <dir_you_cloned_to>/script/squash'`


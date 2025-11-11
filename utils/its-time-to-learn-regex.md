## Literal Characters

Let's start off simple. With regex, you can match literal characters. For example, in `grep`, when you search for a string, it's technically a regex, but you're just matching literal characters.

So `dog` will match `dog`, as well as something like `catdog`.

## Dot

Next up, what if you want to reference the concept of any character? You use a period, or a dot. This will match any character except a `\n` newline.

So, `c.t` matches cat, cet, cdt, cot, c_t, c3t, cut, etc.

## Character Classes

Now that we've covered that, let's move on to character classes, which let you define a set or range of characters that can match a given position.

`[abc]` → matches either a, b, or c
`[0-9]` → any single digit
`[A-Za-z]`, which can be simplified to `[A-z]`, matches any single letter, upper or lower case. Bear in mind that it has to be `[A-z]`. If you try to do `[a-Z]` it will not work.

`tr[aeiou]d` will match with a vowel, so `trad`, but not `trxd`.

## Quantifiers

Next up, I'll show you how to control how many times characters can repeat. They apply to the character or group right before them.

First quantifier is `*`, which allows for something to repeat zero or more times. For example, `go*d` will match god, good, goood, gooooood.

Then we have `+`, which allows for one or more repetitions, but not zero. For example, `go+d` will match with god, good, goood, but not gd.

Next up is `?`, which matches zero or 1 time. For example, `go?d` will match gd, god, but not good, as the `o` repeats more than once.

Finally, we a range from `{m,n}`, which allows matches between m and n times. For example, `go{2,4}d` matches good, goood, gooood, but not god, or gd.

## Anchors

Next up is Anchors. So, anchors don't match characters, but instead, they match positions in a string. They can be used to specify where the pattern must appear in the text.

The first anchor is the caret symbol `^`, which matches the start of the sting. This may sound weird, but it'll make sense in a second.

In our based text here, `^In` matches "In" at the start of the string, while `^in` would not match the second instance after `mastery`.

The opposite of caret is `$`, which matches the end of the string. Because of that, `so.$` matches the end of the string. Bear in mind that if you just did `so$` it would not match, as there's a period after. In this case, the `.` actually means `anything`, not a literal period.

Since a period is part of the `anything` group, it matches, For example, if we replaced the period at the end of the string with a `!`, it would still match. If you want to literally look for a period, you have to escape it, like this: `so\.$`.

Notice how Vim also makes use of `^` and `$` in this way.

## Grouping and Alternation

When it comes to grouping, parentheses allow you to treat multiple characters as a single unit. For example, `(do)+` matches `do`, `dodo`, `dododo`, etc. The `+` applies to the whole group before it.

In terms of alternation, you use a `|`, which acts like `or`. So `(cat|dog)+` matches cat, or dog, or both, or even `catdog`.

## Negated Character Classes

A normal character class will match any character inside its brackets. We covered this earlier, with examples such as `tr[aeiou]d`.

On the other hand, a negated character class matches any character that is not a digit. For example, `[^0-9]` matches any character that is not a digit, while `[^aeiou]` matches any character that is not a vowel.

## Special Character Shortcuts

Now that you understand the above, there are shorthands you can use, so that you can type less. Let's have a look at some.

`\d` → Matches any digit from 0 to 9, and is the equivalent of (0-9). `\d+` matches numbers, such as `69`, or `420`.

`\D` → Matches any non-digit, so any character that is not a number from 0 to 9. `\D+` matches strings like `say?` for example.

`\w` → Matches any word character, covering (A-Za-z0-9_) and some symbols. `w+` would match strings like `L00k`, and `cat`.

`\W` → Matches any non-word character, so most symbols, spaces, etc. `\W+` matches the punctuation in our text in groups.

`\s` → Matches any whitespace character, so `space`, `tab`, and `newline`. `\s+` matches multiple instances of `space`, `tab`, and `newline`.

`\S` → Matches any non-whitespace character, so anything but `space`, `tab`, or `newline`. `\S+` matches strings such as `mountains` and `dododorinos`.

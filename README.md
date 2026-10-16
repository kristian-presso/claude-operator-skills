# Operator skills for Claude

**Make an agent behave like a good operator: it challenges a bad brief before it starts, and hands back a decision instead of a problem.**

```bash
/plugin marketplace add kristian-presso/claude-operator-skills
/plugin install operator-discipline@claude-operator-skills
```

One department of [claude-skills](https://github.com/kristian-presso/claude-skills), where all departments live in one place. Free, MIT licensed, no sign-up.

Six skills for Claude about how an agent behaves when it does real work for a busy founder. Not frameworks: gates and habits that stop good work going in the wrong direction. The default failure of a capable agent is not incompetence. It is confident, well-executed work against a brief nobody checked, followed by a bare problem handed back with the thinking left undone. The first two skills are gates against exactly that. The other four turn recurring work into something that survives the person who knows how to do it. **Start here** if you are new to the collection.

## Skills

| Skill | Use it when |
| --- | --- |
| [pushback](skills/pushback/SKILL.md) | A brief is vague, contradicts an earlier decision, or has one expensive wrong reading. One focused question, before any work starts. |
| [solutions-shape](skills/solutions-shape/SKILL.md) | The agent is about to report a problem. It hands back finding, recommendation, action instead. |
| [setup-guide](skills/setup-guide/SKILL.md) | You need a setup guide a stranger can follow first time, proven by running it. |
| [write-playbook](skills/write-playbook/SKILL.md) | A recurring process lives in someone's head and needs writing down with an owner and a done-check. |
| [meeting-notes](skills/meeting-notes/SKILL.md) | A transcript or notes need turning into decisions, owned actions, open questions and a follow-up email. |
| [level-up](skills/level-up/SKILL.md) | You want the single next thing worth automating, not a list of twenty. |

## Tested, not just written

Every skill is evaluated with Claude Code's built-in `claude plugin eval`: at least five cases per skill (cases it should handle, plus two near-misses it must leave alone), each run three times with the skill and three times without, graded by a separate model. A skill ships only if Claude does better with it than without it. Results from 16/10/2026:

| Skill | Score with | Without | Gain |
| --- | --- | --- | --- |
| pushback | 0.94 | 0.65 | +0.29 |
| solutions-shape | 0.95 (was 0.84) | 0.63 (was 0.71) | +0.32 (was +0.14) |
| setup-guide | 0.98 | 0.74 | +0.24 |
| write-playbook | 0.92 | 0.58 | +0.34 |
| meeting-notes | 0.99 (was 1.00) | 0.79 (was 0.90) | +0.20 (was +0.10) |
| level-up | 0.98 | 0.65 | +0.33 |

Small gains mean plain Claude already does well there; those skills earn their place on the cases it gets wrong.

Re-scored on 16/10/2026: `meeting-notes` and `solutions-shape` scored well but gained little, because their cases were too easy for plain Claude. Each now has harder cases where an expert clearly does better (an action nobody took, a hedged promise, an owner claimed twice, a follow-up email that must not over-promise; a reversible fix to make and report, an irreversible clean-up to recommend and ask about once, a shortlist whose constraints live in other files, a blocker the repository already answers), and both skills were tightened where they lost points. The earlier numbers, on the easier cases, are in brackets.

## Install

### Claude Code

On its own, from this repository:

```bash
/plugin marketplace add kristian-presso/claude-operator-skills
/plugin install operator-discipline@claude-operator-skills
```

Or with every other department, from the hub:

```bash
/plugin marketplace add kristian-presso/claude-skills
/plugin install operator-discipline@claude-skills
```

Use one or the other, not both, or the skills load twice.

### Claude app

On claude.ai or the Claude desktop app, download this repository as a zip (Code, then Download ZIP), take the folder of the skill you want from `skills/` (the one containing `SKILL.md`), zip that folder on its own and upload it in your skills settings. Each skill works on its own.

## Make it always-on

Skills load when their description matches the conversation, so `pushback` and
`solutions-shape` will not be in view on every turn. To make the two gates apply every
session, paste this into your `CLAUDE.md` (each skill's own "Make it always-on" section has
a longer version):

```markdown

## Configuration

Each skill ends with a short **Configuration** section naming the one or two things that
genuinely vary (where your decisions live, where guides and playbooks are kept, which notes
tool you use). None of them need any particular directory layout or service to work.

## Re-run the evals and tests

The eval cases live in `evals/`, one folder per skill. From the repository root:

```bash
claude plugin eval . --trust-plugin --scaffold --ablation with-without --runs 3 --no-publish
```

Every push runs the same checks as CI: each skill through the validator, the manifests through `claude plugin validate`:

```bash
for d in skills/*/; do python3 tools/validate_skill.py "$d"; done
claude plugin validate .
```

## Feedback

Two minutes on [this form](https://tally.so/r/7XlJbL?source=operator-discipline) tells me what worked, what broke and what to build next. Every answer gets read. Bugs with steps to reproduce are best as a GitHub issue: if a skill fired when it should not have, did not fire when it should, or produced the wrong thing, tell me what you typed and what happened.

## More departments

This is one of five. [claude-skills](https://github.com/kristian-presso/claude-skills) has all departments in one place: operator discipline, building with Claude, go-to-market, marketing and UK business, installable together or one at a time.

## All of it in one install

These skills also run inside [Corey](https://getcorey.ai), alongside the rest of the library I use to run my business: one install that already knows your business, remembers it between chats and keeps itself up to date. It is free for individuals.

## Licence

[MIT](LICENSE). Take them, fork them, strip the parts you disagree with.

How these were built, and why, is written up at [kristianpapadakis.com/guides](https://kristianpapadakis.com/guides).

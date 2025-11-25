# Blog Writing Style Guide - VALIDATION UPDATE
**Mihaly Kavasi - Self-Service BI Blog**
**Updated after analyzing 10 blog posts (5 initial + 5 validation posts)**

---

## Validation Summary

After reading 5 additional blog posts spanning 2019-2024, the following patterns have been **confirmed and strengthened**:

### Confirmed Patterns (No Changes Needed)
✅ Conversational expert tone with teaching mindset
✅ Direct address ("you", "we", "I") heavily used throughout
✅ Semi-formal professional language with technical precision
✅ Problem → Solution structure with real project contexts
✅ Extensive use of visual elements (screenshots, diagrams, tables)
✅ Community attribution and acknowledgments
✅ Progressive complexity from simple to advanced

### Additional Patterns Identified

#### 1. **Project/Task-Oriented Openings** (Very Common)
The style guide correctly identified problem-oriented hooks, but validation reveals **project/task context** openings are equally or more common:

- "I had a task to help a managed services team in monitoring multiple production datasets..." (Log Analytics post)
- "I wanted to find an easy-to-use documentation script for my data models." (Documentation post)
- "Long wanted to start a new blog series covering governance considerations." (Security series)

**Implication**: When writing new posts, consider opening with a real project scenario or consultant task that led to the solution, not just an abstract problem.

---

#### 2. **"What is [Technology]?" Sections** (Standard Pattern)
Nearly all technical posts include explicit background sections:

- "What is Azure Log Analytics?"
- "How does the integration work?"
- "What does disabling Export Data affects?"

These sections typically include:
- 3-6 bullet points summarizing key features
- Link to official Microsoft documentation
- Context on why it matters for Power BI workflows

**Implication**: Technical tutorials should include a brief "What is X?" section even if the audience likely knows the basics. This improves SEO and serves as a reference anchor.

---

#### 3. **Limitations Sections** (Frequent)
Almost every feature explanation includes a "Limitations" subsection:

```markdown
### Limitations
- Not all visuals have these functions
- Won't work with any type of data connection
- It mostly works with simple measures
```

**Implication**: After explaining a feature, proactively address its limitations or edge cases. This builds trust and saves reader frustration.

---

#### 4. **Real-World Performance Examples** (Concrete Metrics)
Posts consistently include specific performance improvements:

- "Slow table visual (40s+)... moved to separate drill-through page... now runs under 20 times in 2 weeks"
- "Complex DAX issue causing visual to fail after 4 minutes... corrected calculation, now runs under 10 seconds"
- "Legacy filters removed improving query performance from 60 sec to 2 sec"

**Implication**: When possible, include before/after metrics with actual numbers (time, row counts, file sizes). Vague "it's faster" claims are avoided.

---

#### 5. **Video Content Integration** (Common for Complex Topics)
Video embeds or references appear in many posts:

- "The easiest way to explain how the solution works is to show you so I created a short video about it."
- YouTube embeds with descriptive captions
- "This is my first step into video blogging, so I hope you find the content useful."

**Implication**: Complex visual processes (UI navigation, multi-step configurations) are often supplemented with video. Text alone is seen as insufficient for some scenarios.

---

#### 6. **Downloadable Resources** (Templates, Scripts, Reports)
Many posts offer practical downloads:

- Excel templates with pre-configured Power Query transformations
- C# scripts for Tabular Editor
- GitHub repo links for community tools
- Power BI template files

**Example**:
```markdown
## Download the Excel file:

This will contain 2 grey sheets where you can insert the extracted information...

[Download Link]
```

**Implication**: Tutorials should provide ready-to-use resources, not just instructions. Reduces friction for readers to implement solutions.

---

#### 7. **Acknowledgment Sections** (Extensive Attribution)
Nearly every post ends with acknowledgments:

```markdown
I would like to thank all the hard work that these experts put into sharing the knowledge with us:
- Guy in a Cube - Patrick LeBlanc and Adam Saxton
- Crossjoin.co.uk - Chris Webb
- SQLBI.com - Marco Russo and Alberto Ferrari
- And everyone who participated in the Power BI Docs
```

**Implication**: Attribution is not just ethical but positions the blog within the Power BI community ecosystem. Links to experts' Twitter handles and blogs are expected.

---

#### 8. **Warning Callouts with Emoji** (Visual Markers)
Important notes consistently use emoji for visual scanning:

- "⚠️There is a big limitation of analysing data from Log Analytics which is the limited query resultset size.⚠️"
- Warnings bookended with emoji on both sides for emphasis

**Implication**: Use ⚠️ emoji (not just text) for critical limitations or caveats. Bookending (⚠️...⚠️) increases visibility.

---

#### 9. **Colloquial Question Phrasing** (Conversational Accessibility)
Headers sometimes use informal phrasing for approachability:

- "What 'slow' means?" (instead of "What does 'slow' mean?")
- "What does disabling Export Data affects?" (instead of "affect")

**Implication**: Grammatical perfection is sometimes sacrificed for conversational flow in question headers. Body text remains grammatically correct.

---

#### 10. **Series Continuation Markers** (Cross-Linking)
Series posts explicitly reference previous entries:

- "Previous part of this series can be found here: [link]"
- "In my next blog post I will show..."
- "This first post will cover one of the most frequently discussed security questions."

**Implication**: Series posts should include navigation aids (previous/next) and number designations ("Part 1", "Part 2").

---

## Updated Content Recommendations

### Opening Structure (Revised)
Prefer this hierarchy for opening paragraphs:

1. **Project/Task Context** (most authentic)
   - "I had a task to [real scenario]..."
   - "I wanted to find [solution] for [problem]..."

2. **Problem Statement** (direct)
   - "This blog post wants to help how to understand..."
   - "When working with [feature], you might notice..."

3. **Big Question** (engaging)
   - "Should we [decision]?"
   - "What are the options when [problem]?"

### Post Structure Pattern (Validated)

```markdown
# Title

## Introduction (1-3 paragraphs)
- Project/task context OR problem hook
- Scope definition ("Won't cover all options, will point you to...")
- Series reference if applicable

## Background (H2)
### What is [Technology]? (H3)
- Bullet list of key features (3-6 points)
- Link to official docs
- Why it matters

### How does [Integration/Feature] work? (H3)
- Technical explanation
- Diagram or screenshot
- Time estimates or performance expectations

## Main Content (Multiple H2 sections)
### Analyzing Performance (H2)
- Measurement methodology
- Tool recommendations (DAX Studio, Performance Analyzer)

### [Feature Name] Optimization (H2)
- Step-by-step tutorial
- Before/after screenshots
- Code blocks with explanations

### Limitations (H3 within feature sections)
- Bullet list of edge cases
- Workarounds if available

## Real-World Examples (H2)
- Concrete metrics (time saved, performance gains)
- Project anecdotes
- Lessons learned

## What's Next? (H2)
- Future capabilities
- Related topics teaser
- Next post in series reference

## Summary / Conclusion (H2)
- Recap of key options/points
- Acknowledgment of complexity
- Expert attribution section
- Download links (if applicable)
- Newsletter CTA (soft)

## Downloadable Resources (H2, if applicable)
- Excel templates
- Scripts
- Reports
```

---

## Language Refinements (Validated)

### Emphasis Markers (Confirmed Usage)

| Element | When to Use | Example |
|---------|------------|---------|
| **Bold** | Product names, key features, first mention of terms | **Azure Log Analytics**, **Premium capacity** |
| *Italic* | UI elements, file names, subtle emphasis | *Performance Analyzer*, *Report Settings* |
| ***Bold+Italic*** | Extreme emphasis (rare) | ***critical limitation*** |
| ⚠️ Emoji | Warnings, important notes | ⚠️Big limitation⚠️ |
| ALL CAPS | Almost never used | Avoid except in warnings |

### Qualifying Language (Validated Patterns)

Use hedging to show expertise without overstating:

- "can be", "typically", "generally", "mainly", "often", "usually"
- "In my experience...", "I found that...", "My recommendation is..."
- "This is particularly useful for...", "It is quite important..."
- "Fortunately", "Unfortunately" (adds emotional color)

**Avoid**:
- "Always", "Never" (too absolute)
- "Obviously", "Clearly" (assumes reader knowledge)
- "Simply", "Just" (minimizes complexity)

---

## Formatting Standards (Validated)

### Code Block Usage

**When to include**:
- C# scripts (Tabular Editor)
- PowerShell commands (Premium capacity management)
- DAX measures (with explanation)
- KQL queries (Log Analytics)
- M functions (Power Query)

**Format**:
```csharp
// Collect all measures, columns, hierarchies and tables:
var objects = Model.AllMeasures.Cast<ITabularNamedObject>()
    .Concat(Model.AllColumns.Where(c => !c.Table.Name.Contains("Template")))
    .Concat(Model.AllHierarchies);

// Get their properties:
var tsv = ExportProperties(objects,"Name,ObjectType,Description");

// Output to screen:
tsv.Output();
```

- Always include language identifier for syntax highlighting
- Add comments for complex sections
- Explain what the code does before the block
- Interpret results after the block

### Table Usage (Confirmed Patterns)

**Feature Comparisons**:
```markdown
| Criteria | Option A | Option B |
|----------|----------|----------|
| Performance | Fast | Moderate |
| Complexity | Low | High |
```

**Pros/Cons Tables** (less common):
Most pros/cons are in bullet lists, not tables.

**Settings Tables** (common):
Lists of settings, options, or properties with descriptions.

---

## Audience Engagement (Validated Tactics)

### Questions as Headers (Very Common)

- "What does this mean?"
- "How to add the missing piece?"
- "What are the options when a Power BI report is slow?"
- "What 'slow' means?" (colloquial phrasing)

### Transitional Questions (Narrative Device)

- "So, what happens next?"
- "But something was missing..."
- "How to understand the meaning of this?"

### Feedback Requests (End of Post)

- "Please let me know if I left out anything important or I made any errors."
- "I was so focused on the details that I could have missed something from the big picture."

---

## Call-to-Action Patterns (Validated)

### Resource Offers (Primary CTA)
```markdown
## Download the Excel file:

This will contain 2 grey sheets where you can insert the extracted information.

[Download Link]
```

### Newsletter (Secondary CTA)
```markdown
If you would like to get notified about similar post, then please subscribe to the newsletter.
```

### Community Engagement (Tertiary CTA)
```markdown
Happy for any code contributions in GitHub.
Let me know if you have questions or other approaches.
```

---

## Post Type Templates (New Section)

### Tutorial Post Template

```markdown
# [Action] with [Technology]: [Outcome]

[Project/task context opening - 2-3 sentences]

[Scope statement - what will/won't be covered]

## Background

### What is [Technology]?
- Bullet list of features
- Link to official docs

### How does it work?
- Technical explanation
- Diagram

## [Main Feature] Setup

[Step-by-step with screenshots]

### Limitations
- Edge cases
- Workarounds

## Real-World Example

[Project story with metrics]

## What's Next?

[Future capabilities or related topics]

## Summary

[Key takeaways]

[Acknowledgments]

[Download resources]

[Newsletter CTA]
```

### Performance Guide Template

```markdown
# What are the options when [Problem]? - [Technology] Performance Guide

[Problem statement opening]

[Scope: "It is not a comprehensive list but I hope it gives you a good starting point"]

## Analyzing Performance

### [Tool Name]
- How to use it
- Screenshot
- What to look for

## Optimization Area 1

### [Technique Name]
- Explanation
- Example
- Before/after metrics

### [Technique Name]
- Explanation
- Example
- Links to expert resources

## Optimization Area 2

[Repeat structure]

## Real-Life Examples

- Improvement 1 with metrics
- Improvement 2 with metrics
- Improvement 3 with metrics

## Summary

[Acknowledge complexity]

[Thank community experts with links]

[Invite feedback]
```

### Feature Comparison Template

```markdown
# [Option A] or [Option B]: Comprehensive Guide

[Big question opening]

[Context on why this matters]

## What is the difference?

| Criteria | Option A | Option B |
|----------|----------|----------|
| [Criteria 1] | [Description] | [Description] |

## When to use [Option A]

- Use case 1
- Use case 2

[Screenshot example]

## When to use [Option B]

- Use case 1
- Use case 2

[Screenshot example]

## Limitations

### [Option A] Limitations
- Limitation 1
- Limitation 2

### [Option B] Limitations
- Limitation 1
- Limitation 2

## Summary

[Recap of key decision factors]

[Newsletter CTA]
```

---

## Validation Insights: What Makes This Style Distinctive

After analyzing 10 posts across 6 years, these elements are **non-negotiable** for maintaining voice consistency:

1. **Project-First Thinking**: Always start with a real scenario ("I had a task...", "I wanted to...") rather than abstract concepts.

2. **Visual Demonstration**: Text explanation is never enough. Every major point needs a screenshot, diagram, or code block.

3. **Community Positioning**: You're not a solo expert—you're part of an ecosystem. Link to and acknowledge other experts in every technical post.

4. **Humble Expertise**: Share opinions clearly but acknowledge subjectivity, ask for feedback, and admit when you're still learning ("This is my first step into video blogging").

5. **Actionable Defaults**: Readers should leave with something they can implement today—a download, a script, a specific setting change, or a clear decision framework.

6. **Performance Pragmatism**: When discussing optimization, always include:
   - How to measure (tool recommendations)
   - Specific metrics (before/after numbers)
   - Real-world impact (user experience, not just technical speed)

7. **Layered Complexity**: Start simple (what it is), progress to implementation (how to use it), then advanced topics (optimization, limitations, alternatives). Never jump straight to advanced.

8. **Teaching Mindset**: Anticipate confusion and address it preemptively:
   - "How to understand the meaning of this?"
   - "Let me break it down."
   - "Important to understand that..."

---

## Corrections and Clarifications

### Original Style Guide Was Generally Accurate

The initial style guide captured the core voice and structure correctly. Validation revealed these **enhancements**, not contradictions:

✅ **Confirmed**: Conversational expert tone
✅ **Confirmed**: Semi-formal but personal
✅ **Confirmed**: Problem-solution focus
✅ **Confirmed**: Visual-first approach
✅ **Confirmed**: Community-oriented

### New Patterns Identified

🆕 **Project/task context openings** (as common as problem statements)
🆕 **"What is [X]?" sections** (standard for technical posts)
🆕 **Limitations subsections** (expected after feature explanations)
🆕 **Performance metrics** (specific numbers, not vague claims)
🆕 **Video integration** (for complex UI demonstrations)
🆕 **Downloadable resources** (templates, scripts as standard offering)
🆕 **Extensive acknowledgments** (community attribution pattern)
🆕 **Warning emoji bookending** (⚠️...⚠️)
🆕 **Colloquial question headers** (approachability over grammar)
🆕 **Series cross-linking** (navigation aids for multi-part posts)

### No Contradictions Found

The validation posts **strengthened** the original patterns rather than contradicting them. The style is remarkably consistent across 6 years (2019-2025) and different post types (tutorials, comparisons, thought leadership).

---

## Final Recommendations for Future Posts

### Pre-Writing Checklist

Before drafting a new post, confirm:

1. [ ] Do I have a real project/task story to open with?
2. [ ] Can I provide a downloadable resource (script, template, report)?
3. [ ] Have I identified 3-5 expert resources to link to and acknowledge?
4. [ ] Do I have screenshots for every major point?
5. [ ] Can I include specific performance metrics (before/after numbers)?
6. [ ] Is there a "What is [X]?" section if introducing a technology?
7. [ ] Have I identified limitations or edge cases?
8. [ ] Will I offer a video for complex UI processes?

### Post-Writing Checklist

Before publishing, verify:

1. [ ] Opening includes project context or real scenario
2. [ ] All technical terms have brief explanations
3. [ ] Every feature section includes a "Limitations" subsection
4. [ ] Screenshots have descriptive captions
5. [ ] Code blocks have explanatory text before and after
6. [ ] Expert resources are linked with Twitter handles
7. [ ] Acknowledgments section thanks community contributors
8. [ ] Newsletter CTA is soft and value-focused
9. [ ] Series posts include "previous/next" navigation
10. [ ] Warnings use ⚠️ emoji bookending

---

## Conclusion

The validation exercise confirms that the original style guide captured the essence of your blogging voice accurately. The 5 additional posts revealed **patterns of depth** (how you structure tutorials, integrate resources, acknowledge community) rather than contradictions.

Your style's greatest strength is **consistency across complexity levels**. Whether writing a 1,000-word feature comparison or a 4,000-word performance guide, you maintain the same:
- Conversational expert tone
- Teaching mindset
- Visual demonstration approach
- Community positioning
- Actionable takeaways

This consistency is what makes your blog a trusted resource in the Power BI community.

---

*Style Guide Updated: November 23, 2025*
*Based on analysis of 10 blog posts spanning 2019-2025*

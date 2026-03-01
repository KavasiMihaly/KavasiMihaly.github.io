---
title: "The Hidden Cost of MCPs and Custom Instructions on Your Context Window"
date: 2025-11-23 10:00:00 +0000
layout: post
categories:
- Analytics Edge
- Improve the Experience
tags:
- AI
- Agents
- MCP
- Context Window
- Performance
- Best Practices
excerpt: "Large context windows sound limitless—until you bolt on a few MCP servers and custom instructions. Here's how to stop burning 50% of your window before you paste a single line of code."
author: Mihaly Kavasi
image: /assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/Header.jpeg
series: "context-window-optimization"
series_title: "Context Window Optimization"
series_part: 0
series_total: 5
permalink: /series/context-window-optimization/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/
redirect_from:
  - /analytics-edge/improve-the-experience/2025/11/23/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window.html
  - /analytics%20edge/improve%20the%20experience/2025/11/23/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window.html
---

![Context Window Usage](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/Header.jpeg)

Large context windows sound limitless—200K, 400K, even a million tokens. But once you bolt on a few MCP servers, dump in a giant CLAUDE.md, and drag a long chat history behind you, you can easily burn **over 50%** of that window before you paste a single line of code.

This post is about that hidden tax—and how to stop paying it.

## Where This Started

This exploration started when I came across [a LinkedIn post by Johnny Winter](https://www.linkedin.com/feed/update/urn:li:activity:7393549485240647680/) featuring [a YouTube video](https://www.youtube.com/watch?si=rh4NleKKELqxTFXb&v=MsQACpcuTkU&feature=youtu.be) about terminal-based AI tools and context management. The video demonstrates how tools like Claude Code, Gemini CLI, and others leverage project-aware context files—which got me thinking about what's actually consuming all that context space.

<div style="text-align: center; margin: 1.5em 0;">
  <div style="display: inline-block; padding: 8px; border: 2px solid #ddd; border-radius: 8px; background: #f9f9f9;">
    <iframe width="320" height="180" src="https://www.youtube-nocookie.com/embed/MsQACpcuTkU?si=LXNotHMFSskba_9Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <div style="font-size: 0.75em; color: #666; margin-top: 4px;">Video by NetworkChuck</div>
  </div>
</div>

> **ℹ️ Note:** *While this post uses Claude Code for examples, these concepts apply to any AI coding agent—GitHub Copilot, Cursor, Windsurf, Gemini CLI, and others.*

## The Problem: You're Already at 50% Before You Start

Think of a context window as working memory. Modern AI models have impressive limits (as of 2025):
- **Claude Sonnet 4.5:** 200K tokens (1M beta for tier 4+)
- **GPT-5:** 400K tokens via API
- **Gemini 3 Pro:** 1M input tokens

A token is roughly 3-4 characters, so 200K tokens equals about 150,000 words. That sounds like plenty, right?

Here's what actually consumes it:
- System prompt and system tools
- MCP server tool definitions
- Memory files (CLAUDE.md, .cursorrules)
- Autocompact buffer (reserved for conversation management)
- Conversation history
- Your code and the response being generated

By the time you add a few MCPs and memory files, a large chunk of your context window is already gone—before you've written a single line of code.

## Real Numbers: The MCP Tax

[Model Context Protocol (MCP)](https://docs.claude.com/en/docs/mcp) servers make it easier to connect AI agents to external tools and data. But each server you add costs tokens.

Here's what my actual setup looked like (from Claude Code's `/context` command):


![Context Window Usage](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/context usage.png)

MCP tools alone consume **16.3%** of the context window—before I've even started a conversation. Combined with system overhead, I'm already at 51% usage with essentially zero messages.

## The Compounding Effect

The real problem emerges when overhead compounds. Here's my actual breakdown:

| Category              |   Tokens   |   % of Window   |
|:----------------------|:----------:|:---------------:|
| System prompt         |    3.0k    |      1.5%       |
| System tools          |   14.8k    |      7.4%       |
| **MCP tools**         | **32.6k**  |    **16.3%**    |
| Custom agents         |    794     |      0.4%       |
| Memory files          |    5.4k    |      2.7%       |
| Messages              |     8      |      0.0%       |
| Autocompact buffer    |   45.0k    |     22.5%       |
| **Free space**        |  **99k**   |    **49.3%**    |

**Total: 101k/200k tokens used (51%)**

You're working with less than half your theoretical capacity—and that's with essentially zero conversation history. Once you start coding, the available space shrinks even further.

![Context Consumption Details](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/consumption details.png)

## Why This Matters: Performance and Quality

Context consumption affects more than just space:

**Processing Latency:** Empirical testing with GPT-4 Turbo shows that time to first token increases by approximately 0.24ms per input token. That means every additional 10,000 tokens adds roughly 2.4 seconds of latency to initial response time. ([Source: Glean's research on input token impact](https://www.glean.com/blog/glean-input-token-llm-latency))

**Cache Invalidation:** Modern AI systems cache frequently used context. Any change (adding an MCP, editing instructions) invalidates that cache, forcing full reprocessing.

**Quality Degradation:** When context gets tight, models may:
- Skip intermediate reasoning steps
- Miss edge cases
- Spread attention too thinly across information
- Fill gaps with plausible but incorrect information
- Truncate earlier conversation, losing track of prior requirements

I've noticed this particularly in long coding sessions. After discussing architecture early in a conversation, the agent later suggests solutions that contradict those earlier decisions—because that context has been truncated away.

## Practical Optimization: Real-World Example

Let me share a before/after from my own setup:

**Before Optimization:**
- 10+ MCPs enabled (all the time)
- MCP tools consuming 32.6k tokens (16.3%)
- Only 99k tokens free (49.3%)
- Frequent need to summarize/restart sessions

**After Optimization:**
- 3-4 MCPs enabled by default
- MCP tools reduced to ~12k tokens (~6%)
- Memory files trimmed to essentials (~3k tokens)
- Over 140k tokens free (70%+)

**Results:** More working space, better reasoning quality, fewer context limit issues, and faster responses.

## Optimization Checklist

Before adding another MCP or expanding instructions:

- [ ] Have I measured my current context overhead?
- [ ] Is my custom instruction file under 5,000 tokens?
- [ ] Do I actively use all enabled MCPs?
- [ ] Have I removed redundant or outdated instructions?
- [ ] Could I accomplish this goal without consuming more context?

**In Claude Code:** Use the `/context` command to see your current context usage breakdown.

## Specific Optimization Strategies

### 1. Audit Your MCPs Regularly

Ask yourself:
- Do I use this MCP daily? Weekly? Monthly?
- Could I accomplish this task without the MCP?

**Action:** Disable MCPs you don't use regularly. Enable them only when needed.

![MCP Enable/Disable Settings](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/MCP enable-disable.png)
### Impact of Selective MCP Usage

![Context Window with Some MCPs Off](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/contextwindowwithsomeMCPs turned off.png)

By selectively disabling MCPs you don't frequently use, you can immediately recover significant context space. This screenshot shows the difference in available context when strategically choosing which MCPs to keep active versus loading everything.


In [Claude Code](https://code.claude.com/docs/en/mcp), you can toggle MCPs through the settings panel. This simple action can recover 10-16% of your context window.

### 2. Ruthlessly Edit Custom Instructions

Your [CLAUDE.md memory files](https://www.anthropic.com/engineering/claude-code-best-practices), .cursorrules, or copilot-instructions.md should be:
- Concise (under 5,000 tokens)
- Focused on patterns, not examples
- Project-specific, not general AI guidance

**Bad Example:**
```markdown
When writing code, always follow best practices. Use meaningful
variable names. Write comments. Test your code. Follow SOLID
principles. Consider performance. Think about maintainability...
```
(Continues for 200 lines)

**Good Example:**
```markdown
Code Style:
- TypeScript strict mode
- Functional patterns preferred
- Max function length: 50 lines
- All public APIs must have JSDoc

Testing:
- Vitest for unit tests
- Each function needs test coverage
- Mock external dependencies
```

### 3. Start Fresh When Appropriate

Long conversations accumulate context. Sometimes the best optimization is:
- Summarizing what's been decided
- Starting a new session with that summary
- Dropping irrelevant historical context

### 4. Understand Autocompact Buffer

Claude Code includes an **autocompact buffer** that helps manage context automatically. When you run `/context`, you'll see something like:

```
Autocompact buffer: 45.0k tokens (22.5%)
```

This buffer reserves space to prevent hitting hard token limits by automatically compacting or summarizing older messages during long conversations. It maintains continuity without abrupt truncation—but it also means that 22.5% of your window is already taken.

You can also see and toggle this behavior in Claude Code’s `/config` settings:

![Claude Code Autocompact Config](/assets/images/the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window/Autocompact.png)

In this screenshot, **Auto-compact** is enabled, which keeps a dedicated buffer for summarizing older messages so long conversations stay coherent without suddenly hitting hard context limits.

## Claude Code Specific Limitations: The Granularity Problem

Claude Code currently has a platform-level limitation that makes fine-grained control challenging, documented in [GitHub Issue #7328: "MCP Tool Filtering"](https://github.com/anthropics/claude-code/issues/7328).

**The Core Issue:** Claude Code loads ALL tools from configured MCP servers. You can only enable or disable entire servers, not individual tools within a server.

**The Impact:** Large MCP servers with 20+ tools can easily consume 50,000+ tokens just on definitions. If a server has 25 tools but you only need 3, you must either:
1. Load all 25 tools and accept the context cost
2. Disable the entire server and lose access to the 3 tools you need
3. Build a custom minimal MCP server (significant development effort)

This makes tool-level filtering essential for context optimization, not just a convenience. The feature is under active development with community support. In the meantime:
- Use MCP servers sparingly
- Prefer smaller, focused servers over large multi-tool servers
- Regularly audit which servers you actually need enabled
- Provide feedback on the GitHub issues to help prioritize this feature

## Key Takeaways

**You're burning a huge portion of your context window before you even paste in your first file.** MCP tools alone can consume 16%+ of your window. System tools add another 7%. The autocompact buffer reserves 22%. It adds up fast.

**Optimization is ongoing.** Regular audits of MCPs and memory files keep your agent running smoothly. Aim to keep baseline overhead under 30% of total context (excluding the autocompact buffer).

**Measurement matters.** Use `/context` in Claude Code to monitor your overhead. You can't optimize what you don't measure.

**Performance degrades subtly.** Latency increases roughly 2.4 seconds per 10,000 tokens based on empirical testing. Reasoning quality drops as context fills up.

**Start minimal, add intentionally.** The best developers using AI agents:
1. Start minimal
2. Add capabilities intentionally
3. Monitor performance impact
4. Optimize regularly
5. Remove what isn't providing value

The goal isn't to minimize context usage at all costs. The goal is intentional, efficient context usage that maximizes response quality, processing speed, and available working space.

Think of your context window like RAM in a computer. More programs running means less memory for each program. Eventually, everything slows down.

It's not about having every tool available. It's about having the right tools, configured optimally, for the work at hand.

## Resources

### Official Documentation
- [Claude Code MCP Documentation](https://code.claude.com/docs/en/mcp)
- [Model Context Protocol (MCP) Overview](https://docs.claude.com/en/docs/mcp)
- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Claude Code Cost Management](https://docs.anthropic.com/en/docs/claude-code/costs)
- [Claude Context Windows](https://docs.anthropic.com/en/docs/build-with-claude/context-windows)

### Research & Performance
- [How Input Token Count Impacts LLM Latency - Glean](https://www.glean.com/blog/glean-input-token-llm-latency)

### Community Resources
- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
- [GitHub Copilot Custom Instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot)
- [Johnny Winter's LinkedIn Post on Terminal AI](https://www.linkedin.com/feed/update/urn:li:activity:7393549485240647680/)
- [You've Been Using AI the Hard Way (Use This Instead) - YouTube Video](https://www.youtube.com/watch?si=rh4NleKKELqxTFXb&v=MsQACpcuTkU&feature=youtu.be)

---

Have you optimized your AI agent setup? What context window challenges have you encountered? I'd love to hear your experiences and optimization strategies.

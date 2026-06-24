---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
title: "Mockup HTML Design Guide"
document_type: "Guide — ba/workspace/drafts/mockup"
status: "Active"
date: "2026-06-23"
---

# mockup/ — TOSS HTML Mockup Design Library (taste-skill)

> **Tạo mockup HTML tương tác cho TOSS subsystems — Anti-slop design, real data, production-ready.**

---

## 📋 Mục đích

Lưu trữ mockup HTML (tĩnh) và prototype (tương tác) cho tất cả phân hệ TOSS:
- Flight Operations (Flight Planning, Dispatch, OCC)
- Crew Management (Rostering, Duty-Time, Qualifications)
- Aircraft Maintenance (Maintenance Planning, MEL, Defect Log)
- Ground Operations (Turnaround, Gate Assignment)

**Đặc điểm:**
- ✅ Self-contained HTML (không cần internet / server)
- ✅ Dựa trên **taste-skill** — anti-slop design system
- ✅ WCAG AA accessible
- ✅ Dark mode built-in
- ✅ Real data (không "Jane Doe" / "Sample ABC")
- ✅ Responsive mobile

## 📂 Cấu trúc thư mục

```
mockup/
├── README.md                           # This file
├── shared/
│   ├── TOSS-design-system.md          # Colors, typography, baseline dials
│   ├── component-patterns.html        # Reusable HTML blocks
│   └── taste-skill-checklists.md      # 78-point pre-flight checklist
│
├── flight-ops/                         # Flight Operations
│   ├── flight-planning-v1.html
│   ├── flight-planning-v2.html        # Iterations
│   ├── dispatch-release-v1.html
│   ├── occ-monitoring-v1.html
│   └── DESIGN-NOTES.md                # Design decisions, dials
│
├── crew-mgmt/                          # Crew Management
│   ├── rostering-portal-v1.html
│   ├── duty-time-tracking-v1.html
│   └── DESIGN-NOTES.md
│
├── maintenance/                        # Aircraft Maintenance
│   ├── maintenance-planning-v1.html
│   └── DESIGN-NOTES.md
│
└── ground-ops/                         # Ground Operations
    ├── turnaround-coordination-v1.html
    └── DESIGN-NOTES.md
```

## ⚡ Quick Start (3 steps)

### 1. Design Read (60 seconds)
State in one sentence what you're building:

```
Reading this as: [page kind] for [audience], with a [vibe], leaning toward [system].
```

*Example:*  
*"Reading this as: operations control interface for flight dispatchers, with a scan-speed language, leaning toward Fluent UI."*

### 2. Set Three Dials
Every mockup has 3 parameters (use subsystem baseline from `shared/TOSS-design-system.md` §3):

```javascript
DESIGN_VARIANCE:    6    // 1=Symmetrical, 10=Asymmetric chaos
MOTION_INTENSITY:   4    // 1=Static, 10=Cinematic
VISUAL_DENSITY:     7    // 1=Gallery, 10=Cockpit/packed
```

### 3. Build & Pre-Flight
✅ Build mockup (see **Building Mockups** below)  
✅ Run 78-point Pre-Flight Check (`shared/taste-skill-checklists.md`)  
✅ Test dark mode + mobile + accessibility  
✅ Done!

## 🎨 Building Mockups (taste-skill Framework)

**Read first:** `.claude/libraries/taste-skill/INTEGRATION-TOSS.md` (full workflow)

### Design System & Tokens
All tokens in: **`shared/TOSS-design-system.md`**

- **Colors:** CAAV blue (#005A9C primary), accent orange (#FF6B35)
- **Typography:** Geist sans-serif, clear hierarchy
- **Spacing:** Tailwind scale (gap-4, p-6, py-16, etc.)
- **Dark mode:** `dark:` Tailwind variant
- **Icons:** Phosphor 20px (from https://phosphoricons.com)

### Real Data Required
❌ NO "John Doe", "Sample XYZ", "92%"  
✅ YES flight numbers (VN-HC-0342), crew names (Nguyễn Văn A), real MEL codes (32-41-17)

### Pattern Library
See: **`shared/component-patterns.html`** (reusable HTML blocks)

- Header (sticky nav, 64px)
- Forms (label-above, 40px button height)
- Data Tables (scannable rows, status badges)
- Status Badges (color-coded: green/yellow/red)
- CTAs (one-line max, WCAG AA contrast)

### DO's ✅
- Real images (Picsum seed or placeholder slots)
- One accent color lock (CAAV blue)
- One theme lock (light or dark, not mixed)
- Form labels ABOVE input (no placeholder-as-label)
- Icons from Phosphor/Radix/Tabler (no custom SVG)
- Dark mode tested
- WCAG AA contrast checked (4.5:1 body)

### DON'Ts ❌
- ~~Em-dashes (`—`)~~ — completely banned
- ~~Section-numbering eyebrows~~ — (`001 · Flight Planning`)
- ~~AI-purple glows~~ — (use brand colors)
- ~~Generic 3-equal-cards~~ — (use bento or data table)
- ~~Scroll cues~~ — (`Scroll`, `↓`)
- ~~Placeholder names~~ — (`Jane Doe`)
- ~~Fake product screenshots~~ — (divs pretending to be UI)

## 📝 Baseline Dials by Subsystem

Use these as defaults for each subsystem's `DESIGN-NOTES.md`:

| Subsystem | VARIANCE | MOTION | DENSITY | Layout | Example |
|---|---|---|---|---|---|
| **Flight Ops** | 6 | 4 | 7 | Sticky nav + split-panel (filters \| data table) | flight-planning-v1.html |
| **Crew Mgmt** | 5 | 3 | 6 | Tab interface + calendar/grid | rostering-portal-v1.html |
| **Maintenance** | 5 | 3 | 7 | Sticky nav + sidebar + accordion | maintenance-planning-v1.html |
| **Ground Ops** | 5 | 4 | 6 | Grid view (gates) + timeline | turnaround-coordination-v1.html |

## 📋 Pre-Flight Checklist (Before Ship)

Full checklist: `shared/taste-skill-checklists.md` (78 items)

Quick version:
- [ ] Design read stated
- [ ] Dials explicit (VARIANCE, MOTION, DENSITY)
- [ ] No em-dashes (`—`) anywhere
- [ ] One accent color lock
- [ ] One theme lock
- [ ] Dark mode tested
- [ ] Form labels ABOVE input
- [ ] CTA text one-line max
- [ ] Images real (Picsum seed or placeholders)
- [ ] Icons from Phosphor only
- [ ] WCAG AA contrast (4.5:1 body)
- [ ] Real data (not placeholder)
- [ ] No scroll cues / version labels / decoration text

**If any box fails → not done yet.**

## 🔗 Resources

| Document | Location | Purpose |
|---|---|---|
| **taste-skill full reference** | `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` | All rules, patterns, anti-tells (complete) |
| **taste-skill integration guide** | `.claude/libraries/taste-skill/INTEGRATION-TOSS.md` | How to use taste-skill for TOSS mockups |
| **TOSS design system** | `shared/TOSS-design-system.md` | Colors, typography, baseline dials, component patterns |
| **Component patterns** | `shared/component-patterns.html` | Reusable HTML blocks (nav, form, table, etc.) |
| **Pre-flight checklist** | `shared/taste-skill-checklists.md` | 78-point mechanical audit |
| **This guide** | README.md | Quick start + folder structure |

## 🚀 First Mockup Workflow

**Example: Flight Planning Screen**

```
1. Design Read
   "Reading this as: operations control interface for flight planners,
    with a scan-speed language, leaning toward Fluent UI."

2. Dials
   VARIANCE: 6, MOTION: 4, DENSITY: 7

3. Blocks
   - Sticky header (64px, nav + search)
   - Left sidebar (filters: date, aircraft, crew, route)
   - Right main (data table with flights + status badges)
   - Footer (status, sync time)

4. Code
   - Tailwind utilities (or Fluent components)
   - Dark mode: dark: variant
   - Icons: Phosphor 20px
   - Data: Real flight numbers (VN-HC-0342), crew names, MEL codes

5. Pre-Flight
   ✓ All 78 boxes pass
   
6. Save
   flight-ops/flight-planning-v1.html
```

## 📖 Naming Convention

| Type | Pattern | Example |
|---|---|---|
| **Mockup** | `<screen>-v<N>.html` | `flight-planning-v1.html`, `rostering-portal-v2.html` |
| **Design Notes** | `DESIGN-NOTES.md` | Per subsystem (flight-ops/, crew-mgmt/, etc.) |
| **Shared assets** | `shared/<name>.(md\|html)` | `shared/TOSS-design-system.md`, `shared/component-patterns.html` |

## 🎯 Tips

- **Start from `component-patterns.html`** — copy reusable blocks instead of building from scratch
- **Use `dark:` variant on ALL colors** — not just accents
- **Test in two browsers** (light mode + dark mode)
- **Real data always** — flight numbers, crew names, MEL codes, not Lorem Ipsum
- **Icon size:** 20px (Phosphor Medium weight)
- **CTA text:** 3 words max, one-line only at desktop
- **Responsive:** Explicit collapse rules for mobile (`<md` breakpoint)

## 📞 Questions?

- **taste-skill rules:** See `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` §0–14
- **TOSS tokens:** See `shared/TOSS-design-system.md`
- **Component examples:** See `shared/component-patterns.html`
- **Pre-flight audit:** See `shared/taste-skill-checklists.md`

---

**Version 1.0 — 2026-06-23**  
*Powered by taste-skill anti-slop design system + TOSS aviation domain*

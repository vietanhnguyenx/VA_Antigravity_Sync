---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
title: "taste-skill Integration Summary"
date: "2026-06-23"
status: "Complete"
---

# ✅ taste-skill Integration for TOSS — Complete

**Date:** 2026-06-23  
**Status:** ✅ Ready to use  
**Version:** taste-skill (latest) + TOSS baseline dials

---

## 📦 What Was Integrated

### **1. taste-skill Library**
- **Location:** `.claude/libraries/taste-skill/`
- **Content:** Full taste-skill repo (skills, examples, assets, scripts, research)
- **Size:** 56 files
- **Key:** `skills/taste-skill/SKILL.md` — complete design rules (all patterns, anti-tells, 78-point checklist)

### **2. TOSS Integration Guide**
- **File:** `.claude/libraries/taste-skill/INTEGRATION-TOSS.md`
- **Purpose:** How to use taste-skill specifically for TOSS mockups
- **Sections:**
  - Giới thiệu taste-skill
  - Khi nào dùng / không dùng
  - Quy trình thiết kế mockup (4 bước)
  - Cấu trúc thư mục TOSS
  - TOSS design system (optional)
  - CLI integration points
  - Quick reference rules
  - Example workflow (Flight Operations)

### **3. TOSS Design System**
- **File:** `ba/workspace/drafts/mockup/shared/TOSS-design-system.md`
- **Content:**
  - Color tokens (CAAV blue primary, accent orange, status colors, neutrals)
  - Typography (Geist font stack, scale mapping, examples)
  - Spacing scale (Tailwind units)
  - Component patterns (nav, forms, tables, status badges)
  - **Baseline dials per subsystem:**
    - Flight Operations: VARIANCE 6, MOTION 4, DENSITY 7
    - Crew Management: VARIANCE 5, MOTION 3, DENSITY 6
    - Maintenance: VARIANCE 5, MOTION 3, DENSITY 7
    - Ground Ops: VARIANCE 5, MOTION 4, DENSITY 6
  - Anti-tells checklist
  - Dark mode implementation
  - WCAG AA baseline
  - Real data examples

### **4. Mockup Design Guide**
- **File:** `ba/workspace/drafts/mockup/README.md` (updated)
- **Content:**
  - Quick start (3 steps)
  - Building mockups workflow
  - Baseline dials per subsystem
  - DO's ✅ and DON'Ts ❌
  - File structure + naming convention
  - Pre-flight checklist (quick 12-box version)
  - Resources + tips
  - FAQ

### **5. Pre-Flight Checklist**
- **File:** `ba/workspace/drafts/mockup/shared/taste-skill-checklists.md`
- **Content:**
  - Quick version (12 critical boxes)
  - Full audit (all 78 boxes from taste-skill §14)
  - Organized into 17 phases:
    1. Design Foundation (dials, design system)
    2. Typography (font stack, serif discipline, italic descenders)
    3. Color (accent, saturation, LILA rule, premium-consumer palette ban)
    4. Layout (hero, nav, bento, eyebrow, zigzag)
    5. Cards & Containers (shadows, shape consistency)
    6. Interactive UI States (loading, error, button contrast, form contrast)
    7. Data & Forms (labels, helper text, error placement)
    8. Images & Visuals (real images, icons, logos, div-based fake screenshots)
    9. Content Density (no data dumps, long lists, spec sheets)
    10. Quotes & Testimonials (max 3 lines, em-dash ban)
    11. Theme Lock (one light OR dark, not mixed)
    12. Context-Aware Proactivity (liquid glass, motion motivation, GSAP patterns)
    13. Performance & Accessibility (hardware accel, reduced motion, dark mode, Core Web Vitals, z-index)
    14. AI Tells (visual CSS, typography, layout, content, resources — all banned patterns)
    15. EM-DASH BAN (ZERO em-dashes anywhere — non-negotiable)
    16. Redesign Protocol (only for redesign mockups)
    17. Block Library (only for custom blocks)

---

## 🎯 How to Use taste-skill for TOSS Mockups

### **Step 1: Read Design Read**
```
Reading this as: [page kind] for [audience], with a [vibe], leaning toward [system].
```

### **Step 2: Set Three Dials**
Pick from your subsystem baseline:
```
DESIGN_VARIANCE:    5-7
MOTION_INTENSITY:   3-4
VISUAL_DENSITY:     6-7
```

### **Step 3: Build Mockup**
- Use tokens from `shared/TOSS-design-system.md`
- Copy component patterns from `shared/component-patterns.html`
- Real data (flight numbers, crew names, MEL codes)
- Dark mode: `dark:` Tailwind variant
- Icons: Phosphor 20px

### **Step 4: Run Pre-Flight**
✅ 12 critical boxes (quick version)  
✅ OR all 78 boxes (full audit)

**Result:** Mockup ready to share with stakeholders

---

## 📂 File Structure

```
TOSS/
├── .claude/
│   └── libraries/
│       └── taste-skill/                 # ← taste-skill library (56 files)
│           ├── README.md                # taste-skill overview
│           ├── CHANGELOG.md
│           ├── INTEGRATION-TOSS.md      # ← TOSS integration guide
│           ├── TOSS-INTEGRATION-SUMMARY.md  # ← This file
│           ├── skills/
│           │   ├── taste-skill/         # Main skill (SKILL.md)
│           │   ├── redesign-skill/
│           │   ├── image-to-code-skill/
│           │   └── ...
│           ├── examples/
│           ├── assets/
│           └── scripts/
│
├── ba/workspace/drafts/mockup/
│   ├── README.md                        # ← Mockup design guide (updated)
│   ├── shared/
│   │   ├── TOSS-design-system.md        # ← Design tokens + baseline dials
│   │   ├── taste-skill-checklists.md    # ← 78-point pre-flight
│   │   └── component-patterns.html      # (to be created by team)
│   ├── flight-ops/
│   │   ├── flight-planning-v1.html      # (team creates these)
│   │   └── DESIGN-NOTES.md
│   ├── crew-mgmt/
│   ├── maintenance/
│   └── ground-ops/
```

---

## 🚀 Next Steps for TOSS Team

### **Immediate (this week)**
1. **Read the guides** (in order):
   - `.claude/libraries/taste-skill/INTEGRATION-TOSS.md` (10 min)
   - `ba/workspace/drafts/mockup/README.md` (10 min)
   - `ba/workspace/drafts/mockup/shared/TOSS-design-system.md` (15 min)

2. **Create first mockup** (Flight Operations example in §8 of INTEGRATION-TOSS.md)
   - Use baseline dials from `TOSS-design-system.md` §3
   - Copy component patterns from `shared/component-patterns.html`
   - Build self-contained HTML
   - Run quick 12-box pre-flight

### **Short term (next 2 weeks)**
1. **Create design-system tokens file** (if not using TOSS-design-system.md as-is):
   - `shared/TOSS-design-system-override.md` (customize colors, spacing)
2. **Create component-patterns library**:
   - `shared/component-patterns.html` (nav, form, table, badge examples)
3. **Create first 3 subsystem mockups**:
   - `flight-ops/flight-planning-v1.html`
   - `crew-mgmt/rostering-portal-v1.html`
   - `maintenance/maintenance-planning-v1.html`
4. **Team training**: Walk through one mockup (Flight Ops example)

### **Ongoing**
- Use `taste-skill-checklists.md` §14 (78-point audit) before every ship
- Reference `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` for detailed rules
- Update `DESIGN-NOTES.md` per subsystem (design decisions, dials, patterns)
- Version bump mockups (`v1` → `v2`) after review/iteration

---

## 🔑 Key Rules to Remember

### ✅ **DO**
- Real data (VN-HC-0342, Nguyễn Văn A, not "John Doe")
- Real images (Picsum seed or generated)
- One accent color lock (CAAV blue #005A9C)
- Form labels ABOVE input
- CTA text one-line max
- Dark mode tested
- Icons: Phosphor only

### ❌ **DON'T**
- ~~Em-dashes `—`~~ (banned completely)
- ~~Generic 3-equal-cards~~ (use bento grid or table)
- ~~AI-purple glows~~ (use brand colors)
- ~~Scroll cues~~ (`Scroll`, `↓`)
- ~~Placeholder names~~ (`Jane Doe`)
- ~~Fake product screenshots~~ (divs pretending to be UI)
- ~~Div-based decorations~~ (text strips, floating labels)

---

## 📚 Resources at Your Fingertips

| Need | Location | Type |
|---|---|---|
| **All taste-skill rules** | `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` | Reference (complete) |
| **How to use for TOSS** | `.claude/libraries/taste-skill/INTEGRATION-TOSS.md` | Guide (practical) |
| **Design tokens & dials** | `ba/workspace/drafts/mockup/shared/TOSS-design-system.md` | Reference (TOSS-specific) |
| **Quick start** | `ba/workspace/drafts/mockup/README.md` | Guide (quick) |
| **Pre-flight audit** | `ba/workspace/drafts/mockup/shared/taste-skill-checklists.md` | Checklist (78 items) |
| **Component examples** | `ba/workspace/drafts/mockup/shared/component-patterns.html` | Code (to be created) |

---

## ❓ FAQ

**Q: Where do I start?**  
A: Read `INTEGRATION-TOSS.md` (§3 — Quy trình), then create first mockup following §8 (Flight Operations example).

**Q: What if I don't know the design system?**  
A: Use `TOSS-design-system.md` as a template. Copy the baseline dials + color tokens + typography. Customize as your team decides.

**Q: Can I use Fluent UI instead of Tailwind?**  
A: Yes. Choose ONE system per project. `TOSS-design-system.md` recommends Fluent UI for dashboards, Tailwind for custom UI.

**Q: What if my mockup fails pre-flight?**  
A: Fix the failing box, re-run checklist, repeat until all pass. Common fails: em-dashes (remove them), accent color inconsistency (lock it), or CTA text wraps (shorten label or widen button).

**Q: Do I really need to run all 78 boxes?**  
A: Start with 12 critical boxes. Run full 78-point audit when close to done.

**Q: Can I use plain HTML instead of Tailwind/Fluent?**  
A: Yes, but you'll need to hand-write CSS. taste-skill assumes Tailwind utilities or a component framework.

---

## 📋 Checklist: Integration Complete

- [x] taste-skill library copied to `.claude/libraries/taste-skill/`
- [x] INTEGRATION-TOSS.md created (how to use taste-skill for TOSS)
- [x] TOSS-design-system.md created (tokens + baseline dials)
- [x] mockup/README.md updated (quick start guide)
- [x] taste-skill-checklists.md created (78-point audit)
- [x] mockup/ folder structure ready for subsystem mockups
- [x] Documentation complete (5 key files)

---

## 🎓 Ready to Build Your First Mockup?

1. Open: `ba/workspace/drafts/mockup/README.md`
2. Pick subsystem: Flight Ops, Crew Mgmt, Maintenance, or Ground Ops
3. Read baseline dials from: `shared/TOSS-design-system.md` §3
4. Create new file: `[subsystem]/[screen-name]-v1.html`
5. Start coding (use `component-patterns.html` as reference)
6. Run pre-flight: `shared/taste-skill-checklists.md` (quick 12-box)
7. Done! ✅

**Questions?** See FAQ above or reference the integration guide.

---

*taste-skill Integration Complete — 2026-06-23*  
*Next: Team reads guides + creates first mockup*

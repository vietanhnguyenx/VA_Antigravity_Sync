---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
title: "TOSS Design System & Baseline Dials"
version: "1.0"
date: "2026-06-23"
status: "Draft"
---

# TOSS Design System

> **Unified design tokens + taste-skill dials for all TOSS mockup HTML subsystems.**

---

## 1. Design Tokens (Brand Identity)

### **Color Palette**

#### Primary Brand
- **CAAV Blue** (Civil Aviation Authority of Vietnam)  
  `#005A9C` — Primary brand color, trust, authority
  - Light: `#E8F2FA` (backgrounds)
  - Dark: `#003B5C` (hover/focus)

- **Alert Orange** (Action, disruption)  
  `#FF6B35` — Warnings, high-priority alerts
  - Light: `#FFE8DB` (backgrounds)
  - Dark: `#CC5629` (hover/focus)

#### Status Colors
- **Success Green:** `#28A745`
- **Error Red:** `#DC3545`
- **Warn Yellow:** `#FFC107`
- **Info Blue:** `#17A2B8`

#### Neutrals (light mode)
```
50:   #FAFAFA (lightest background)
100:  #F5F5F5
200:  #E5E5E5
300:  #D9D9D9
400:  #BFBFBF
500:  #999999 (mid-tone)
600:  #737373
700:  #404040
800:  #262626
900:  #141414
950:  #0F0F0F (darkest text/elements)
```

#### Neutrals (dark mode)
```
50:   #0F0F0F (darkest background for dark mode)
100:  #1A1A1A
200:  #2D2D2D
...
950:  #FAFAFA (lightest text in dark mode)
```

### **Typography**

#### Font Stack
```css
/* Sans-serif (primary) */
font-family: 'Geist', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;

/* Monospace (for data, codes) */
font-family: 'Geist Mono', 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', monospace;
```

#### Scale (Tailwind mapping)
| Role | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| **Display** | text-5xl/6xl | 600 (semibold) | tight (1.1) | Page title, major section heading |
| **Headline 1** | text-3xl | 600 | snug (1.375) | Section heading |
| **Headline 2** | text-2xl | 600 | snug | Subsection heading |
| **Headline 3** | text-xl | 600 | normal | Card title, form section |
| **Body** | text-base | 400 | relaxed (1.625) | Paragraph, list content |
| **Small** | text-sm | 400 | relaxed | Helper text, captions |
| **Mono** | text-sm | 400 | normal | Code, flight numbers, MEL codes |

#### Examples
```html
<!-- Display (Page Title) -->
<h1 class="text-5xl md:text-6xl font-600 tracking-tight leading-none text-neutral-950 dark:text-neutral-50">
  Flight Planning
</h1>

<!-- Headline 1 (Section) -->
<h2 class="text-3xl font-600 leading-snug text-neutral-950 dark:text-neutral-50">
  Scheduled Flights
</h2>

<!-- Headline 2 (Subsection) -->
<h3 class="text-2xl font-600 leading-snug text-neutral-900 dark:text-neutral-100">
  2026-06-23
</h3>

<!-- Body -->
<p class="text-base text-neutral-700 dark:text-neutral-300 leading-relaxed">
  Departure time: 06:00 UTC. Aircraft: A321-200 (VN-A ABC).
</p>

<!-- Mono (Data) -->
<code class="text-sm font-mono text-neutral-900 dark:text-neutral-100 bg-neutral-100 dark:bg-neutral-800 px-2 py-1 rounded">
  VN-HC-ABC
</code>
```

### **Spacing Scale (Tailwind)**
```
Gap/Padding units:
2:   0.5rem  (8px)
3:   0.75rem (12px)
4:   1rem    (16px)  ← most-used unit
6:   1.5rem  (24px)
8:   2rem    (32px)
12:  3rem    (48px)  ← section gaps
16:  4rem    (64px)
24:  6rem    (96px)  ← large section gaps
```

### **Layout Widths**
```
Container max-width:  max-w-[1400px] mx-auto
Padding (desktop):     px-8
Padding (mobile):      px-4
Breakpoints:           sm-640, md-768, lg-1024, xl-1280, 2xl-1536
```

### **Corner Radius Scale**
```
Pick ONE radius family for entire system:
soft: 8px   (default for cards, inputs, buttons)
pill: full  (for CTAs, badges)
sharp: 0    (for data-heavy tables)

TOSS choice: soft (8px) — trustworthy, not too playful
```

### **Shadow System**
```
sm:    0 1px 2px rgba(0,0,0,0.05)
md:    0 4px 6px rgba(0,0,0,0.1)  ← cards, dropdowns
lg:    0 10px 15px rgba(0,0,0,0.15) ← modals, popovers

Rule: Tint shadows to match background hue (no pure black)
Dark mode: Use neutral-950/20 instead of black
```

---

## 2. Component Patterns (taste-skill)

### **Navigation**
- **Header Height:** 64px (desktop), collapse to hamburger at md (768px)
- **Pattern:** Sticky top nav with logo · breadcrumb · quick-search · user-menu
- **Mobile:** Logo · hamburger menu (full-screen overlay)

### **Forms**
- **Field Pattern:** Label (above) → Input (focus ring: 2px accent) → Helper text (optional) → Error text (below)
- **Gap between fields:** gap-4
- **Button height:** 40px (desktop), 44px (mobile)
- **CTA text:** Max 3 words, one-line only

### **Data Tables**
- **Header:** Sticky, bg-neutral-100 dark:bg-neutral-900, bold text
- **Rows:** border-b-1, hover: bg-neutral-50 dark:bg-neutral-800
- **Icons in rows:** Use Phosphor 20px (Medium weight)
- **Status badges:** Inline, use color-coded backgrounds + icon

### **Status Badges**
```html
<!-- Success -->
<span class="inline-flex items-center gap-2 px-3 py-1 rounded bg-green-100 dark:bg-green-900 text-green-900 dark:text-green-100 text-sm font-500">
  <CheckCircle2 size={16} />
  On Time
</span>

<!-- Warning -->
<span class="inline-flex items-center gap-2 px-3 py-1 rounded bg-yellow-100 dark:bg-yellow-900 text-yellow-900 dark:text-yellow-100 text-sm font-500">
  <AlertCircle size={16} />
  Delayed 15m
</span>

<!-- Error -->
<span class="inline-flex items-center gap-2 px-3 py-1 rounded bg-red-100 dark:bg-red-900 text-red-900 dark:text-red-100 text-sm font-500">
  <XCircle size={16} />
  Disrupted
</span>
```

### **Icons**
- **Library:** Phosphor Icons (preferred)
- **Size:** 16px (small), 20px (standard), 24px (large)
- **Weight:** Regular (400), all consistent
- **Alt text:** Required for all icons

---

## 3. Baseline Dials per Subsystem

### **Flight Operations** (Flight Planning, Dispatch, OCC Monitoring)
```
DESIGN_VARIANCE:    6    (asymmetric layouts OK, data density respected)
MOTION_INTENSITY:   4    (smooth transitions on status change, no flashiness)
VISUAL_DENSITY:     7    (packed data, but scannable with strategic space)

Layout Pattern: Sticky header + split-panel (left: filters, right: data table)
Key Interaction: Real-time status badge updates, row expand/collapse
Example: flight-planning-v1.html
```

### **Crew Management** (Rostering, Duty-Time Tracking, Qualification)
```
DESIGN_VARIANCE:    5    (balanced, professional)
MOTION_INTENSITY:   3    (minimal animation, focus on clarity)
VISUAL_DENSITY:     6    (moderate — forms + data mixed)

Layout Pattern: Tab interface (Rostering / Qualifications / Reserve)
Key Interaction: Month-view calendar drag-drop, quick filters
Example: crew-rostering-portal-v1.html
```

### **Aircraft Maintenance** (Maintenance Planning, MEL Tracking, Defect Log)
```
DESIGN_VARIANCE:    5    (professional, audit-friendly)
MOTION_INTENSITY:   3    (compliance-first, no distraction)
VISUAL_DENSITY:     7    (specs + checklists)

Layout Pattern: Sticky header + sidebar nav + accordion/collapse sections
Key Interaction: Form submission for defect log, approval workflow
Example: maintenance-planning-v1.html
```

### **Ground Operations** (Turnaround Coordination, Gate Assignment)
```
DESIGN_VARIANCE:    5    (organized grid)
MOTION_INTENSITY:   4    (real-time visual updates)
VISUAL_DENSITY:     6    (visual + data balanced)

Layout Pattern: Grid view (gates/zones) + timeline view (turnaround events)
Key Interaction: Drag-and-drop (gates), timeline scrubbing
Example: ground-ops-turnaround-v1.html
```

---

## 4. Anti-Tells for TOSS

**Strictly forbidden in all TOSS mockups** (taste-skill §9):

- ❌ **Em-dashes (`—`)** anywhere (headlines, eyebrows, body, labels)
- ❌ **Section-numbering eyebrows** (`001 · Flight Planning`, `02 · Crew`)
- ❌ **AI-purple glows / gradients** (use CAAV blue or neutral only)
- ❌ **Generic 3-equal-cards layout** (use bento grid or data table instead)
- ❌ **Scroll cues** (`Scroll`, `↓`)
- ❌ **Fake product screenshots** (divs pretending to be UI)
- ❌ **Placeholder text:** `Jane Doe` → use `Thảo Nguyễn` (real Vietnamese names)
- ❌ **Generic specs** `92%`, `4.1×` → use real data or label as `(mock)`
- ❌ **Photos credit lines** as decoration (`Frame XII · 35mm`)
- ❌ **Decoration text strips** (`FLIGHT · CREW · DISPATCH` at hero bottom)

---

## 5. Dark Mode Implementation

**TOSS mockups ship with BOTH light and dark modes:**

### **CSS Strategy**
Use **Tailwind `dark:` variant** for all color tokens:

```html
<div class="bg-white dark:bg-neutral-950">
  <h1 class="text-neutral-950 dark:text-neutral-50">Title</h1>
  <p class="text-neutral-700 dark:text-neutral-300">Content</p>
</div>
```

### **Respecting prefers-color-scheme**
```html
<script>
  // Default: respect system preference
  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.documentElement.classList.add('dark');
  }
</script>
```

### **Manual toggle** (optional)
```html
<button onclick="document.documentElement.classList.toggle('dark')">
  🌙 Dark Mode
</button>
```

---

## 6. Accessibility Baseline (WCAG AA)

**All mockups MUST pass:**

- ✅ **Contrast:** WCAG AA minimum (4.5:1 for body, 3:1 for large 18px+)
- ✅ **Forms:** Label `<label for="">`, no placeholder-as-label
- ✅ **Buttons:** Minimum 44px height (touch target)
- ✅ **Focus rings:** Visible 2px border in accent color
- ✅ **Alt text:** Images and icons
- ✅ **Semantic HTML:** `<button>`, `<a>`, `<form>`, proper heading hierarchy
- ✅ **Reduced motion:** Animations disabled under `prefers-reduced-motion: reduce`

---

## 7. Real Data Examples (NOT placeholders)

Replace all generic text with real aviation / TOSS domain data:

### ❌ Bad (AI slop)
```
Flight: ABC123
Aircraft: Some Aircraft
Crew: John Doe
Time: 2 hours
```

### ✅ Good (real TOSS data)
```
Flight: VN-HC-0342 (Hà Nội → Thành phố Hồ Chí Minh)
Aircraft: A321-200 (VN-A-ABC)
Crew: Capt. Nguyễn Văn A · FO Trần Thị B
Departure: 06:00 UTC · Arrival: 08:30 UTC
Status: On-Time (+2m schedule)
MEL: 32-41-17 (Cabin Window Mechanism — Deferrable per CAA-VIE)
```

---

## 8. File Structure for New Mockups

When creating a new subsystem mockup, follow this structure:

```
mockup/
├── [subsystem]/
│   ├── [screen-name]-v1.html          # Self-contained mockup
│   ├── [screen-name]-v2.html          # Iteration
│   └── DESIGN-NOTES.md                # Design decisions, dials, patterns
├── shared/
│   ├── TOSS-design-system.md          # This file
│   ├── component-patterns.html        # Reusable HTML components
│   └── taste-skill-checklists.md      # Pre-flight checklist reference
└── README.md                           # Overview of all mockups
```

**DESIGN-NOTES.md template:**
```markdown
---
subsystem: "Flight Operations"
screen: "Flight Planning"
version: "v1"
design_read: "Reading this as: operations control interface for flight planners, with a scan-speed language, leaning toward Fluent UI + restrained motion."
dials: "VARIANCE: 6, MOTION: 4, DENSITY: 7"
---

## Design Decisions
- Why sticky header?
- Why split-panel layout?
- Why real-time badge updates?

## Key Patterns
- Sticky top nav (Phosphor icons, 64px)
- Left sidebar filter panel (collapsible)
- Right data table (sortable, expandable rows)

## Status Badges
- On-Time (green): Schedule +/- 5 min
- Delayed (yellow): 5–30 min late
- Disrupted (red): 30+ min or cancelled

## Next Iteration
- Add print layout
- Add export to CSV
- Add night mode optimisation
```

---

## 9. Quick Reference: Checklist

**Before declaring any mockup done:**

- [ ] Design read stated (1-liner)
- [ ] Dials explicit (VARIANCE, MOTION, DENSITY)
- [ ] No em-dashes anywhere
- [ ] One accent color lock (CAAV blue)
- [ ] One theme lock (light or dark, not mixed)
- [ ] Dark mode tested
- [ ] Form labels ABOVE input
- [ ] CTA text one-line max
- [ ] Images real (Picsum seed or placeholder slots)
- [ ] Icons from Phosphor/Radix/Tabler (no custom SVG)
- [ ] Status badges color-coded
- [ ] Reduced motion respected
- [ ] WCAG AA contrast checked (4.5:1 body, 3:1 large)
- [ ] Real data examples (not "Jane Doe" / "Sample ABC")
- [ ] No scroll cues / version labels / decoration text
- [ ] Pre-Flight Check (taste-skill §14) — all 78 boxes ✓

---

## 10. Resources

- **taste-skill full reference:** `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md`
- **Integration guide:** `.claude/libraries/taste-skill/INTEGRATION-TOSS.md`
- **Phosphor Icons:** https://phosphoricons.com
- **Tailwind CSS:** https://tailwindcss.com
- **Fluent UI:** https://fluent2.microsoft.design

---

*Version 1.0 — 2026-06-23*  
*Baseline created from taste-skill + TOSS aviation domain*

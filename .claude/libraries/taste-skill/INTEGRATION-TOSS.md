---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
title: "taste-skill Integration Guide"
version: "1.0"
date: "2026-06-23"
---

# taste-skill Integration for TOSS Mockup Design

> **Dùng taste-skill làm base library cho tất cả mockup HTML UI/UX designs của TOSS.**

---

## 1. Giới thiệu taste-skill

**taste-skill** là một bộ design system anti-slop frontend chuyên thiết kế landing pages, portfolios, và redesigns. Các quy tắc trong taste-skill giúp:
- ✅ Tránh AI design defaults (AI-purple gradients, generic card stacks, centered heros everywhere)
- ✅ Xây dựng hierarchy rõ ràng, layout đa dạng
- ✅ Đảm bảo accessibility, performance, dark mode từ lúc thiết kế
- ✅ Tạo các mockup HTML tự chứa (self-contained), không phụ thuộc external CDN

**Vị trí trong project:**  
```
.claude/libraries/taste-skill/
├── README.md                    # Tài liệu chính (EN)
├── CHANGELOG.md
├── skills/
│   ├── taste-skill/            # Main skill (anti-slop design rules + patterns)
│   ├── redesign-skill/         # Redesign audit + evolution
│   ├── image-to-code-skill/    # Image → HTML
│   ├── imagegen-frontend-*/    # Image generation for web/mobile
│   ├── stitch-skill/           # Multi-section stitching
│   └── ...
├── examples/                    # Real examples (mockups, prototypes)
├── assets/                      # Reference images, SVGs
└── scripts/                     # Build & generation scripts
```

---

## 2. Khi nào dùng taste-skill?

### ✅ **Dùng taste-skill cho:**
- **Mockup HTML** cho các phân hệ TOSS (Flight Ops, Crew Mgmt, Maintenance, Ground Ops)
- **Landing page / Portal** cho TOSS (nếu có)
- **Wireframe tương tác** (interactive prototypes)
- **Design system reference** — khi xây dựng lại UI từ đầu

### ❌ **KHÔNG dùng taste-skill cho:**
- Dense product dashboards (use **Material Design** / **Fluent UI** instead)
- Data-heavy tables (use **TanStack Table** / **AG Grid**)
- Admin panels
- Real-time collaboration UIs

**TOSS primary use case:** Mockup HTML + interactive wireframes → Đây là phạm vi hoàn hình của taste-skill.

---

## 3. Quy trình thiết kế Mockup HTML (taste-skill workflow)

### **Bước 0: Design Read** (trước khi code)
Trước khi mở editor, hãy đọc brief và xác định:

```
Reading this as: <page kind> for <audience>, with a <vibe> language, 
leaning toward <design system or aesthetic family>.
```

**Ví dụ cho TOSS:**
- *"Reading this as: operations control dashboard for flight dispatchers, with a trust-first / scan-speed language, leaning toward Fluent UI tokens + restrained motion."*
- *"Reading this as: crew scheduling portal mockup for rostering officers, with a data-dense / scannable language, leaning toward Material 3 dark theme."*

### **Bước 1: Set the THREE DIALS** (taste-skill §1)
Mỗi mockup được điều khiển bởi 3 parameter:

```javascript
DESIGN_VARIANCE: 4-8     // Symmetrical → Asymmetric layouts
MOTION_INTENSITY: 3-6    // Static → Fluid animations
VISUAL_DENSITY: 4-7      // Airy → Cockpit / Packed data
```

**Cho TOSS:**
- Flight Ops dashboard → `VARIANCE: 6, MOTION: 4, DENSITY: 7` (data-heavy, scannable)
- Crew portal → `VARIANCE: 5, MOTION: 3, DENSITY: 6` (professional, accessible)
- Ground ops → `VARIANCE: 5, MOTION: 4, DENSITY: 6` (real-time, task-focused)

### **Bước 2: Pick Design System** (taste-skill §2)
Chọn base framework:

| Use Case | Framework | Why |
|---|---|---|
| **Flight Ops / Crew / Maintenance** (data + forms) | **Fluent UI** hoặc **Material 3** | Enterprise-grade, accessibility built-in |
| **Ground Ops** (real-time visual) | **Tailwind v4** + Motion | Faster iteration, lightweight |
| **Portal / public-facing** | **Tailwind v4** + Design tokens | Custom brand control |

### **Bước 3: Build Mock** (taste-skill §3-4)
Quy tắc design engineering:
- ✅ Use real images (gen tool / Picsum seed / placeholders)
- ✅ Respect typography discipline (no AI serif defaults, no Inter everywhere)
- ✅ ONE accent color, ONE theme (light or dark), lock them
- ✅ Real SVG icons (Phosphor / Radix / Tabler, no custom SVG hands)
- ✅ Form labels ABOVE input, no placeholder-as-label
- ✅ CTA buttons one-line max, WCAG AA contrast checked

### **Bước 4: Anti-Tells & Final Check** (taste-skill §9)
Trước ship, audit:
- ❌ NO em-dashes (`—`) anywhere
- ❌ NO AI-purple glows, no generic 3-equal-cards
- ❌ NO section-numbering eyebrows (`001 · Capabilities`)
- ❌ NO fake product previews (divs pretending to be UI)
- ❌ NO scroll-cues (`Scroll`, `↓`)
- ✅ All visible text re-read (no AI hallucinations)
- ✅ Motion motivated (hierarchy / feedback / state change, not "looks cool")
- ✅ Reduced-motion respected for anything > MOTION_INTENSITY: 3

**Complete Pre-Flight Checklist:** taste-skill README §14 (78 checkboxes)

---

## 4. Template Directories for TOSS Mockups

Để organized, khi tạo mockup mới cho TOSS:

```
ba/workspace/drafts/mockup/
├── flop-ops/                           # Flight Operations mockups
│   ├── flight-planning-v1.html
│   ├── dispatch-release-v1.html
│   ├── occ-monitoring-v1.html
│   └── DESIGN-NOTES.md
├── crew-mgmt/                          # Crew Management mockups
│   ├── rostering-portal-v1.html
│   ├── duty-time-tracking-v1.html
│   └── DESIGN-NOTES.md
├── maintenance/                        # Aircraft Maintenance mockups
│   ├── maintenance-planning-v1.html
│   └── DESIGN-NOTES.md
├── ground-ops/                         # Ground Operations mockups
│   ├── turnaround-coordination-v1.html
│   └── DESIGN-NOTES.md
└── shared/                             # Shared design assets
    ├── design-system.md                # TOSS design tokens (colors, typography, spacing)
    ├── component-patterns.md           # Reusable component blocks
    └── taste-skill-baseline.md         # This project's dial baseline
```

**DESIGN-NOTES.md per subsystem:**
```markdown
---
subsystem: "Flight Operations"
dial_baseline: "VARIANCE: 6, MOTION: 4, DENSITY: 7"
design_system: "Fluent UI + custom TOSS tokens"
audience: "Flight dispatchers, operations controllers, OCC staff"
key_patterns: ["sticky-header nav", "real-time status badges", "scrollable data tables"]
---

# Design Notes — Flight Operations

## Baseline Dials
...
```

---

## 5. Creating a TOSS Design System (Optional but Recommended)

Nếu muốn tạo design system unified cho tất cả TOSS subsystems:

### **5.A Token Definition**
```
colors:
  brand:
    primary: #005A9C    # CAAV blue (Vietnam Civil Aviation)
    accent: #FF6B35    # Alert / action orange
    success: #28A745
    error: #DC3545
    warn: #FFC107
  neutral:
    50: #FAFAFA
    100: #F5F5F5
    900: #212121
    950: #0F0F0F
  semantic:
    surface: --color-neutral-50 (light) / --color-neutral-950 (dark)
    surface-elevated: --color-neutral-100 (light) / --color-neutral-900 (dark)
    text-primary: --color-neutral-950 (light) / --color-neutral-50 (dark)

typography:
  font-family: Geist, -apple-system, BlinkMacSystemFont, sans-serif
  display: text-5xl md:text-6xl font-600 tracking-tight
  headline: text-2xl md:text-3xl font-600 leading-snug
  body: text-base text-neutral-700 dark:text-neutral-300 leading-relaxed

spacing:
  section-gap: py-16 md:py-24
  component-gap: gap-4 md:gap-6
  container-max: max-w-[1400px] mx-auto px-4 md:px-8
```

### **5.B Component Library** (Tailwind + taste-skill patterns)
```
components/
├── Header.html       # Sticky nav with branding
├── HeroSection.html  # Split-screen or asymmetric hero
├── FeatureGrid.html  # Bento grid (NOT 3-equal cards)
├── DataTable.html    # Scannable, icon-enabled table
├── FormSection.html  # Label-above pattern, WCAG AA
├── StatusBadge.html  # Real-time status indicator
├── CTAButton.html    # One-line, high-contrast CTA
├── Footer.html       # Simple footer with links
└── DarkModeSwitch.html
```

### **5.C Copy the taste-skill base rules into TOSS context**
```
toss-design-system.md:
- "For Flight Ops / Crew / Maintenance: prefer Fluent UI over Tailwind (enterprise trust)"
- "ALL mockups respect Vietnamese language + aviation terminology"
- "NO em-dashes (đã test, đây là AI tell)"
- "ONE accent color (CAAV blue #005A9C) across entire system"
- "Real data examples: actual flight numbers, crew names, MEL codes — not 'Sample ABC'"
```

---

## 6. CLI / Skill Integration Points

### **6.A When to invoke taste-skill skills**

**In your Claude Code workflow:**

```
# For new mockup:
/gen-mockup      # Gen from BA spec

# For audit existing mockup:
/design-taste-frontend  # Run taste-skill Pre-Flight Check

# For image → HTML:
/image-to-code-skill    # Convert screenshot to code

# For redesign of existing:
/redesign-skill         # Audit + modernise existing mockup
```

**In multi-agent pipeline (future):**
```
BA Spec
  ↓
gen-mockup (taste-skill base)
  ↓
ui-reviewer (check against taste-skill rules + TOSS glossary)
  ↓
runtime-verify (test in browser)
```

### **6.B taste-skill as a reference prompt**

When using `/gen-mockup` or asking Claude to design UI for TOSS:

**Prompt template:**
```
Create a mockup HTML for [TOSS subsystem]. 

Context:
- Audience: [dispatchers / rostering officers / maintenance planners]
- Design read: [reading this as: ... for ..., with ... language]
- Dials: VARIANCE: X, MOTION: X, DENSITY: X
- Base system: [Fluent UI / Tailwind v4]

Constraints (taste-skill):
- NO em-dashes
- ONE accent color lock: CAAV blue (#005A9C)
- Real images (use picsum.photos seed for aviation-themed placeholder)
- Form labels ABOVE input
- CTA text one-line max
- Run Pre-Flight Check before output
- Reference: .claude/libraries/taste-skill/skills/taste-skill/SKILL.md §14
```

---

## 7. Quick Reference: taste-skill Key Rules (for TOSS)

| Rule | Why | TOSS Impact |
|---|---|---|
| **Brief Inference (§0)** | Don't default to "hero + 3 cards" — read the brief first | Crew portal ≠ Flight ops UI layout |
| **Three Dials (§1)** | Every design is a dial setting, not a binary | High-density flight ops needs DENSITY: 7 |
| **No AI Tells (§9)** | em-dashes, AI-purple, "Acme", "Jane Doe" = instant fail | Every mockup audit removes these |
| **Design System Pick (§2)** | One system per project (Fluent OR Tailwind, not mixed) | TOSS will use Fluent UI for all dashboards |
| **Pre-Flight Checklist (§14)** | 78-point mechanical audit before ship | Mockup not done until ALL checkboxes pass |
| **Image Strategy (§4.8)** | Real images first, then Picsum, then placeholders | Use `https://picsum.photos/seed/toss-flight-dispatch/1600x1200` |
| **Motion Motivation (§5)** | Every animation must justify itself in one sentence | No "micro-interactions everywhere" |
| **Dark Mode (§8)** | Design both modes from start, test in both | TOSS will ship light + dark |

---

## 8. Example: Flight Operations Mockup Workflow

**Scenario:** Create mockup for Flight Planning screen (part of Flight Operations subsystem)

### **Step 1: Design Read**
```
Reading this as: operations control interface for flight planners / dispatchers,
with a scan-speed / trust-first language, leaning toward Fluent UI + restrained motion.
```

### **Step 2: Dials**
```
DESIGN_VARIANCE: 6    (asymmetric layout OK, real data needs breathing room)
MOTION_INTENSITY: 4   (smooth transitions on state change, no infinite loops)
VISUAL_DENSITY: 7     (packed data, but scannable with strategic white space)
```

### **Step 3: System & Tokens**
```
Base: Fluent UI (React) + custom TOSS tokens
Colors: CAAV blue primary (#005A9C), orange alert (#FF6B35)
Typography: Geist, headline: text-2xl font-600
Density: Sticky header, scrollable data table, sidebar nav
```

### **Step 4: Layout Blocks (taste-skill §10)**
- **Hero:** Not applicable (no marketing hero for internal tool)
- **Sticky Header:** Nav + breadcrumb + quick-search
- **Sidebar:** Flight filter panel (collapsible on mobile)
- **Main Content:** Data table of planned flights + real-time status badges
- **Footer:** Status bar (last sync time, connection state)

### **Step 5: Component List**
```html
<Header sticky>
  <Logo>
  <Nav> (Flight Planning · Dispatch · Monitoring)
  <QuickSearch>
  <UserMenu>
</Header>

<div class="grid grid-cols-[250px_1fr]">
  <Sidebar>
    <FilterPanel> (Date, Aircraft, Crew status, Route)
    <StatusSummary> (On-time %, Disruptions, MEL issues)
  </Sidebar>
  
  <MainContent>
    <Breadcrumb>
    <SectionHeader> (Flights — 2026-06-23)
    <DataTable>
      <Columns>
        Flight# · Aircraft · Crew · Departure · Arrival · Status · Actions
      <Rows>
        [real flight data]
        [status badges: ON-TIME, DELAYED, DISRUPTED]
        [action buttons: Edit · Dispatch · Cancel]
    </DataTable>
  </MainContent>
</div>

<Footer>
  <ConnectionStatus> (Last sync: 2s ago)
  <HelpLink>
</Footer>
```

### **Step 6: Pre-Flight Check (taste-skill §14)**
✅ All 78 boxes:
- Brief declared ✓
- Dials explicit ✓
- Design system chosen ✓
- ZERO em-dashes ✓
- One theme lock ✓
- One accent color lock ✓
- Form labels above ✓
- CTA text one-line max ✓
- Images real (Picsum) ✓
- Dark mode tested ✓
- Reduced motion respected ✓
- ... (74 more)

### **Step 7: Output**
```
flight-planning-v1.html  (self-contained, no external CDN)
├── Inline CSS (Tailwind purged)
├── Dark mode media query
├── Accessibility: WCAG AA forms, alt text on images
└── 2. Browser test (light + dark, mobile collapse, reduced motion)
```

---

## 9. Files to Keep Handy

- **`.claude/libraries/taste-skill/skills/taste-skill/SKILL.md`** — Main reference (all rules, all patterns)
- **`.claude/libraries/taste-skill/README.md`** — taste-skill overview
- **`ba/workspace/drafts/mockup/shared/design-system.md`** — TOSS-specific token definitions
- **`ba/workspace/drafts/mockup/shared/taste-skill-baseline.md`** — TOSS dial defaults

---

## 10. Next Steps for TOSS

1. **Confirm design system choice:** Fluent UI or Tailwind for TOSS?
   - *Recommendation:* Fluent UI for internal tools (dashboards, crew portals, maintenance), Tailwind for public-facing pages
2. **Create TOSS design tokens** (`ba/workspace/drafts/mockup/shared/design-system.md`)
3. **Set mockup baseline dials** (per subsystem: flight ops, crew, maintenance, ground ops)
4. **First mockup:** Use taste-skill workflow for [subsystem] mockup v1
5. **Team training:** Share taste-skill rules + anti-tells with BA/UX team

---

*Integration date: 2026-06-23*  
*taste-skill version: Latest from leonxlnx/taste-skill*  
*TOSS version: CLAUDE.md v2.2*

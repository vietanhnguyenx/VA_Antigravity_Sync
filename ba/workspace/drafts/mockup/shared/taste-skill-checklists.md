---
project: "TOSS"
title: "Pre-Flight Checklist (taste-skill §14)"
version: "1.0"
date: "2026-06-23"
---

# Pre-Flight Checklist — Before Shipping Any Mockup

> **78-point mechanical audit. Run this before declaring mockup done.**
> 
> **Reference:** `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` §14 (complete 78-point checklist)

---

## Quick Version (12 Critical Boxes)

**Run these FIRST — if any fails, stop and fix:**

- [ ] Design read stated (one-liner: "Reading this as...")
- [ ] Dials explicit (VARIANCE, MOTION, DENSITY values)
- [ ] NO em-dashes (`—`) anywhere (headlines, body, labels, buttons)
- [ ] One accent color lock (CAAV blue #005A9C used consistently)
- [ ] One theme lock (light OR dark, not mixed sections)
- [ ] Dark mode tested and working
- [ ] Form labels ABOVE input (no placeholder-as-label)
- [ ] CTA buttons text: ONE line max at desktop
- [ ] Images real (Picsum seed, generated, or `<!-- TODO: image -->`placeholders)
- [ ] Icons from Phosphor/Radix/Tabler ONLY (no custom SVG)
- [ ] WCAG AA contrast checked (4.5:1 body text, 3:1 large 18px+)
- [ ] Real data used (VN-HC-0342, Nguyễn Văn A, MEL codes — NOT "John Doe")

**If all 12 pass → continue to Full Audit below**

---

## Full Audit (All 78 Boxes)

### **Phase 1: Design Foundation (§0–2)**

- [ ] Brief inference declared (§0.B) — design read is ONE clear sentence
- [ ] Dial values explicit and reasoned from brief (§1) — not silently using baseline
- [ ] Design system chosen from taste-skill §2 (Fluent, Material, Tailwind, etc.) — ONE only
- [ ] Redesign mode detected if applicable (§11) — and audit performed

### **Phase 2: Typography (§4.1)**

- [ ] Display/Headlines: `text-4xl md:text-6xl tracking-tighter leading-none` (or justified override)
- [ ] Body/Paragraphs: `text-base text-gray-600 dark:text-gray-400 leading-relaxed max-w-[65ch]`
- [ ] Font choice NOT Inter by default (Geist, Outfit, Cabinet Grotesk, Satoshi preferred)
- [ ] **SERIF DISCIPLINE:** If serif used, is it explicitly justified (brand names it, editorial/luxury aesthetic claimed) AND not `Fraunces` / `Instrument_Serif`?
- [ ] Different serif from previous project (rotation rule)
- [ ] **ITALIC DESCENDER CLEARANCE:** Every italic word with `y g j p q` has `leading-[1.1]` min + `pb-1` reserve

### **Phase 3: Color (§4.2)**

- [ ] Max 1 accent color (CAAV blue #005A9C for TOSS)
- [ ] Accent saturation < 80% (not neon bright)
- [ ] **LILA RULE:** No AI-purple glows / neon gradients (use neutral bases + high-contrast singular accent)
- [ ] One palette per project (not fluctuating warm ↔ cool grays)
- [ ] **COLOR CONSISTENCY LOCK:** Accent color used on ENTIRE page identically (not random blue badge in section 7 on a warm-grey page)
- [ ] **PREMIUM-CONSUMER PALETTE BAN:** If premium-consumer brief, palette is NOT default beige+brass+oxblood (#f5f1ea, #b08947, #9a2436 family)
- [ ] Dark mode colors defined and tested

### **Phase 4: Layout (§4.3–4.7)**

- [ ] **ANTI-CENTER BIAS:** If `DESIGN_VARIANCE > 4`, hero is NOT centered (split-screen, left-align, asymmetric used)
- [ ] **Hero fits viewport:** Headline ≤ 2 lines, subtext ≤ 20 words AND ≤ 4 lines, CTAs visible without scroll
- [ ] **Hero font-scale discipline:** Font sizes and image size planned together (not 6-word headline at text-8xl)
- [ ] **HERO TOP PADDING CAP:** Max `pt-24` at desktop (content doesn't float halfway down viewport)
- [ ] **HERO STACK DISCIPLINE:** Max 4 text elements (eyebrow OR brand strip, headline, subtext, CTAs) — NO tiny tagline below CTAs, NO trust micro-strip in hero
- [ ] **Navigation ONE line at desktop** — if items don't fit at `lg`, condense labels or hamburger
- [ ] **Navigation height ≤ 80px** (default 64-72px)
- [ ] **Bento grids have rhythm** — not 6 left-image / right-text rows (varied composition)
- [ ] **BENTO CELL COUNT RULE:** Exactly as many cells as content (3 items → 3 cells, no empty cells in middle)
- [ ] **Section-Layout-Repetition Ban:** No two sections use the same layout family (at least 4 different families across 8 sections)
- [ ] **ZIGZAG ALTERNATION CAP:** Max 2 consecutive "left-image + right-text" sections (3rd alternation is Fail)
- [ ] **EYEBROW RESTRAINT:** Max 1 eyebrow per 3 sections (count instances of `uppercase tracking` — if count > ceil(sectionCount / 3), Fail)
- [ ] **SPLIT-HEADER BAN:** No "left big headline + right small paragraph" section header (stack vertically instead)

### **Phase 5: Cards & Containers (§4.4)**

- [ ] Cards used ONLY when elevation communicates real hierarchy (otherwise border-t, divide-y, or negative space)
- [ ] When shadow used, tinted to background hue (not pure black)
- [ ] For `VISUAL_DENSITY > 7`: generic card containers banned (data breathes in plain layout)
- [ ] **SHAPE CONSISTENCY LOCK:** ONE corner-radius scale (all-sharp OR all-soft OR all-pill) — mixed only with documented rule (buttons pill, cards 16px, inputs 8px) and enforced

### **Phase 6: Interactive UI States (§4.5)**

- [ ] **Loading:** Skeletal loaders matching final layout shape
- [ ] **Empty States:** Beautifully composed, indicate how to populate
- [ ] **Error States:** Clear, inline (forms) or contextual (toasts transient only)
- [ ] **Tactile Feedback:** On `:active`, use `-translate-y-[1px]` or `scale-[0.98]`
- [ ] **BUTTON CONTRAST CHECK:** Every button text readable against button background (white on white, transparent on transparent = Fail)
- [ ] **CTA BUTTON WRAP BAN:** CTA label fits ONE line at desktop (3 words max for primary CTAs) — wrapped buttons = Fail
- [ ] **NO DUPLICATE CTA INTENT:** Two CTAs with same intent on page = Fail ("Get in touch" + "Contact us" = both contact intent)
- [ ] **FORM CONTRAST CHECK:** Inputs, placeholders, focus rings, labels, error text all WCAG AA against section background

### **Phase 7: Data & Forms (§4.6)**

- [ ] Label ABOVE input (no placeholder-as-label)
- [ ] Helper text optional but present in markup
- [ ] Error text BELOW input
- [ ] `gap-2` for input blocks

### **Phase 8: Images & Visuals (§4.8)**

- [ ] **Image-gen tool used FIRST** if available (hero photography, section-specific assets)
- [ ] **Real web images SECOND** — Picsum seed (`https://picsum.photos/seed/{descriptive}/{w}/{h}`) or actual stock URLs
- [ ] **Last resort:** Placeholder slots (`<!-- TODO: hero image, 1600x1200 -->`) — NOT hand-rolled SVG fake screenshots
- [ ] **Real company logos for social proof** — Simple Icons / devicon SVG, NOT plain text wordmarks
- [ ] **LOGO-ONLY rule:** Logo wall = logos + nothing else (no "Vercel · hosting" labels below logos)
- [ ] Hand-rolled decorative SVGs strongly discouraged (only if brief explicitly calls for custom illustration)
- [ ] **Div-based fake screenshots BANNED** — NOT "hand-built product preview" with divs
- [ ] **Hero needs real visual** — text + gradient blob is NOT a hero

### **Phase 9: Content Density (§4.9)**

- [ ] Short headline (≤ 8 words) + short sub-paragraph (≤ 25 words) + one visual OR one CTA per section
- [ ] **No data-dump sections** — top 3–5 highlights + "View full list" OR carousel OR different page
- [ ] **Long lists (> 5 items)** NOT default `<ul>` — use 2-column split, card grid, tabs, carousel, or marquee
- [ ] **Spec sheets specifically:** NOT 10 rows with `border-b` on every row — use 2-col card grid, scroll-snap pills, or grouped chunks instead
- [ ] **COPY SELF-AUDIT:** Every visible string re-read — no grammatically broken ("free on its past"), unclear referents, AI hallucination (forced metaphors), LLM-sounding cute copy
- [ ] **Fake-precise numbers:** Either from real data, labeled mock, or not included

### **Phase 10: Quotes & Testimonials (§4.10)**

- [ ] Max 3 lines of quote body (cut if longer)
- [ ] NO em-dashes inside quote text
- [ ] Attribution: name + role + (optionally) company
- [ ] Real typographic quotes (`" "`) or none at all (not straight ASCII `"`)

### **Phase 11: Theme Lock (§4.11)**

- [ ] Page has ONE theme (light, dark, or auto)
- [ ] Sections do NOT invert mid-page (no light-warm-paper between dark sections)
- [ ] Exception: if brief explicitly calls for "Color Block Story" with ONE deliberate switch, allowed once

### **Phase 12: Context-Aware Proactivity (§5)**

- [ ] **Liquid Glass / Glassmorphism:** Used only for premium/Apple-adjacent/luxury (NOT dashboards / public-sector)
- [ ] **Magnetic Micro-physics:** Used only if `MOTION_INTENSITY > 5` AND brief reads premium/playful/agency — isolated in `useMotionValue` (NOT `useState`)
- [ ] **Perpetual Micro-Interactions:** Used only if `MOTION_INTENSITY > 5` AND section benefits (NOT every card needs infinite loop)
- [ ] **"Motion claimed = motion shown":** If `MOTION_INTENSITY > 4`, page actually animates (not just claimed)
- [ ] **MOTION MUST BE MOTIVATED:** Every animation justified in one sentence (hierarchy / storytelling / feedback / state transition)
- [ ] **MARQUEE MAX-ONE-PER-PAGE:** No two horizontal marquees on same page
- [ ] **GSAP Sticky-Stack:** If used, `start: "top top"` (not "top center"), `pin: true`, correct scrub
- [ ] **GSAP Horizontal-Pan:** If used, `start: "top top"`, `pin: true`, `end: "+=${distance}"`, `scrub: 1`

### **Phase 13: Performance & Accessibility (§6)**

- [ ] **Hardware Acceleration:** Animate ONLY `transform` and `opacity` (NOT top/left/width/height)
- [ ] **Reduced Motion:** Anything `MOTION_INTENSITY > 3` honors `prefers-reduced-motion:reduce`
- [ ] **Dark Mode:** Designed for BOTH modes from start, tested in both
- [ ] **Core Web Vitals targets:** LCP < 2.5s, INP < 200ms, CLS < 0.1
- [ ] **DOM Cost:** Grain/noise filters ONLY on fixed `pointer-events-none` pseudo-elements (NOT scrolling containers)
- [ ] **Z-Index Restraint:** Used strictly for systemic layers (sticky nav, modals, overlays, grain) — documented scale

### **Phase 14: AI Tells (§9)**

#### **Visual & CSS**
- [ ] NO neon / outer glows (use inner borders or subtle tinted shadows)
- [ ] NO pure black `#000000` (use off-black, zinc-950, charcoal)
- [ ] NO oversaturated accents (desaturate to blend with neutrals)
- [ ] NO excessive gradient text for large headers
- [ ] NO custom mouse cursors

#### **Typography**
- [ ] NO Inter as default (Geist, Outfit, Cabinet Grotesk, Satoshi used first)
- [ ] NO oversized H1s that just scream (control hierarchy with weight + color)
- [ ] Serif constraints: serif for editorial/luxury/publication only (NOT dashboards)

#### **Layout & Spacing**
- [ ] NOT mathematically perfect padding/margins with awkward gaps
- [ ] NO 3-column equal feature cards (use 2-column zig-zag, asymmetric grid, or scroll-pinned)

#### **Content & Data (Jane Doe Effect)**
- [ ] NO generic names (`John Doe`, `Sarah Chan` → use creative, realistic, locale-appropriate names)
- [ ] NO generic avatars (no SVG egg or Lucide user icons → use photo placeholders or specific styling)
- [ ] NO fake-perfect numbers (avoid `99.99%`, `50%`, `1234567` → use organic `47.2%`, `+1 (312) 847-1928`)
- [ ] NO startup-slop brand names (`Acme`, `Nexus`, `SmartFlow`, `Cloudly` → invent contextual, premium names)
- [ ] NO filler verbs (`Elevate`, `Seamless`, `Unleash`, `Next-Gen`, `Revolutionize` → concrete verbs only)

#### **External Resources**
- [ ] NO hand-rolled SVG icons (use Phosphor / HugeIcons / Radix / Tabler)
- [ ] Hand-rolled decorative SVGs strongly discouraged
- [ ] NO div-based fake screenshots
- [ ] NO broken Unsplash links (use Picsum seed or actual assets)
- [ ] shadcn/ui customization: allowed but NEVER in default state

#### **Production-Test Tells (Hard Bans)**

**Hero & top-of-page:**
- [ ] NO version labels in hero (`V0.6`, `BETA`, `EARLY ACCESS` — only if brief is explicitly launch)
- [ ] NO "Brand · No. 01"-style sub-eyebrows

**Section numbering & micro-labels:**
- [ ] NO section-number eyebrows (`00 / INDEX`, `001 · Capabilities`, `06 · how it works`)
- [ ] NO `01 / 4`-style pagination on images or tiles
- [ ] NO `Scroll · 001 Capabilities`-style scroll cues
- [ ] NO "Index of Work, 2018 - 2026"-style range labels

**Separators & dots:**
- [ ] Middle-dot `·` rationed — max 1 per line (NOT `foo · bar · baz · qux · quux`)
- [ ] NO decorative colored status dots on every list/nav/badge (only for real semantic state, sparingly)

**Em-dashes & typography flourishes:**
- [ ] **NO em-dash (`—`) ANYWHERE** — headlines, eyebrows, pills, body, quotes, buttons, alt text (ZERO em-dashes)
- [ ] NO `<br>`-broken-and-italicized headlines as design move
- [ ] NO vertical rotated text (unless brief is explicitly agency/Awwwards/experimental)
- [ ] NO crosshair / hairline grid lines as decoration

**Fake product previews:**
- [ ] NO div-based fake product UI in hero (fake task list, fake terminal)
- [ ] NO fake version footers (`v0.6.2-rc.1`, `last sync 4s ago`)

**Marketing-copy tells:**
- [ ] NO "Quietly in use at" / "Quietly trusted by" (use natural language instead)
- [ ] NO "From the field" / "Field notes" / "Currently on the bench" (use plain labels)
- [ ] NO "We respect the French ones"-style mock-humble industry references
- [ ] NO weather / locale strips (`LIS 14:23 · 18°C`) unless brief is place-focused
- [ ] NO micro-meta-sentences under eyebrows
- [ ] NO generic step labels (`Stage 1 / Stage 2`, `Step 1 / Step 2` — use verb-noun directly)

**Pills, labels, version stamps:**
- [ ] NO pills/labels/tags overlaid on images (`Brand · 02`, `Field notes - journal`)
- [ ] NO photo-credit captions as decoration
- [ ] NO version footers on marketing pages (`v1.4.2`, `Build 0048`)
- [ ] NO "Reservation 412 of 800"-style live-stock counters

**Decoration text strips:**
- [ ] NO decoration text strip at hero bottom (`BRAND. MOTION. SPATIAL.`)
- [ ] NO floating top-right sub-text in section headings

**Lists, dividers, scoring:**
- [ ] NO `border-t` + `border-b` on every row of long list/spec table
- [ ] NO scoring/progress bars with filled background tracks

**Locale, time, scroll cues:**
- [ ] Locale / city-name / time / weather strips BANNED for 99% of briefs
- [ ] **Scroll cues BANNED** (`Scroll`, `↓`, `Scroll to explore`, `Scroll to walk through`)
- [ ] **ZERO decorative status dots by default**

### **Phase 15: EM-DASH BAN (§9.G — The Single Most-Violated Tell)**

**EM-DASH (`—`) IS COMPLETELY BANNED. NO EXCEPTIONS.**

- [ ] ZERO em-dashes in headlines
- [ ] ZERO em-dashes in eyebrows / labels / pills / buttons / captions / nav
- [ ] ZERO em-dashes in body copy
- [ ] ZERO em-dashes in quote attribution
- [ ] ZERO em-dashes in any en-dash form (`–`) when used as separator

**The ONLY permitted dash characters:**
- Regular hyphen `-` (compound words, ranges, line dividers)
- Minus sign in math (`-5°C`)

**If output contains a single `—` or `–` anywhere visible, output FAILS Pre-Flight.**

### **Phase 16: Redesign Protocol (§11)**

**(Skip if this is greenfield — not a redesign)**

- [ ] Mode detected (preserve vs overhaul)
- [ ] Current state audited (brand tokens, IA, content blocks, patterns)
- [ ] Dial reading extracted from existing site
- [ ] IA preserved (page slugs, nav labels stable for SEO)
- [ ] Brand colors extracted before Section 4.2 applied
- [ ] Copy voice preserved (unless rewrite requested)
- [ ] Existing accessibility wins honored
- [ ] Analytics event names stable

### **Phase 17: Block Library (§12)**

**(Skip if using pre-built blocks)**

- [ ] Block file has required frontmatter (name, category, dial_compatibility, when_to_use, stack)
- [ ] Required body sections present (visual sketch, props API, code sketch, mobile fallback, motion variants, dark-mode notes, anti-patterns, references)
- [ ] Block works standalone (drop into page, renders)
- [ ] Block passes Pre-Flight Check
- [ ] Design system blocks named with `--<system>` suffix if applicable

---

## ✅ Final Sign-Off

**Run all 78 boxes. Count:**
- ✓ Passed: _____ / 78
- ✗ Failed: _____ / 78

**If Failed > 0 → NOT DONE. Fix and re-audit.**

**If Failed = 0 → Ready to ship.**

---

## 🔗 References

- **Full taste-skill checklist:** `.claude/libraries/taste-skill/skills/taste-skill/SKILL.md` §14 (authoritative source)
- **TOSS design system:** `shared/TOSS-design-system.md`
- **This quick checklist:** `taste-skill-checklists.md`

---

*Version 1.0 — 2026-06-23*  
*Extracted from taste-skill SKILL.md §14, adapted for TOSS*

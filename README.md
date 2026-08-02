# VoiceIQ

**Vocal Coaching Intelligence Platform**

A web-based lesson player and knowledge system for vocalists who take regular lessons with a teacher. VoiceIQ transforms annotated lesson recordings into a structured, navigable reference — bridging the gap between the coaching room and the practice room.

---

## What it does

VoiceIQ loads a voice lesson audio file and a structured JSON database of timestamped markers. Each marker is annotated with a prefix that describes its role in the lesson:

| Prefix | Meaning |
|---|---|
| `ex:` | Exercise — a discrete vocal exercise |
| `ti:` | Teacher instruction — a specific directive requiring intentional focus |
| `lu:` | Lead up — pre-exercise setup instructions (posture, mouth shape, breath) |

Clicking any marker jumps the audio directly to that moment in the lesson. The exercise sidebar provides quick navigation across the full session.

---

## Features

- Session selector — switch between lessons
- Exercise sidebar with jump-to navigation
- Click any marker to jump to that timestamp in the full lesson audio
- Spacebar to play/pause globally
- ±10 second skip buttons
- Persistent audio player bar with scrubber
- Colour coded marker rows — purple (ex), orange (lu), green (ti)
- Responsive layout — desktop, tablet, and mobile
- Hamburger drawer navigation on mobile

---

## Project structure

```
VoiceIQ/
├── index.html                  — main app
├── voice_lessons_markers.json  — lesson and marker database
├── .gitignore
└── Audio/                      — lesson audio files (not in repo, hosted separately)
    ├── Voice 260611_095930_voice_lesson_bonnie.mp3
    ├── Voice 260618_103323_voice_lesson_bonnie.mp3
    ├── Voice 260709_113107_voice_lesson_bonnie.mp3
    ├── Voice 260716_120255_voice_lesson_bonnie.mp3
    ├── Voice 260723_120543_voice_lesson_bonnie.mp3
    └── Voice 260730_120226_voice_lesson_bonnie.mp3
```

---

## JSON structure

Each session in `voice_lessons_markers.json` follows this shape:

```json
{
  "file": "Voice 260611_095930_voice_lesson_bonnie",
  "duration": "33:29",
  "source_file": "Voice 260611_095930_voice_lesson_bonnie.mp3",
  "csv": "regions_markers_voice260611.csv",
  "tags": [],
  "markers": [
    {
      "id": "M1",
      "time": "0:00:09.000000",
      "note": "Intro",
      "tags": [],
      "seconds": 9.0
    },
    {
      "id": "M3",
      "time": "0:04:22.000000",
      "note": "ex: 13531 ascending lip trills",
      "tags": [],
      "seconds": 262.0
    }
  ]
}
```

---

## Running locally

No build step required. Open in VS Code and use the [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) extension:

1. Place lesson audio files in an `Audio/` subfolder
2. Right-click `index.html` → **Open with Live Server**

Audio files must match the `source_file` field in `voice_lessons_markers.json`.

---

## Annotation workflow

Lessons are recorded and annotated in real time on a phone audio app using timestamped bookmarks. After each lesson, a screenshot of the bookmark list is submitted for processing — the markers are OCR'd and parsed into CSV (for Reaper DAW navigation) and JSON (for this player).

The prefix system (`ex:`, `ti:`, `lu:`) is applied at annotation time, making downstream processing deterministic and the Exercise Intelligence Report generatable automatically.

---

## Roadmap

- [ ] Search across all teacher instructions
- [ ] Practice agenda builder
- [ ] Practice journal with per-exercise ratings
- [ ] AI insight layer — pattern detection across lessons
- [ ] Vocalise library linked to exercise markers
- [ ] Multi-user support (teacher dashboard)

---

## Background

This project grew out of a real workflow developed during voice lessons with teacher **Bonnie Zwigard**. The annotation system, data structures, and processing pipeline emerged organically from practice — and represent a genuine unmet need in the vocal education market. See `VoiceIQ_Product_Spec.md` for the full product vision.

---

*VoiceIQ — v0.1 — July 2026*

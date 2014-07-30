\header {
       title = "Spinning Wheel Song"
     }

     global = {
        \time 6/8
        \key g \major
     }

     melody = \relative c'' { \override TextSpanner #'direction = #1
       \clef treble
       R2.*4
       d4. \stemUp b8( a g)
       a( b) a d,4 d16 d
       b'4 b8 b4 g8 \stemNeutral
       a2 r4
       c8[ d] c b c b
       a[( g]) d g4 d16 e
       \stemUp d8 b'4 a b8
       g2 r4
       b4. b4 b8
       a4( b8) a4 \stemNeutral c8 \stemUp
       b4 b8 fis4 a8
       g4.( e4) e16^\markup { \italic Andante. } fis
       g4 fis8 e4 b'8 \stemNeutral \dynamicUp c4\< a8\!
       d4\fermata d,8 \override TextSpanner #'edge-text = #'("slower. " . "")
       d\startTextSpan d4 b'4 a8 g2\stopTextSpan r4
       R2.*4
       d'4.^\markup { \italic dolce. } d4 b8
       \stemUp b4 a8 e4. \stemNeutral
       fis8 g a fis( g) a
       d,2 r8 d8
       b' b4 c b8
       \stemUp b4 \stemNeutral a8 e4 c'8
       \stemUp b4 d,8 a'4 b8
       g2. \bar ".|."
     }

     text = \lyricmode {
       \skip 2.*4
       \set stanza = "1. "
       My4. god-8 mother4
       bids4 me8 spin,4 that16 my
       heart4 may8 not4 be8
       sad.2 \skip 4
       Spin4 and8 sing for my
       brother's4. sake,4 and16 the
       spinning4. makes4 me8
       glad.2 \skip 4 \set stanza = "2. "
       Spin,4. sing4 with8
       humming4. whir,4 the8
       wheel4 goes8 round4 and8
       round.2 \skip 8 For16 my
       brother's4. sake,4 the8
       charm4 I'll8 break,4 Prince8
       Hero4. shall4 be8
       found.2 \skip 4
       \skip 2.*4
       Spin,4. sing,4 the8
       golden4. thread,4.
       Gleams8 in the sun's4 bright8
       ray,2 \skip 8 The8
       humming4. wheel4 my8
       grief4 can8 heal,4 For8
       love4 will8 find4 a8
       way.2.
     }

     righthand = \relative c''' {
       \clef treble

       #(set-octavation 1)
       <d d'>4. <d d'>4.
       <d d'>4. <c d fis a>4.
       #(set-octavation 0)
       <b, g'>4 <b d>8 <fis d'>4 <c a'>8
       \autoBeamOff <b g'>( d) \stemUp b' \stemNeutral \autoBeamOn <b, d g>4.
       b8 d g b, d g
       c, d fis c d fis
       b, d g b, d g
       c, d fis d' c a
       <d, fis>4 <d fis>8 <d g>4 <d g>8
       <d fis>4 <d fis>8 <d g b>4 r8
       \autoBeamOff <b d g>( d'-. g-.) <c,, d fis a>( d'-. d'-.) \autoBeamOn
       <b,, d g>4 d'8-. <g b d g>4.\fermata
       <b,, e g>4. <b e g>4.
       <e a>4. <e a>4.
       <b dis a'>4. <b dis a'>4.
       <b e g>4. r4 r8
       <b e g>4 r8 r4 r8
       <c e a>4. <c d fis>4\fermata r8
       <g b d> <g b d> <g b d> <b d g> <d g b> <fis a c d>
       <g b d g>2 r8 g16 g
       <cis, ais'>8 g' g <cis, ais'>8 g' g
       <g b g'>4. <d g b d>4 <d g>8
       <d g b>4. <c d fis a>4.
       <b d g>4 <d b'>8 <b g'>4.
       b8 d g b, d g
       c, e a c, e a
       c, d fis c d fis
       b, d g b, d g
       d g b \autoBeamOff e,( \stemUp c' \stemNeutral <d, b>) \autoBeamOn
       c e a c, e a
       <b, d g>4. <c d fis>4. <b d g>2. \bar ".|."
     }

     lefthand = \relative c'' {
       \clef bass

       #(set-octavation 1)
       b8( a g b a g)
       a( g fis c' fis, d)
       #(set-octavation 0)
       d( e d c a d,)
       <g, d'>4. <g d' g>4.
       <g d'>4 r8 <g d'>4 r8
       <d' fis>4 r8 <d a'>4 r8
       <g, d'>4 r8 <e e'>4 r8
       <e e'>4 r8 <d' fis>4.
       c'4( d,8) b'4( d,8)
       c'4( d,8) g4 r8
       <d g>4 r8 <d fis>4 r8
       <a g'>4 r8 g'4.\fermata
       e8 fis g e fis g
       a( b c) a b c
       b, cis dis b cis dis(
       e) fis g e4 r8
       e4 r8 r4 r8
       c4. d4 r8
       d d d d d, <d, d'>\noBeam
       <a' a'>2 r4
       e''4. e
       d8( e fis g a b)
       d, e d( d,) e d
       \autoBeamOff <g, g'> b' g \autoBeamOn <g, d' g>4.
       <g d'> <g d'>
       <g e'> <g e'>
       <d' a'> <d a'>
       <g, d'> <g d'>
       <a g'> <g g'>
       c a
       d d,
       <g g'>2. \bar ".|."
     }

     dynamics = {
       s4.\f\< s\!
       s\> s\!
       s2. s
       \once \override DynamicText #'extra-offset = #'(2.0 . 0.0)
       s\mp
       \repeat unfold 19 s
       s\p
       \repeat unfold 7 s
     }

     tempomod = {
       \repeat unfold 11 s2.
       s4. \tempo 8=90 s4. \tempo 8=120
       s2. s s
       s4. s4 \tempo 8=100 s8
       s2.
       s4. \tempo 8=60 s4 \tempo 8=90 s8
       s2. s2 s8 \tempo 8=120 s8
       \repeat unfold 12 s2.
     }


     \score {
       <<
        \context Voice = mel {
          \autoBeamOff
          \global
          \melody
         }
        \context Lyrics = mel \text
       \context PianoStaff <<
         \context Staff=righthand \global \righthand
         \context Dynamics=dynamics \dynamics
         \context Staff=lefthand <<
           \global
           \lefthand
         >>
       >>
      >>
       \layout {
         \context {
           \type "Engraver_group_engraver"
           \name Dynamics
           \alias Voice % So that \cresc works, for example.
           \consists "Output_property_engraver"

           minimumVerticalExtent = #'(-1 . 1)

           \consists "Script_engraver"
           \consists "Dynamic_engraver"
           \consists "Text_engraver"

           \override TextScript #'font-size = #2
           \override TextScript #'font-shape = #'italic
           \override DynamicText #'extra-offset = #'(0 . 2.5)
           \override Hairpin #'extra-offset = #'(0 . 2.5)

           \consists "Skip_event_swallow_translator"

           \consists "Axis_group_engraver"
         }
         \context {
           \PianoStaff
           \accepts Dynamics
           \override VerticalAlignment #'forced-distance = #7
         }
       }
     }

     \score {
     <<
        <<
           \context Voice = mel {
              \autoBeamOff
              \global
              \set Staff.midiInstrument = "synth voice"
              \melody
           }
        >>
       \context PianoStaff <<
          \context Staff=righthand \global \righthand
         \context Dynamics=dynamics \dynamics
         \context Staff=lefthand <<
           {\global \lefthand }
           \tempomod
         >>
     >> >>
       \midi { \tempo 8=120
         \context {
           \type "Performer_group_performer"
           \name Dynamics
           \consists "Span_dynamic_performer"
           \consists "Dynamic_performer"
         }
         \context {
           \PianoStaff
           \accepts Dynamics
         }
         \context {
           \Voice
           \remove "Dynamic_performer"
           \remove "Span_dynamic_performer"
         }
       }
     }

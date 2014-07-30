\header {
       title = "The Dove Song"
     }

     global = {
        \time 4/4
        \key g \major
     }

     melody = \relative c'' { \dynamicUp \stemUp
       \clef treble \override Stem #'neutral-direction = #1

       b4 \times 2/3 { b8[ c b] } a( \stemUp d4.) \stemNeutral
       r4 \times 2/3 { b8[ c b] } a( \stemUp d4.) \stemNeutral
       b4^\markup { \italic Andante. } b8. b16 b4 b
       e,2. r4
       e fis8. fis16 g4 g8( g)
       a4.\< b8 a2 | b4\! b8 b b4 b
       e2.\fermata r4\fermata \override Stem #'neutral-direction = #-1
       \once \override TextScript #'extra-offset = #'(3 . 0) d8\mp^\markup { \italic Andantino. }
       b4 b8 b4 a8 g \override Stem #'neutral-direction = #1
       b( a4. e4.) e8
       d4 fis8. g16 a4 g8[ a]
       b2 r4 r8 b \override Stem #'neutral-direction = #-1
       d4 b b a8 g \override Stem #'neutral-direction = #1
       b4 a e4. e8
       d4 g8. b16 a4. fis8
       g2.\fermata r8 b \override Stem #'neutral-direction = #-1
       d2.\< \times 2/3 { a8[ b a] }
       b( d4.) r4 d,
       e8[ g] fis[ a] g[ b] a[ e']
       d4\! \times 2/3 { d8[ e d] } <g, g'>2 \bar ".|."
     }

     text = \lyricmode {
       Now,4 \times 2/3 { flutter4 and8 } fly,2
       \skip 4 \times 2/3 { flutter4 and8 } fly,2
       Bear4 him8. my16 heart4 of
       gold,2. \skip 4
       Bid4 him8. be16 brave4 little
       carrier2 dove!
       Bid4 him8. be16 brave4 and
       bold!2. \skip 4
       Tell8 him4 that8 I4 at8 my
       spinning2 wheel,4. Will8
       sing4 while8. it16 turns4 and
       hums,2 \skip 8*3 And8
       think4 all day of8 his
       love4 so leal,4. Un8 --
       til4 with8. the16 flute4. he8
       comes.2. \skip 8 Now8
       fly,2. \times 2/3 { flutter4 and8 }
       fly,2 \skip 4 Now4
       flutter and fly, a --
       way, a -- way.2
     }

     righthand = \relative c' {
       \clef treble
       #(override-auto-beam-setting '(end * * * *) 1 4 'Staff)
       \override Stem #'neutral-direction = #1

       \repeat unfold 2 { r4 <b d g> <c d fis>2 }
       b'4 b8. b16 <b, dis b'>4 <b dis b'>
       <g b e>2. r4
       <g b e> <a b fis> <b e g>2
       <c e a>2. r4
       <b e g>2-. <b dis fis a>-.
       <e g b e>2.\fermata r4\fermata
       b8 d b d b d b d
       c e c e c e c e
       c d c d c d c d
       \repeat unfold 8 { b d }
       c e c e c e c e
       b d b d b d b d
       b[ d b'] d,\noBeam <b g'>4\fermata r8 b'8
       d4 a\trill d r \override Stem #'neutral-direction = #-1
       b8( d4.) #(set-octavation 1) g4\trill g'8 r
       <c, e> r <c d fis> r <b d g> r <c e a> r
       <b d g>4 <c d fis a> <g' b d g>2 \bar ".|."
     }

     lefthand = \relative c {
       \clef bass

       r4 <g g'> d'2
       r4 d d2
       b'4 b8. b16 b,4 b
       e2. r4
       e dis e2
       c2. r4
       b2 <b, b'>
       <e, e'>2. r4
       <g' d'> <g d'> <g d'> <g d'>
       <g e'> <g e'> <g e'> <g e'>
       <d' a'> <d a'> <d a'> <d a'>
       <g, d'> \repeat unfold 7 { <g d'> }
       <g e'> <g e'> <g e'> <g e'>
       <d' g> <d g> <d fis> <d fis>
       <g, d'> <g d'> <g d'> r
       d d' <fis c'> r
       d, d' <g b> r
       R1
       d'4 d, g,2 \bar ".|."
     }

     dynamics = {
       s1*5
       s1\<
       s2\! s2
       s1\f
       s1*12
     }

     tempomod = {
       s1*2
       \tempo 4=80 s1*5
       \tempo 4=75 s2. \tempo 4=60 s4
       \tempo 4=90 s1*7
       s2 \tempo 4=60 s4 \tempo 4=45 s8 \tempo 4=90 s8
       s1*4
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
       \midi { \tempo 4=90
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

\header
	{
	title = "Spin, Wheel, Reel Out Thy Golden Thread."
	meter = \markup { \italic { Vivace. } }
     	}

global =
	{
	\time 4/4
	\key g \major
	}

melody = \relative c''
	{
	\dynamicUp \clef treble \autoBeamOff

	\partial 8*1 d8
	d4. b8 a b g[ d]
	e2 r4 e'
	d4. fis16[ e] d8 c a e'
	d2( b)
	b4 b4. b8 b8. b16
	g4 a b4. b8
	d4. e8 d4. a8
	d4. <e g>8 d4. d8
	c4\< b b4. a8
	e'2 r4 d
	cis-. d-. e4.-. d8-.
	<g, g'>2.-.\! r4 \bar ".|."
	}

text = \lyricmode
	{
	\partial 8*1 Spin,8
	wheel,4. reel8 out thy golden4
	thread,2 \skip 4 My4
	hap4. -- py8 heart sings glad and
	gay,1
	Hero2 \skip 8 shall8 scape8. the16
	O4 -- gre dread,4. And8
	I4. my8 own4. true8
	love4. shall8 wed.4. For8
	love4 has found4. a8
	way,2 \skip 4 For4
	love has found4. a8
	way.2. \skip 4
	}

righthand = \relative c'
	{
	\clef treble

	\partial 8*1 b8
	d( e g b d e g b)
	c,,( e a b c e a e')
	d( c a fis c' a fis d)
	b'( g d b g' d b g)
	b b b b \repeat unfold 4 <fis a b dis>
	<g b e> <e g b> <c e a>4 <b dis fis b>4. b'8 \autoBeamOff
	  <<
	    { d4.( e8) d4.( a8) | d4.( g8) d4. d8 } \\
	    {
	      r8 <fis, a c> <fis a c> r r <fis a c> <fis a c> r
	      \repeat unfold 2 { r <d g b> <d g b> r }
	    }
	  >>
	\autoBeamOn <e g c>4 <d g b> <c e b'>4. a'8
	<e a c e>2 r4 <d g b d>
	<c g' ais> <d g b> <e g c>4. <d fis c'>8
	<g b d g>2. r4 \bar ".|."
	}

lefthand = \relative c
	{
	\clef bass

	\partial 8*1 r8
	<g d' g>2 r
	<g e'> r
	<d' fis c'> <d fis c'>4 r
	<g, d' g>2 <g d' g>
	b'8 b b b <b, b'> <b b'> <b b'> <b b'>
	\autoBeamOff b b c c b[ b b b]
	\repeat unfold 2 { <d, d'> <d' fis c'> <d fis c'> r }
	\repeat unfold 2 { g, <d' g b> <d g b> r }
	d4 d c4. c8
	<a a'>2 r4 d
	d d d4. d8
	<g, d' g>2. r4 \bar ".|."
	}

dynamics =
	{
	\partial 8*1 s8
	s1*4
	s2\f\< s4. s8\!
	s1*7
	}

tempomod =
	{
	
	}


\score
	{
	  <<
	    \context Voice = mel
	      {
	      \autoBeamOff
	      \global
	      \melody
	      }
	    \context Lyrics = mel \text
	    \context PianoStaff
	      <<
	      \context Staff=righthand \global \righthand
	      \context Dynamics=dynamics \dynamics
	      \context Staff=lefthand
                << \global \lefthand >>
	      >>
	  >>

	\layout
	  {
	  \context
	    {
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
	  \context
	    {
	    \PianoStaff
	    \accepts Dynamics
	    \override VerticalAlignment #'forced-distance = #7
	    }
	  }
	}

\score
	{
	  <<
	    <<
	    \context Voice = mel
	      {
	      \autoBeamOff
	      \global
	      \set Staff.midiInstrument = "synth voice"
	      \melody
	      }
	    >>
	  \context PianoStaff
	    <<
	    \context Staff=righthand \global \righthand
	    \context Dynamics=dynamics \dynamics
	      \context Staff=lefthand
                <<
                { \global \lefthand }
	        \tempomod
	        >>
	    >>
	  >>
	\midi
	  {
	  \tempo 4=97
	  \context
	    {
	    \type "Performer_group_performer"
	    \name Dynamics
	    \consists "Span_dynamic_performer"
	    \consists "Dynamic_performer"
	    }
	  \context
	    {
	    \PianoStaff
	    \accepts Dynamics
	    }
	  \context
	    {
	    \Voice
	    \remove "Dynamic_performer"
	    \remove "Span_dynamic_performer"
	    }
	  }
	}

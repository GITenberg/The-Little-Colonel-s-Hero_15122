\header
	{
	title = "Fairy Chorus."
     	}

global =
	{
	\time 6/8
	\key c \major
	}

melody = \relative c''
	{
	\dynamicUp \clef treble \autoBeamOff

	\partial 8*1 << g8^\markup { \override #'(font-shape . caps) Duett. } \\ g >> \stemNeutral
	<c e>4 <g e'>8 <f d'> <f b> << g \\ f >>
	<e c'>4. r4 <e g>8
	<e g>4 <e g>8 <d f>[ <e g>] <d f>
	<c e>4.( <e g>8) r <g c>
	<b d>4 <b d>8 << d4 \\ c >> <a d>8
	<b d>4.( <g b>4) <d b'>8
	<d b'> <d b'> <d b'> <f c'>4 <c a'>8
	<b g'>4 r8 << g'4 \\ g >> r8
	<< g4 \\ f >> <e g>8 <d g>4 <c g'>8
	<b g'>4. r4 g'16( g)
	<< { g4 g8 aes4 f8 } \\ { g4 g8 aes4 f8 } >>
	g4. s4 << g8 \\ g >>
	<< { e'8.( d16) } \\ c4 >> <g c>8 <g b>[ <a c>] <f a>
	<e g>4.( <c e>4) <c e>8
	<e g>4 <e g>8 <d f>4 <e g>8
	<c e>4. r4 <c e>8
	<e a>4 <e a>8 <e b'>4 << e8 \\ e >>
	<e c'>4 <e c'>8 <a d>4 <a d>8
	<g e'>4 <e c'>8 <e g>4 <f d'>8
	<e c'>2 r8 \bar ".|."
	}

specialchord = \relative c'
	{
	\partial 8*1 s8
	s2.*11
	s4. <b d f>4 s8
	}

textone = \lyricmode
	{
	\set stanza = "1. "
	\partial 8*1 We8
	come,4 we8 come at thy
	call,4. \skip 4 On8
	rain4 -- bow8 bubbles4 we8
	float.2 __ \skip 8 We8
	fair4 -- ies,8 one4 and8
	all,2 __ \skip 8 Have8
	an -- swered the wind4 flute's8
	note.4 \skip 8 The4 \skip 8
	south4 wind's8 sil4 -- ver8 flute,4. \skip 4 From16 the
	far4 -- off8 sum4 -- mer8
	land,4. \skip 4 It8
	bade4 us8 ha4 -- sten8
	here,2 __ \skip 8 To8
	lend4 a8 help4 -- ing8
	hand.4. \skip 4 It8
	bade4 us8 ha4 -- sten,8
	ha4 -- sten8 here,4 To8
	lend4 a8 help4 -- ing8
	hand.2 \skip8
	}

texttwo = \lyricmode
	{
	\partial 8*1 \skip 8
	\skip 2.*7
	\skip 4. \set stanza = "2. " To8 the \skip 8
	aid4 of16 the gal4 -- lant8
	knight,4. \skip 4 To16 the
	help4 of16 the princess4.
	fair,4. \skip 4 To16 the
	res4 -- cue8 of4 the8
	prince,2 __ \skip 8 We8
	come4 to16 the O4 -- gre's8
	lair.4. \skip 4.
	To4 the8 res4 -- cue8
	of4 the8 prince,4 We8
	come4 to16 the O4 -- gre's8
	lair.2 \skip 8
	}

textthree = \lyricmode
	{
	\partial 8*1 \skip 8
	\skip 2.*7
	\skip 4. \set stanza = "3. " And4 \skip 8
	now,4 at8 thy4 be8 --
	hest,4. \skip 4 We8
	pause4 in16 our bright4 ar8 --
	ray,4. \skip 4 To8
	end4 thy8 wea4 -- ry8
	quest,2 __ \skip 8 For8
	love4 has8 found4 a8
	way.4. \skip 4 To8
	end4 thy8 wea4 -- ry8
	wea4 -- ry8 quest,4 For8
	love4 has8 found4 a8
	way.2 \skip 8
	}

lefthand = \relative c
	{
	\clef bass

	\partial 8*1 r8^\markup { \override #'(font-shape . caps) Piano. }
	c4 <g' c>8 <g b>4 r8
	c,4 <g' c>8 <g c>4 r8
	g4 g8 g,4 g8
	c4 g'8 c4 r8
	<d g>4 <d g>8 <d fis>4 <d fis>8
	<d g>4 <d g>8 d4 r8
	d,,4 d'8 a'4 c8
	g,4 d'8 <g b>4 r8
	g4 g8 g4 g8
	g4 g,8 g4 g8
	g'4 g8 aes4 f8
	g4. g,4 r8
	<c, c'>4 <g'' c e>8 <a c>4 r8
	<c,, c'>4 e'8 g4 r8
	<g, g'>4 g'8 b4 g8
	c,4 g'8 c4 r8
	<a c>4 <a c>8 <gis d'>4 <gis d'>8
	<a c>4 <a c>8 <f f'>4 f8
	g4 <g, g'>8 g4 <g b>8
	<c, g' c>2 r8 \bar ".|."
	}

\score
	{
	  <<
	    \context Voice = mel
	      {
	      \autoBeamOff
	      \global
	      << \melody \specialchord>>
	      }
	    \context Lyrics = mel \textone
	    \context Lyrics = meltwo \texttwo
	    \context Lyrics = melthree \textthree
	    \context PianoStaff
	      <<
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
	      	      \global
	      \set Staff.midiInstrument = "synth voice"
	      \melody
	      }
	    >>
	  \context PianoStaff
	    <<
	      \context Staff=lefthand
                <<
                { \global << \lefthand \specialchord >> }
	        >>
	    >>
	  >>
	\midi
	  {
	  \tempo 8=175
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
	    }
	  }
	}

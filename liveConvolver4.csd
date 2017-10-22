<Cabbage>
form size(520, 350), caption("LiveConvolver4"), pluginID("li47")
image bounds(0, 0, 520, 463), shape("sharp"),  colour(8, 28, 38, 255), 

rslider channel("inputVolume"), bounds(16, 20, 70, 70), text("inVolume"), range(0, 1, 1, 0.5, 0.001)
checkbox channel("inputSwitch"), bounds(108, 20, 20, 20), colour:0("green"), colour:1("red"), value(0)
label bounds(128, 20, 38, 10), text("swap"), align("left"),  
label text("inputs"), bounds(128, 28, 41, 10), align("left")
label bounds(108, 48, 52, 12), text("Brighten"), align("left"),  
label bounds(108, 76, 15, 12), text("in"), align("left"),  
label bounds(140, 76, 15, 12), text("IR"), align("left"),  
checkbox channel("brighten_input"), bounds(108, 60, 15, 16), colour:0("green"), colour:1("red"), value(0)
checkbox channel("brighten_IR"), bounds(140, 60, 15, 16), colour:0("green"), colour:1("red"), value(0)
rslider bounds(180, 20, 7, 7), text("Freq0"), channel("hpFreq0"), range(0, 1, 0.1) 
rslider channel("hpFreq"), bounds(180, 20, 70, 70), text("hpFreq"), range(20, 20000, 50, 0.35)
rslider bounds(256, 20, 7, 7), text("Freq0"), channel("lpFreq0"), range(0, 1, 0.95) 
rslider channel("lpFreq"), bounds(256, 20, 70, 70), text("lpFreq"), range(20, 20000, 14000, 0.35)
rslider channel("outVolume"), bounds(408, 20, 70, 70), text("outVolume"), range(0, 1, 0.9, 0.5, 0.001)
rslider channel("f_shift"), bounds(332, 20, 70, 70), text("f_shift"), range(0.0, 50.0, 1.2, 0.35, 0.001)

checkbox bounds(28, 104, 35, 40), channel("IR_record"), colour:0(0,142,0),  colour:1(142, 0, 0)
label bounds(20, 148, 65, 13), text("IR record"),  
label text("p.length"), bounds(411, 152, 63, 13)
combobox channel("partitionlength"), bounds(414, 137, 56, 15), items("256", "512", "1024", "2048", "4096"), channeltype("string"), value(4)
;csoundoutput bounds(16, 344, 474, 114), text("Output")

button bounds(64, 104, 38, 18), channel("IR_rec_mode"), text("Man", "Auto"), colour:1(0,142,0),  colour:0(142, 0, 0)
button bounds(64, 126, 38, 17), channel("IR_trans_rec"), text("Tra0", "Tra1"), colour:1(0,142,0),  colour:0(142, 0, 0)

rslider bounds(104, 96, 70, 70), channel("IR_update_rate"), range(0.1, 4, 1, 0.5, 0.001), text("IR u.rate"),  
rslider bounds(180, 96, 70, 70), channel("IR_size"), range(0.1, 5.9, 1, 0.5, 0.001), text("IR size"),  
rslider bounds(256, 96, 70, 70), channel("IR_dly"), range(0, 2.5, 0, 0.5, 0.001), text("IR dly"),  
rslider bounds(332, 96, 70, 70), channel("IR_pitch"), range(0.125, 2, 1, 0.5, 0.001), text("IR pitch"),  
checkbox bounds(394, 96, 8, 8), channel("IR_pitchquantize"), value(1), oncolour("ffff0000"),  colour(0, 128, 0, 255), 
button bounds(412, 98, 65, 22), channel("IR_direction"), text("Rev", "Fwd"), value(1), colour:0(142, 0, 0), colour:1(0,142,0)
label bounds(411, 120, 64, 13), text("Direction"),  

hslider bounds(18, 174, 90, 10), channel("low_transientThresh"), range(-60, 0, -40, 1),  colour(0,142,0), trackercolour(0,142,0), trackerthickness(0.9)
hslider bounds(108, 174, 90, 10), channel("amp_transientThresh"), range(0, 20, 7, 1),  colour(0,142,0), trackercolour(0,142,0), trackerthickness(0.9)
hslider bounds(198, 174, 90, 10), channel("amp_transientDoubleLimit"), range(0.01, 2, 0.5, 1, 0.01),  colour(0,142,0), trackercolour(0,142,0), trackerthickness(0.9)
hslider bounds(288, 174, 90, 10), channel("amp_transientDecThresh"), range(0, 20, 7, 1),  colour(0,142,0), trackercolour(0,142,0), trackerthickness(0.9)
hslider bounds(378, 174, 90, 10), channel("amp_transientDecTime"), range(0.1, 10, 3, 1),  colour(0,142,0), trackercolour(0,142,0), trackerthickness(0.9)
label bounds(18, 194, 64, 10), text("noisefloor")
label bounds(108, 194, 64, 10), text("trans thresh")  
label bounds(198, 194, 64, 10), text("double limit")
label bounds(288, 194, 64, 10), text("dec thresh")  
label bounds(398, 194, 64, 10), text("dec time")  


image bounds(-10, -10, 2, 20), colour("red"), widgetarray("inbuffer", 160)
image bounds(84, 193, 3, 20), colour("red"), identchannel("input_record_pointer")
image bounds(-10, -10, 2, 20), colour("red"), identchannel("IR_record_pointer")
image bounds(-10, -10, 2, 20), colour("red"), widgetarray("IR_contents", 160)

label bounds(24, 236, 27, 14), text("IR"), align("left"),  
label bounds(24, 212, 41, 12), text("input"), align("left"),  
checkbox bounds(23, 224, 15, 9), channel("Animation"), value(1), oncolour("ffff0000"),  colour(0, 128, 0, 255), 
 
label bounds(56, 264, 126, 13), text("Amp"),  align("left ")   
label bounds(208, 264, 125, 13), text("Freq"),  align("left ")
label bounds(356, 264, 52, 13), text("Wave"), align("left ")  
label bounds(424, 264, 46, 13), text("Parm"), align("left ")  

image bounds(16, 280, 456, 19), colour(255, 255, 255, 0), plant("GUIabst_11"){
hslider bounds(39, 0, 147, 14), channel("LFO1_amp"), range(0, 1, 0, 1, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
hslider bounds(189, 0, 147, 14), channel("LFO1_freq"), range(0, 10, 1, 0.3, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
combobox bounds(333, 0, 60, 18), channel("LFO1_wave"), channeltype("float"), text("Sine, Tri, Sawu, Sawd, Square , Noise")
combobox bounds(400, 0, 63, 18), channel("LFO1_destination"), channeltype("float"), text("inVol, outVol, hpFreq, lpFreq, f.shift, IR rec, IR u.rate, IR size, IR dly, IR pitch, IR dir")
label bounds(0, 2, 37, 13), text("LFO1"), align("left"),  
}
image bounds(16, 300, 456, 19), colour(255, 255, 255, 0), plant("GUIabst_13"){
hslider bounds(39, 0, 147, 14), channel("LFO2_amp"), range(0, 1, 0, 1, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
hslider bounds(189, 0, 147, 14), channel("LFO2_freq"), range(0, 10, 1, 0.3, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
combobox bounds(333, 0, 60, 18), channel("LFO2_wave"), channeltype("float"), text("Sine, Tri, Sawu, Sawd, Square , Noise")
combobox bounds(400, 0, 62, 18), channel("LFO2_destination"), channeltype("float"), text("inVol, outVol, hpFreq, lpFreq, f.shift, IR rec, IR u.rate, IR size, IR dly, IR pitch, IR dir")
label bounds(0, 2, 37, 13), text("LFO2"), align("left"),  
}
image bounds(16, 320, 456, 19), colour(255, 255, 255, 0), plant("GUIabst_15"){
hslider bounds(39, 0, 146, 14), channel("LFO3_amp"), range(0, 1, 0, 1, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
hslider bounds(189, 0, 146, 14), channel("LFO3_freq"), range(0, 10, 1, 0.3, 0.01),  colour(0, 40, 120), trackercolour(0, 40, 120), trackerthickness(0.9)
combobox bounds(333, 0, 60, 18), channel("LFO3_wave"), channeltype("float"), text("Sine, Tri, Sawu, Sawd, Square , Noise")  
combobox bounds(400, 0, 62, 18), channel("LFO3_destination"), channeltype("float"), text("inVol, outVol, hpFreq, lpFreq, f.shift, IR rec, IR u.rate, IR size, IR dly, IR pitch, IR dir")
label bounds(0, 2, 36, 13), text("LFO3"), align("left"),  
}
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -m0d
</CsOptions>
<CsInstruments>

	sr = 44100
	ksmps = 32
	nchnls = 2	
	0dbfs = 1

	giSine ftgen 0, 0, 65536, 10, 1	
	giTri  ftgen 0, 0, 4096, 7, 0, 1024, 1, 2048, -1, 1024, 0
	giSawu ftgen 0, 0, 4096, 7, -1, 4096, 1
	giSawd ftgen 0, 0, 4096, 7, 1, 4096, -1
        giSquare ftgen 0, 0, 4096, 7, 1, 2048, 1, 0, -1, 2048, -1
        giLFOwaves ftgen 0, 0, 8, -2, giSine, giTri, giSawu, giSawd, giSquare, giSine, giSine, giSine
        gkpartitionlen init 2048
	gi_sourcebuf_len init 524288
	gi_sourcebuf_len_sec = gi_sourcebuf_len/sr
	gi_sourcebuf ftgen 0, 0, gi_sourcebuf_len, 2, 0	; empty table, 

	giIR_maxlen init 262144
	giIR_maxlen_sec = giIR_maxlen/sr
	giIR_record ftgen 0, 0, giIR_maxlen, 2, 0	; empty table, 

        ginumbars = 150
        giRed ftgen 0, 0, 1024, 7, 1, 341, 0, 341, 0, 342, 1
        giGreen ftgen 0, 0, 1024, 7, 0, 341, 1, 341, 0, 342, 0
        giBlue ftgen 0, 0, 1024, 7, 0, 341, 0, 341, 1, 342, 0

opcode GetColour, S, k
        kndx xin 
        kred table kndx/ginumbars, giRed, 1
        kgreen table kndx/ginumbars, giGreen, 1
        kblue table kndx/ginumbars, giBlue, 1
        Scolour sprintfk "colour(%d, %d, %d)", kred*255, kgreen*255, kblue*255
        xout Scolour
        endop

opcode LFOO, k, S
        Sname xin 
        Samp strcat Sname, "_amp"
        Sfreq strcat Sname, "_freq"
        Swave strcat Sname, "_wave"        
        kLFOamp chnget Samp
        kLFOfreq chnget Sfreq
        kLFOwave chnget Swave
        kLFOwave -= 1 ; gui combobox is 1-indexed
        if kLFOwave == 5 then
        kLFO randh kLFOamp, kLFOfreq
        else
        kLFOwavetab table kLFOwave, giLFOwaves
        kLFO oscilikt kLFOamp, kLFOfreq, kLFOwavetab
        endif
        xout kLFO
        endop

opcode TransientDetect, kk,kikkkk
	kin, iresponse, ktthresh, klowThresh, kdecThresh, kdoubleLimit xin 
        ;setksmps 32
/*
	iresponse	= 10 		; response time in milliseconds
	ktthresh	= 6		; transient trig threshold 
	klowThresh	= -60		; lower threshold for transient detection
	kdoubleLimit	= 0.02		; minimum duration between events, (double trig limit)
	kdecThresh	= 6		; retrig threshold, how much must the level decay from its local max before allowing new transient trig
*/	
	kinDel		delayk	kin, iresponse/1000		; delay with response time for comparision of levels
	ktrig		= ((kin > kinDel + ktthresh) ? 1 : 0) 	; if current rms plus threshold is larger than previous rms, set trig signal to current rms
	klowGate	= (kin < klowThresh? 0 : 1)		; gate to remove transient of low level signals
	ktrig		= ktrig * klowGate			; activate gate on trig signal
	ktransLev	init 0
	ktransLev	samphold kin, 1-ktrig			; read amplitude at transient
	
	kreGate		init 1					; retrigger gate, to limit transient double trig before signal has decayed (decThresh) from its local max
	ktrig		= ktrig*kreGate				; activate gate
	kmaxAmp		init -99999
	kmaxAmp		max kmaxAmp, kin			; find local max amp
	kdiff		= kmaxAmp-kin				; how much the signal has decayed since its local max value
	kreGate		limit kreGate-ktrig, 0, 1		; mute when trig detected
	kreGate		= (kdiff > kdecThresh ? 1 : kreGate)	; re-enable gate when signal has decayed sufficiently 
	kmaxAmp		= (kreGate == 1 ? -99999 : kmaxAmp)	; reset max amp gauge

	; avoid closely spaced transient triggers (first trig priority)
	kdouble		init 1
	ktrig		= ktrig*kdouble
	if ktrig > 0 then
	reinit double
	endif
double:
        idoubleLimit  = i(kdoubleLimit)	
        idoubleLimit    limit idoubleLimit, 1/kr, 5
        kdouble		linseg	0, idoubleLimit, 0, 0, 1, 1, 1
	rireturn

	xout ktrig, kdiff
	endop


; control of updates from gui
        instr 1

        Spartitionlen chnget "partitionlength"
        kpartitionchanged changed Spartitionlen
        if (strlenk(Spartitionlen)>0) && (kpartitionchanged>0) then
        gkpartitionlen strtodk Spartitionlen 
        endif

        if (kpartitionchanged>0) then
        event "i", -14, 0, .1
        event "i", 14, 0.1, -1
        endif

        kpreroll chnget "IR_dly_mod"
        kdirection chnget "IR_direction_mod"
        krecord chnget "IR_record_mod"
        krectrig trigger krecord, 0.5, 0
        if krectrig > 0 then
          event "i", 11, 0.0, giIR_maxlen_sec, kpreroll, kdirection  ; record new audio to IR buffer
        endif
        chnset krectrig, "conv_update"

        ktrans_enable chnget "IR_trans_rec"
        if ktrans_enable > 0 then
          ktransient chnget "transient"
          if ktransient > 0 then
            kchunksize chnget "IR_size_mod" ; IR segment size
            event "i", 11, 0.0, kchunksize, kpreroll, kdirection  ; record new audio to IR buffer
          endif
          chnset ktransient, "conv_update"
        endif
        
        kauto chnget "IR_rec_mode"
        kautotrig_on trigger kauto, 0.5, 0
        kautotrig_off trigger kauto, 0.5, 1
        if kautotrig_on > 0 then
        event "i", 10, 0, -1
        endif
        if kautotrig_off > 0 then
        event "i", -10, 0, .1
        endif
        
        ; init display of input buffer
        kndx init 0
        if kndx <= ginumbars then 
        kndx += 1
        Schan sprintfk "inbuffer_ident%i", kndx
        Sbounds sprintfk "bounds(%d, 213, 2, 10)", 20+(kndx*3)
        Scolour GetColour kndx
        Sset sprintfk "%s, %s", Sbounds, Scolour
        chnset Sset, Schan
        endif
        endin

; apply modulators (LFO)
        instr 2
        
        ; read val (offset) from all parm destinations
        kinvol chnget "inputVolume"
        koutvol chnget "outVolume"
        khpfreq chnget "hpFreq"
        klpfreq chnget "lpFreq"
        kfshift chnget "f_shift"
        krec chnget "IR_record"
        kupdaterate chnget "IR_update_rate"
        ksize chnget "IR_size"
        kdly chnget "IR_dly"
        kpitch chnget "IR_pitch"
        kdir chnget "IR_direction"
        inumparms = 16
        inummods = 4
        i_inParms ftgen 0, 0, inumparms, 7, 0, inumparms, 0
        i_outParms ftgen 0, 0, inumparms, 7, 0, inumparms, 0
        i_mods ftgen 0, 0, inummods, 7, 0, inummods, 0
        imodscale ftgen 0, 0, inumparms*inummods, 7, 0, inumparms*inummods, 0
        kLFO1dest chnget "LFO1_destination"
        kLFO1dest = kLFO1dest-1
        kLFO1dest_old init 0
        kLFO2dest chnget "LFO2_destination"
        kLFO2dest = kLFO2dest-1
        kLFO2dest_old init 0
        kLFO3dest chnget "LFO3_destination"
        kLFO3dest = kLFO3dest-1
        kLFO3dest_old init 0
        if changed(kLFO1dest)>0 then
        tablew 0, kLFO1dest_old, imodscale
        tablew 1, kLFO1dest, imodscale
        kLFO1dest_old = kLFO1dest
        endif        
        if changed(kLFO2dest)>0 then
        tablew 0, kLFO2dest_old+inumparms, imodscale
        tablew 1, kLFO2dest+inumparms, imodscale
        kLFO2dest_old = kLFO2dest
        endif 
        if changed(kLFO3dest)>0 then
        tablew 0, kLFO3dest_old+(inumparms*2), imodscale
        tablew 1, kLFO3dest+(inumparms*2), imodscale
        kLFO3dest_old = kLFO3dest
        endif     
        kLFO1 LFOO "LFO1"
        kLFO2 LFOO "LFO2"
        kLFO3 LFOO "LFO3"
        kLFO1 = (kLFO1dest == 8 ? (kLFO1+chnget("kLFO1_amp"))*0.5 : kLFO1) ; special case for IR_dly
        kLFO2 = (kLFO2dest == 8 ? (kLFO2+chnget("kLFO2_amp"))*0.5 : kLFO2)
        kLFO3 = (kLFO3dest == 8 ? (kLFO3+chnget("kLFO3_amp"))*0.5 : kLFO3)
        tablew kLFO1, 0, i_mods
        tablew kLFO2, 1, i_mods
        tablew kLFO3, 2, i_mods
        tablew kinvol, 0, i_inParms
        tablew koutvol, 1, i_inParms 
        tablew pow((khpfreq-25)/15000,1/3), 2, i_inParms
        tablew pow((klpfreq-25)/15000,1/3), 3, i_inParms
        tablew kfshift, 4, i_inParms
        tablew krec, 5, i_inParms
        tablew kupdaterate, 6, i_inParms
        tablew ksize, 7, i_inParms
        tablew kdly, 8, i_inParms
        tablew kpitch, 9, i_inParms
        tablew kdir, 10, i_inParms
        kupdate = changed(kLFO1dest)+changed(kLFO2dest)+changed(kLFO3dest)
        modmatrix i_outParms, i_mods, i_inParms, imodscale, inummods, inumparms, kupdate
        kinvol1 table 0, i_outParms
        koutvol1 table 1, i_outParms 
        khpfreq1_ table 2, i_outParms
        klpfreq1_ table 3, i_outParms
        kfshift1 table 4, i_outParms
        krec1 table 5, i_outParms
        kupdaterate1 table 6, i_outParms
        ksize1 table 7, i_outParms
        kdly1 table 8, i_outParms
        kpitch1 table 9, i_outParms
        kdir1 table 10, i_outParms
        kinvol1 limit kinvol1, 0, 1
        koutvol1 limit koutvol1, 0, 1 
        khpfreq1 limit (pow(khpfreq1_,3)*15000)+25, 20, 20000
        klpfreq1 limit (pow(klpfreq1_,3)*15000)+25, 20, 20000
        kfshift1 limit kfshift1, 0, 20
        krec1 = int(limit(krec1,0,1))
        kupdaterate1 limit kupdaterate1, 0.1, 20
        ksize1 limit ksize1, 0.01, giIR_maxlen_sec
        kdly1 limit kdly1, 0, giIR_maxlen_sec
        kpitch1 limit kpitch1, 0, 2
        kdir1 = int(limit(kdir1,0, 1))

        chnset kinvol1, "inputVolume_mod"
        chnset koutvol1, "outVolume_mod"
        chnset khpfreq1, "hpFreq_mod"
        chnset klpfreq1, "lpFreq_mod"
        chnset kfshift1, "f_shift_mod"
        chnset krec1, "IR_record_mod"
        chnset kupdaterate1, "IR_update_rate_mod"
        chnset ksize1, "IR_size_mod"
        chnset kdly1, "IR_dly_mod"
        chnset kpitch1, "IR_pitch_mod"
        chnset kdir1, "IR_direction_mod"
   
        endin

; live IR source signal
        instr 3
        kinswitch chnget "inputSwitch"
        kinchan = (kinswitch > 0 ? 2 : 1)
        ;kfade chnget "IR_size_mod"
        kswitched changed kinchan
        if kswitched > 0 then
        reinit prevent_self_conv
        endif
        prevent_self_conv:
        kamp transeg 0, 0.1, 2, 1, 1, 1, 1
        rireturn
        a1 inch kinchan
        kbright chnget "brighten_IR"
        if kbright > 0 then
        a1 rbjeq a1, 10000, 10, 0.5, 0.5, 12
        endif

;analyze amplitude transients
	iresponse	        = 10 			                ; response time in milliseconds
	ktthresh	        chnget "amp_transientThresh"            ; transient trig threshold 
	klowThresh	        chnget "low_transientThresh"            ; lower threshold for transient detection
        kdoubleLimit            chnget "amp_transientDoubleLimit"       ; minimum duration between events, (double trig limit)
        kdecThresh	        chnget "amp_transientDecThresh"         ; retrig threshold, how much must the level decay from its local max before allowing new transient trig
	kAttack		        = 0.001				        ; envelope follower attack
	kRelease                chnget "amp_transientDecTime"           ; envelope follower release
	a_env		        follow2	a1, kAttack, kRelease	; envelope follower
        k_env		        downsamp a_env	
	ktransient, kdiff	TransientDetect dbfsamp(k_env), iresponse, ktthresh, klowThresh, kdecThresh, kdoubleLimit
                                chnset ktransient, "transient"

        chnset a1*kamp, "live_IR_source"
        ;outch 1, a1
        endin

; record to circular buffer
        instr 4
        a1 chnget "live_IR_source"
        andx phasor 1/gi_sourcebuf_len_sec
        tablew a1, andx, gi_sourcebuf, 1
        chnset andx, "live_IR_source_index"

        ; gui buffer display        
        kanimation chnget "Animation"
        if kanimation > 0 then
        ktrig metro 60
        kndx = downsamp(andx)*ginumbars
        kndx_prev init -1
        if (ktrig > 0) || (int(kndx) > kndx_prev) then
        Schan = "input_record_pointer"
        Sbounds sprintfk "bounds(%d, 203, 3, 20)", 20+(kndx*3)
        ;Scolour GetColour kndx
        Sset sprintfk "%s", Sbounds
        chnset Sset, Schan	
        kndx_prev = int(kndx)
        endif
        endif
        endin


; automatic IR update
        instr 10
        kupdaterate chnget "IR_update_rate_mod" ; how often we replace the IR
        ktrig metro kupdaterate
        kchunksize chnget "IR_size_mod" ; IR segment size
        kdirection chnget "IR_direction_mod" ; forwards/backwards (1/-1) IR chunk
        kpreroll chnget "IR_dly_mod" ; preroll (that is, delay of the IR in this case)
        if ktrig > 0 then 
          event "i", 11, 0.0, kchunksize, kpreroll, kdirection  ; record new audio to IR buffer
        endif
        chnset ktrig, "conv_update"
        endin

; transfer from buffer to IR (record IR)
	instr 11
        ipitch chnget "IR_pitch_mod"
        iquantize chnget "IR_pitchquantize"
        ipitch = (iquantize > 0 ? semitone(int(12*log2(ipitch))) : ipitch)
	irectime = ((p3*1/ipitch)>giIR_maxlen_sec?giIR_maxlen_sec:(p3*1/ipitch))
	p3 = giIR_maxlen_sec
	
	ipresample_sec = p4 ; number of seconds back in time to start
	idirection = p5 ; forwards(1) or backwards(0, used as -1)
        idirection = (idirection== 0 ? -1 : 1)
        if (idirection == 1) && (ipitch > 1) then
        iminpre = ((irectime*ipitch)-irectime)+(i(gkpartitionlen)/sr)
        ipresample_sec = (ipresample_sec < iminpre ? iminpre : ipresample_sec)
        endif
	ipresample = ipresample_sec/gi_sourcebuf_len_sec
        andx_start chnget "live_IR_source_index"
        konce init 1
        if konce > 0 then
        kndx_start downsamp andx_start ; get the current write index of the live input buffer
        konce = 0
        endif
        andx_source line 0, 1, idirection/gi_sourcebuf_len_sec
        andx_source wrap (andx_source*ipitch)+kndx_start-ipresample, 0, 1
        andx_IR line 0, 1, 1/giIR_maxlen_sec
        a1 table andx_source, gi_sourcebuf, 1
        
        ; trigger recording fade out and stop (based on gui manual trig, or time controlled by IR_length)
        krecord chnget "IR_record_mod"
        krecstop trigger krecord, 0.5, 1
        krecstop_on trigger krecord, 0.5, 0 ; if the instr is re-enabled while running
        kstopskip init 0                ; ... we don't want to "re-stop" recording
        kstopskip += krecstop_on        ; ...since, the instr instance runs after recording stopped
        if kstopskip < 2 then      ; ...we don't want old instances to mess up the more recent instances
        kmanual_switch init 1
        kmanual_switch = (krecstop > 0 ? 0 : kmanual_switch)
        ktime_switch init 1
        ktime timeinsts
        ktime_switch = (ktime > irectime-1/kr ? 0 : ktime_switch)
        ktimestop trigger ktime_switch, 0.5, 1
        kstop max ktimestop, krecstop
        kswitch min kmanual_switch, ktime_switch
        if ktimestop > 0 then
        chnset ktime_switch, "IR_record"
        endif
        endif
        
        ; envelopes and audio writing
        ifadetime = 0.1
        amp linseg 0, ifadetime, 1, p3-(ifadetime*2), 1, ifadetime, 0
        if kstop > 0 then
        reinit fadeout
        endif
        fadeout:
        afadeout linseg 1, ifadetime, 0, 1, 0
        if kswitch == 0 then
        amp2 = afadeout
        else
        amp2 = 1
        endif
        a1 = a1 * amp * amp2       
        tablew a1, andx_IR, giIR_record, 1
        ; gui display of IR record pointer
        inumactive active p1
        chnset inumactive, "numactive"
        knumactive chnget "numactive"
        ;Stest sprintfk "num active %i %i", inumactive, knum
        ;puts Stest, knum+1
        kanimation chnget "Animation"
        if kanimation > 0 then
        kgui metro 60
        kamp downsamp (amp*amp2)
        kIRndx = downsamp(andx_IR)*ginumbars
        kndx = downsamp(andx_source)*ginumbars
        kndx_prev init -1
        if (kgui > 0) || (int(kndx) > kndx_prev) then
        Schan = "IR_record_pointer"
        Sbounds sprintfk "bounds(%d, 213, %d, %d)", 20+(kndx*3), 3*kamp, (kamp*20)
        Scolour GetColour kndx
        Sset sprintfk "%s, %s", Sbounds, Scolour
        if  (kamp > 0) then 
        chnset Sset, Schan	
        endif
        ;if knumactive == inumactive then
        Sscoreline sprintfk {{i 19 0 %f %i %i %f "%s"}}, 1/kr, kndx, kIRndx, kamp, Scolour
        scoreline Sscoreline, 1
        ;endif
        kndx_prev = int(kndx)
        endif
        endif
	endin

; input signal to convolve with the IR
        instr 12
        kinswitch chnget "inputSwitch"
        kinchan = (kinswitch > 0 ? 1 : 2)
        kfade chnget "IR_size_mod"
        kswitched changed kinchan
        if kswitched > 0 then
        reinit prevent_self_conv
        endif
        prevent_self_conv:
        kamp transeg 0, i(kfade), 2, 1, 1, 1, 1
        rireturn
        ain inch kinchan
        kbright chnget "brighten_input"
        if kbright > 0 then
        ain rbjeq ain, 10000, 10, 0.5, 0.5, 12
        endif
        kinvol chnget "inputVolume_mod"
        ain = ain * kinvol * kamp
        chnset ain, "conv_in"
        ;outch 2, ain
        endin
        
; control IR updates
        instr 13
        kcount init 0
        kcount += 1
        iwait = i(gkpartitionlen)/ksmps
        if frac(iwait) > 0 then
        iwait = int(iwait)+1
        endif
        ktrig = (kcount == iwait ? 1 : 0) ; wait duration of one partition before triggering
        chnset ktrig, "conv_update"
        endin
        
; convolver
        instr 14
        
        ain chnget "conv_in"        
        iplen = i(gkpartitionlen)
        kupdate chnget "conv_update"
        kclean = 0
        aconv liveconv ain, giIR_record, iplen, kupdate, kclean
                
        ; filtering
        khpfreq chnget "hpFreq_mod"        
        klpfreq chnget "lpFreq_mod"
	khpfrq0		chnget "hpFreq0"			; 
	khpfrqMap	= (pow(khpfrq0,3)*15000)+25	; mapping
	khpfrqMapChange	changed khpfrqMap
	if khpfrqMapChange > 0 then
			chnset khpfrqMap, "hpFreq"
	endif
	klpfrq0		chnget "lpFreq0"			; 
	klpfrqMap	= (pow(klpfrq0,3)*15000)+25	; mapping
	klpfrqMapChange	changed klpfrqMap
	if klpfrqMapChange > 0 then
			chnset klpfrqMap, "lpFreq"
	endif	

        khpfreq tonek khpfreq, 5
        khpfreq tonek khpfreq, 3
        khpfreq tonek khpfreq, 2
        klpfreq tonek klpfreq, 5
        klpfreq tonek klpfreq, 3
        klpfreq tonek klpfreq, 2
        aconv rbjeq aconv, khpfreq, ampdbfs(-50), 0.8, 1, 2
        aconv rbjeq aconv, klpfreq, ampdbfs(-50), 0.8, 1, 0

        koutvol chnget "outVolume_mod"
        ; normalization based on ...
        knorm = 1;0.06
        aconv = aconv * koutvol * knorm
        
        ; single sideband modulation for frequency shifting
	kshift  chnget "f_shift_mod"
	aSin, aCos	hilbert	aconv	
	aModSin		oscili	1, kshift, giSine, 0.0
	aModCos		oscili	1, kshift, giSine, 0.25
	aMod1		= aSin * aModCos
	aMod2		= aCos * aModSin
	;aSum		= aMod1 + aMod2
	aDiff		= aMod1 - aMod2
        
        outs aDiff, aDiff
        endin


; IR buffer display, called from IR recording instr (11)
	instr 19
	i_in_ndx = p4
	i_IR_ndx = p5
	iamp = p6
	Scolour strget p7
        Schan sprintf "IR_contents_ident%d", i_IR_ndx
        Sbounds sprintfk "bounds(%d, %d, 2, %d)", 20+(i_IR_ndx*3), 233+((1-iamp)*20), (iamp*20)+2
        Sset sprintf "%s, %s", Sbounds, Scolour
        chnset Sset, Schan	
	endin

        instr 99
        a0 = 0
        chnset a0, "conv_in"
        chnset a0, "live_IR_source"
        endin
                
        ; hack
        instr 100
        ;chnset "2048", "partitionlength"
        endin
        
        
</CsInstruments>
<CsScore>

#define SCORELEN #86400#
i1 0.1 $SCORELEN        ; gui updates
i2 0.0 $SCORELEN        ; modulators
i3 0.0 $SCORELEN        ; live IR source signal
i4 0.0 $SCORELEN        ; record to circular buffer

i14 0.0 -1              ; convolve
i12 0.1 $SCORELEN       ; input signal
i99 0.1 $SCORELEN       ; zero chns
;i100 0 0.1           ; string menu hack
e

</CsScore>
</CsoundSynthesizer>


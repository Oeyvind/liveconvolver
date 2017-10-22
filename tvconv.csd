<Cabbage>
form size(510, 180), caption("Tvconv live"), pluginID("tvc1")
image bounds(0, 0, 510, 280), shape("sharp"),  colour(8, 28, 38, 255), 

checkbox channel("bright1"), bounds(30, 10, 15, 15), colour:0("green"), colour:1("red"), value(0)
label bounds(45, 10, 38, 10), text("bright"), align("center"),  
checkbox channel("bright2"), bounds(90, 10, 15, 15), colour:0("green"), colour:1("red"), value(0)
checkbox channel("trig1"), bounds(20, 30, 40, 30), colour:0("green"), colour:1("red"), value(0)
checkbox channel("trig2"), bounds(80, 30, 40, 30), colour:0("green"), colour:1("red"), value(0)
label bounds(20, 63, 38, 10), text("trig1"), align("center"),  
label bounds(80, 63, 38, 10), text("trig2"), align("center"),  

combobox bounds(140, 12, 55, 12), channel("p_size"), items("256", "512", "1024", "2048", "4096", "8192", "16384", "32768", "65536"), value(1)
combobox bounds(140, 46, 55, 12), channel("f_size"), items("256", "512", "1024", "2048", "4096", "8192", "16384", "32768", "65536"), value(7)
label bounds(145, 28, 55, 10), text("p_size"), align("left"),  
label bounds(145, 62, 55, 10), text("f_size"), align("left"),  

rslider bounds(200, 15, 60, 60), text("fadetime"), channel("fadetime"), range(0, 0.2, 0.05, 1, 0.001) 
rslider bounds(260, 15, 60, 60), text("fshift"), channel("fshift"), range(0, 20, 4, 1, 0.1) 

rslider bounds(320, 15, 7, 7), text("Freq0"), channel("hpFreq0"), range(0, 1, 0.1) 
rslider channel("hpFreq"), bounds(320, 15, 60, 60), text("hpFreq"), range(20, 20000, 50, 0.35)
rslider bounds(380, 15, 7, 7), text("Freq0"), channel("lpFreq0"), range(0, 1, 0.95) 
rslider channel("lpFreq"), bounds(380, 15, 60, 60), text("lpFreq"), range(20, 20000, 14000, 0.35)
rslider channel("outVolume"), bounds(440, 15, 60, 60), text("outVolume"), range(0, 1, 0.9, 0.5, 0.001)

csoundoutput bounds(10, 80, 456, 91) text("Output") 

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

ksmps = 64
nchnls = 2
0dbfs = 1

giSine ftgen 0, 0, 65536, 10, 1	

opcode tvupdate, aa, kkkk
 ; update freeze value only at filter boundaries
 kswitch, kcnt, kfadetime, kfiltsize xin
 kfreeztrig_ trigger kswitch, 0.5, 2
 kfreezswitchready init 0
 kfreezswitchready = kfreeztrig_ > 0 ? 1 : kfreezswitchready
 kfreeztrigset init 0
 if kfreezswitchready == 1 && kcnt == 0 then
  kfreeztrigset = kswitch
  kfreezswitchready = 0
  kenvtrig = 0
 endif
 afreeze  init 1
 afreeze = a(1-kfreeztrigset)
 
 kenv = kcnt >= (i(kfiltsize)-(kfadetime*sr)) ? 0 : 1
 kenv = kfadetime == 0 ? 1 : kenv
 ;kenv = kfreeztrigset == 0 ? 1 : kenv
 kenvfiltfq divz 1, limit(kfadetime, 0.0001, 1), 10
 aenv butterlp a(kenv), kenvfiltfq
 aenv pow aenv, 2

 xout afreeze,aenv
endop

instr 1
 a1, a2 ins
 kbright1 chnget "bright1"
 if kbright1 > 0 then
 a1 rbjeq a1, 10000, 10, 0.5, 0.5, 12
 endif
 kbright2 chnget "bright2"
 if kbright2 > 0 then
 a2 rbjeq a2, 10000, 10, 0.5, 0.5, 12
 endif

 ktrig1 chnget "trig1"
 ktrig2 chnget "trig2"
 kfadetime chnget "fadetime"
 kpartsize_ chnget "p_size"
 kfiltsize_ chnget "f_size"
 ksize[] fillarray 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536
 kpartsize = ksize[kpartsize_-1]
 kfiltsize = ksize[kfiltsize_-1]

 kfadetime = (kfadetime*kfiltsize)/sr
 kupdate changed kpartsize, kfiltsize
 if kupdate>0 then
  reinit theconvolver
 endif

 theconvolver:
 kcnt init 0
 kcnt += ksmps
 kcnt = kcnt >= i(kfiltsize) ? 0 : kcnt 
 afreeze1,aenv1 tvupdate ktrig1, kcnt, kfadetime, kfiltsize
 afreeze2, aenv2 tvupdate ktrig2, kcnt, kfadetime, kfiltsize
 aconv tvconv a1*aenv1,a2*aenv2,afreeze1,afreeze2,i(kpartsize),i(kfiltsize)
 aconv clip aconv,1,0dbfs

 ; filtering
 khpfreq chnget "hpFreq" 
 khpfrq0 chnget "hpFreq0"			; 
 khpfrqMap = (pow(khpfrq0,3)*15000)+25	; mapping
 khpfrqMapChange changed khpfrqMap
 if khpfrqMapChange > 0 then
 chnset khpfrqMap, "hpFreq"
 endif
 klpfreq chnget "lpFreq"
 klpfrq0 chnget "lpFreq0"			; 
 klpfrqMap = (pow(klpfrq0,3)*15000)+25	; mapping
 klpfrqMapChange changed klpfrqMap
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

 koutvol chnget "outVolume"
 ; normalization based on ...
 knorm = 1;0.06
 aconv = aconv * koutvol * knorm

 ; single sideband modulation for frequency shifting
 kshift chnget "fshift"
 aSin, aCos hilbert aconv	
 aModSin oscili	1, kshift, giSine, 0.0
 aModCos oscili	1, kshift, giSine, 0.25
 aMod1 = aSin * aModCos
 aMod2 = aCos * aModSin
 ;aSum = aMod1 + aMod2
 aDiff = aMod1 - aMod2
        
 outs aDiff, aDiff

endin

</CsInstruments>
<CsScore>
f1 0 1024 7 1 512 1 1 0 511 0

i1 0 86400
</CsScore>
</CsoundSynthesizer>
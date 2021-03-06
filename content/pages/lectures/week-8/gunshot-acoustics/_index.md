+++
title = "Gunshot acoustics"
outputs = ["Reveal"]
[reveal_hugo]
theme = "solarized"
# show_notes = "separate-page"
+++

# Gunshot acoustics

{{% note %}}

* we will look at the capabilities of analysis but also the limitations 
* these techniques can be applied to other events as well 
* besides speech recordings, this might be the most common recording to analyze 

---

## Sound-Ranging 

* Military use developed by William Lawrence Brag 
* Try to answer the question: ‘Who fired first? How many shots were fired? What calibre of weapon was used?’

{{% note %}}
, in which the triangulation of enemy gunfire was first used. One of the earliest techniques of this kind was known as Sound-Ranging, developed by William Lawrence Bragg, a British military officer and physicist. The system was designed to perform calculations based on the differences between signals captured from microphone arrays, and by the time the Second World War had begun, most countries were using some form of Sound-Ranging method (Van der Kloot, 2005). 

Nowadays recordings used for these types of analysis are captured from mobile phones, emergency call centres, or dash-mounted and body-worn cameras to inform opinions in relation to a number of questions, such as: ‘Who fired first? How many shots were fired? What calibre of weapon was used?’

---

## Other requested information 

* Video imagery 
* locations and nature of the microphones
* number of people involved 

{{% note %}}
In the field of acoustics, there is often a requirement for corroborative information relating to the event, something that would normally not be requested for the majority of other examinations, in a bid to mitigate against biases. Requests generally include being provided with any video imagery (to aid in providing information with regards to the position of the source of a sound), the locations and nature of the microphones (for example, stationary or moving), and the number of people involved (to limit the number of potential sound sources contained within a recording). There is a fine line between corroborative and biasing information, so great care should be taken to request only that which is necessary for the work being performed. When and how any of this information was relied upon should also be documented within both working notes and the final report.

---

## Sub-disciplines 

* Timing information 
* Number of acoustic events 
* Identification of type of sound
* Identification of the source of the sound
* Location of sound source
    * Multilateration  

{{% note %}}
* Timing information 
    * Important when there is a dispute over thr chronology of events 
    * can aid in determining the type of firearms used by measuring the interval between consecutive shots and showing who fired first
    *  For example, imagine a case where a single gun has been recovered from the scene, but the defendant claims he was not acting alone and had an accomplice who also fired. As the weapon is known, and as timing information relating to each firearm is different, further research into the specific gun used is required to measure the shortest possible interval between shots, by having a firearms expert fire off a series of consecutive shots as quickly as they possibly can (Beck, 2017). Measurements can then be made to determine the shortest possible interval between the shots and comparisons made against the periods between shots on the evidence recording to determine if the defendant’s claims are correct. If it is found that the weapon can fire, say, one round every 200 ms, and the gap between audible gunshots is 100 ms, this would be consistent with the information provided by the defendant. Obviously, there may be other considerations, for example, ‘Did he have a weapon in each hand?,’ but other types of analysis could then be used to determine whether each shot was fired from the same location. 
* Number of acoustic events 
    * How many times was the weapon fired? 
    * First we need to find out which sounds are gunshots and not something the sounds like them  
* Identification of type of sound
    * is the sound a gun? not necessarily answering the question of what type of gun it is 
    * problems can occur if: similar sounds are occurring within the same period, and the desired signal occurs at a distance, while being out of the direct line of the microphone, convolution can cause the captured sound to become too complex to draw a reliable conclusion.
* Identification of the source of the sound
    * It can, therefore, be very difficult to determine if specific artifacts are related to the type of gun, the capture environment, the capture device, or a combination of all three.
    * identification of gun type is difficult because of the quality of consumer-grade recording devices 
    * gunshots can also cause clipping depending on the distance from the recording device 
    * Despite the various difficulties, it should be noted that when there are a limited number of weapons, which are identifiable, and a significant disparity between the sounds emitted by each, there is an increased possibility of a conclusion being rendered. For example, if a police officer had a small calibre handgun and a suspect had a shotgun, the differences would be much greater than if both had a handgun.
* Location of sound source
    * For the location of a sound source to be determined, known characteristics are used based on reverberation, sound quality, and information from multiple channels.  
    * moving sources - orientation of the firearm can affect the sound level and, thus, the characteristics of the capture signal 

---

## Multilateration 

<img src="multilateration.png" width="40%">

{{% note %}}
* Multilateration is the process of determining the location of a sound source from the position of multiple microphones. This allows the time difference of arrival (TDOA) to be used to identify the possible sound source locations, providing the location of the microphones is known. The higher the number of microphones, the more accurate and reliable the analysis

---

## Stages of multilateration 

* Estimate positions of microphones
* Synchronization 
* Time difference of arrival calculation 
* See paper demoing multilateration techniques - [here](https://projekter.aau.dk/projekter/files/198526294/main.pdf)

{{% note %}}

{{% note %}}
* Estimate positions of microphones
    * can be obtained using video, diagrams, or other sources that have been provided which relate to the captured audio. It is essential to identify uncertainties, and if necessary, remove them from the analysis at this stage to prevent errors in the results. 
* Synchronization 
    * Information in relation to the formats of the recordings must be documented, and if there are compressed recordings within the dataset, these must be decoded into a PCM format to mitigate against the effects of compression. The recordings can then be transcoded to ensure they are all of the same sample rate. A synchronisation point must then be determined. The most common point is a signal transmitted to police radios, as all individuals wearing one will receive the signal at the same time without any delay caused by the TDOA. 
* Time difference of arrival calculation 
    * For the TDOA to be estimated, the corresponding time instants must be determined within the audio waveforms. Some waveforms will not have represented the signal in a manner suitable for this to be performed so they cannot be used, and others may not be in a direct line of the source, so would be reflected and diffracted. As all captures will influence the results, great care must be taken throughout to ensure only recordings suitable for this type of analysis are used. The multilateration estimate can then be calculated. 
* ACtually doing this is probably outsid ethe scope of this course - lets look for a minute at this paper demonstrating the math needed - 

---

## Acoustics of a gunshot 

* Muzzle blast 
* Shockwave 
* Reflections 

    
{{% note %}}    
* Muzzle blast 
    * Firearms use hot expanding gas caused by the combustion of gunpowder to expel a bullet out of the barrel. 
    * As the gas escapes from the end of the barrel, it causes a disturbance to the surrounding acoustic pressure, resulting in what is referred to as a ‘muzzle blast.’
    * typically less than 3 milliseconds in duration and propagates in all directions, although the magnitude is strongest in the direction the barrel is pointed. 
    * The signal can exceed 150 dB in the immediate vicinity of the blast, but when fitted with a silencer or sound suppressor, the magnitude is significantly reduced (Freytag et al., 2005; Koenig et al., 1998). 
    * The acoustical characteristics of the muzzle blast depend on various factors, including the type and size of the weapon, the ammunition used, the direction of the barrel axis in relation to the microphone, the presence of reflections, and diffractions from obstacles (Beck, 2019b).
* Shockwave 
    * If the bullet is travelling faster than the speed of sound, the acoustic disturbance causes a nonlinear, three- dimensional shockwave cone which trails the trajectory of the bullet. This leaves traces of an acoustic shockwave and shockwave reflections visible within the captured waveform. Exceeding the speed of sound means shockwaves appear before the sound of the muzzle blast as they are the first wave to reach the microphone (Maher and Shaw, 2008).
* Reflections 
    * Although the direct blast is brief, the capture will include longer responses due to multipath reflections from the ground and obstacles within the environment, both of which can be categorized as the early reflections. There will also be late reflections caused by higher-order reflections (reflections of reflections). As such, this area contains information about the environment rather than the weapon and can, therefore, be useful in differentiating between locations from which shots were fired rather than any information pertaining to the identity of the weapon (Maher, 2011).
    * Recordings of gunshots may also include sounds relating to the trigger and other firearm mechanisms.
 


---

## Analysis Methods

* Pre-processing
* Critical listening 
* Waveform analysis
* Envelope analysis
* FFT analysis 
* Cross correlation 

{{% note %}}

* Pre-processing
    * Before an examination can be performed, signals require preparation in the form of pre-processing to optimise any analysis scheduled to take place. 
    * In the case of gunshots, it is known that the peak spectral energy of a muzzle blast is between 500 Hz and 1000 Hz, while the energy of a shockwave is above 2000 Hz. 
    * Filtering and noise reduction can, therefore, be applied to mitigate the effects of broadband noise and increase the focus on the desired signal (Begault et al., 2019).
* Critical listening
    * Critical listening, with audio enhancements and in authentication examinations, is usually the first stage of any acoustic analysis and is used to determine an overall approach and document areas which require further analysis using objective methods.
    * It should not be used in isolation to render conclusions due to its subjective nature, and although experts can be trained to discriminate between sounds based on certain characteristics, evidence from so-called ‘experts’ who claim they are able to hear things that others cannot should not be accepted, as there is no such thing as a ‘golden ear’ (Begault et al., 2019).
* Waveform analysis
    * This type of analysis is used to provide information about relative timings and signal magnitudes at the receiver microphone. In the case of gunshots, it can be used to discriminate between the locations of two shooters based on the peak magnitude of the shots. Due to the aforementioned convolution of acoustic impulse events caused by the environment and signal processing, it can be difficult to isolate events without being provided with any further corroborating information.
* Envelope analysis
    * The envelope of a gunshot sound can be defined by splitting the window into short frames across the time domain, followed by calculating the root mean square of each frame. To define the bandpass envelope, a filter bank can be applied to the frames before the energy of specific bands is calculated. As envelopes can characterise the attack and decay of a signal, as well as the average peak energy, they can be used to identify multiple events by calculating the period between individual signal peaks. Envelopes can also be used to determine the consistency of various events with one another through overlapping and correcting to a common onset time.
* FFT analysis
    * Fast Fourier Transform (FFT) analysis can be applied to short acoustic events such as a muzzle blast to provide its frequency composition and allow comparisons between multiple instances to be performed.
    * A spectrogram can provide further visual information with regards to the relationship of an event’s temporal, frequency, and amplitude characteristics. For a gunshot, the spectrogram representation would be expected to be a short, high magnitude event which covers a broad range of frequencies. 
    * It will not provide any form of ‘fingerprint’ of a weapon due to the effects of the reflections within the environment, but it can be used to provide analysis of the differences between shots due to a change in position or azimuth in relation to the microphone.
    * When performing analysis using FFT, the parameters should be documented (such as the frame size, window function, and percentage of overlap between frames), as this can affect the frequency domain representation, and thus the results. When analyzing multiple events, the same parameters must be used for each to ensure differences or similarities are representative of those captured within the signal and are not caused by the settings. As with all FFT analysis, considerations must be made with regards to the time versus frequency resolution, as, for example, a short frame length with no overlap will provide an excellent time resolution, but poor frequency resolution.
* Cross-correlation
    * Cross-correlation is the most commonly used method for calculating the similarity of sounds in a quantitative manner. 
    * It does so by measuring the parity between a time-series signal and a time-shifted signal as a function of lag and is also the covariance (or measure of the relationship) of the two signals normalized by the product of their standard divisions. 
    * The correlation coefficient ‘r’ explains the percentage of variance between the signals where r2 = 100, and results range between -1 and +1, where +1 is a perfect linear relationship and -1 a perfect linear relation with a 180o phase shift. A correlation of 0.5, therefore, explains 25 per cent of the variance between the two waveforms (0.52). Its advantage lies in the fact that it quantifies the differences caused by the source, propagation channels, and recording systems. Caution must be practiced when comparing the same firearm at different azimuth angles, as the use of cross-correlation analysis has been shown to produce significantly different values, and the artificial shortening or smoothing of signals increases the cross-correlation (Lacey et al., 2014), as does a reduction in the bandwidth of the signal (Lacey, 2019). The latter is surmised to be caused by the cumulative effect of reduced high frequency variations, the effects of which were found not to compromise the ability to distinguish between gunshots from different firearms.




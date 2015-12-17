#lang pollen

◊title{How to use the FFT to make, and take apart, sinusoidal data}
◊author{Ahmed Fasih}

◊section{

◊h2{Data model. Or, a mathematical description of the data I've got.}

Suppose I have a radar-like device where, when I push a button, it broadcasts a brief radio signal, listens for echoes from reflectors, does some signal processing magic called correlation, and saves a list of numbers to disk. Suppose further that the ◊${N} saved numbers are complex-valued and have this mathematical form:

◊$${\vec{y} = \sum_{i=1}^{N_{t}} a_i \expp{-j 2 \pi \vec{f} t_i} + \text{noise}.
\label{eqn:forwardModel}}

That is, the ◊${N \times 1} data vector ◊${\vec{y}} contains one complex exponential◊sidenote['complex-exp]{A complex exponential is a sum of two special sinusoids: ◊${\expp{j\theta} = \cos(\theta) + j \sin(\theta)}, where ◊${j = \sqrt{-1}}.} for each reflector in the scene, plus a little bit of noise. Note that the ◊${i}th exponential has ampltide ◊${a_i}—it’s units don’t really matter—and frequency ◊${t_i}, in seconds. Why would something measured in seconds be called “frequency”? Because ◊${t_i} fulfills just that role here, specifying the oscillations per unit of of ◊${\vec f}, an ◊${N \times 1} vector of frequencies ◊${\vec{f}}, in Hertz.◊sidenote['bold]{Bold variables like ◊${\vec{f}} and ◊${\vec{y}} indicate vectors. Also, ◊${\vec{f}^T} indicates the transpose of ◊${\vec{f}}.} The ◊${N} numbers in this frequency vector are an evenly-spaced list of frequencies that the RF hardware actually broadcast. Let ◊${\vec{f} = f_0 + [0,\cdots,N-1]^T \delta_f}, where ◊${f_0} is the start frequency and ◊${\delta_f} the spacing between frequency bins—all in Hertz.

◊blockquote{
If you're confused by me using one word, “frequency”, both in the RF context (the frequencies broadcast by the antenna in Hertz, collected in ◊${\vec f}), ◊em{and} in the mathematical context of oscillation, ◊${t_i} in seconds, I apologize. Let me try to explain further, and hopefully you will continue to let me use this one word to refer to two different ideas, relying on context to separate them.

Firstly, the misconception that the rate of oscillation must be in Hertz probably comes from the ubiquity of ◊em{temporal} sampling. For example, when a sound card records audio of a middle-C tuning fork, with frequency of 261.626 Hz, at a sampling rate of 44.1 KHz, one is obtaining samples of ◊${\text{audio}(t_n) = \cos\bigpar{2 \pi \cdot 261.626 \cdot t_n},} where for the time of the ◊${n}th sample is ◊${t_n = \tfrac{n}{44.1 \times 10^3}} seconds. For this ◊em{temporal} audio signal, where each successive sample is taken at a different ◊em{time}, it's frequency 261.626 must be in units of ◊${\tfrac{1}{\text{seconds}} = \text{Hz}}. This can be seen seen as following from dimensional analysis: the argument to ◊${\cos} must be in radians, and ◊${2\pi} is in radians, so the units of $261.626 \cdot t_n$ must cancel out.  

In ◊${\eqref{eqn:forwardModel}}, we are sampling not a temporal signal, but a radar signal. The $n$th sample of ◊${\vec{y}} represents a signal taken at ◊${f_n = f_0 + n \delta_f}, which happens to be in units of Hertz, simply due to the nature of this application. Then, the other dimension, ◊${t_i} in seconds, can be called ◊${\vec y}'s “frequency” in the same way 261.626 Hz was called ◊${\text{audio}(t)}'s frequency in that example: both give the number of cycles per sample. The dimensional analysis is also satisfied since, what with ◊${t_i} being in seconds and ◊${\vec f} being in Hz=◊${\tfrac{1}{\text{seconds}}}, ◊${\vec f \cdot t_i} is unitless.

I will almost always refer to the RF context when I mention “frequency”, even when referring to the frequency domain (signal sampled in frequency), but I wanted to point out this semantic thorn hidden in the mathematico-engineering rose.
}

So while the hardware governs part of ◊${\eqref{eqn:forwardModel}} by pre-specifying ◊${\vec{f}}, the scene and its reflectors show up in those exponentials’ amplitudes and phases. The ◊${i}th exponential’s amplitude ◊${a_i} represents the size of the reflector,◊sidenote['rcs]{Jargon: its radar cross section.} and its frequency ◊${t_i} represents the round-trip time between the transmitter antenna and the reflector:

◊$${t_i = \tfrac{2}{c} \norm{\vec{p}_i - \vec{p}_{TX}},}

where ◊${c} is the speed of light in meters per second, and ◊${\vec{p}_i} and  ◊${\vec{p}_{TX}} are the 3D positions of the ◊${i}th reflector and the transmitter respectively, in meters. The transmitter-reflector distance is doubled (hence that 2 there) because its a round-trip.◊sidenote['norm]{◊${\norm{[x, y, z]^T} = \sqrt{x^2 + y^2 + z^2}}.}

◊h2{Resolution}

Having been given these ◊${N} complex numbers, I'd like to see what's actually out there: how many reflectors ◊${N_t} there are, how far away each is, and how big it is (how much energy did it reflect).◊sidenote['one-dim-range]{There are plenty of interesting facts about the scene that I can learn from this limited set of data. It doesn't bother me that this one snapshot from this one radar can only tell me ◊em{radial one-dimensional distance} to reflectors, and that if I had multiple snapshots I could measure their radial velocity; or, that if I had multiple radars I could estimate their 2D or even 3D positions.}

There's this concept of resolution. Clearly, if two reflectors were separated by the tiniest fraction of a meter, their reflections will arrive at nearly exactly the same time, creating two complex exponentials with nearly-identical frequency. Even in the presence of constructive or destructive interference between those two exponentials, it will be extremely hard to tell that there were two different exponentials, rather than just one.

People have proved various theorems that together state that you can reliably separate two equal-amplitude complex exponentials ◊${\expp{-j2\pi\vec{f} t_1}} and  ◊${\expp{-j2\pi\vec{f} t_2}} if their delta-frequencies ◊${|t_1 - t_2| \geq \tfrac{1}{N \delta_f}}. In words, the minimum reasonable separation in oscillation rates is inversely proportional to how many samples of data you have—in appropriately consistent units. The more data I can collect—in my radar example, the larger the bandwidth the antenna broadcasts—the more closely-spaced targets I can disambiguate.

}



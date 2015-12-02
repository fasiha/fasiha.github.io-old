#lang pollen
◊meta['template: "fft/template.html"]

◊title{How to use the FFT to make, and take apart, sinusoidal data}
◊author{Ahmed Fasih}

◊section{

◊h2{Data model. Or, a mathematical description of the data I've got.}

Suppose I have a radar-like device where, when I push a button, it broadcasts a brief radio signal, listens for echoes from reflectors, does some signal processing magic called correlation, and saves a list of numbers to disk. Suppose further that the ◊${N} saved numbers are complex-valued and have this mathematical form:

◊$${\vec{y} = \sum_{i=1}^{N_{t}} a_i \expp{-j 2 \pi \vec{f} t_i} + \text{noise}.
\label{eqn:forwardModel}}

That is, the ◊${N \times 1} data vector ◊${\vec{y}} contains one complex exponential◊sidenote['complex-exp]{A complex exponential is a sum of two special sinusoids: ◊${\expp{j\theta} = \cos(\theta) + j \sin(\theta)}, where ◊${j = \sqrt{-1}}.} for each reflector in the scene, plus a little bit of noise. Furthermore, the ◊${i}th exponential has ampltide ◊${a_i}—it’s units don’t really matter—and frequency ◊${t_i}, which happens to be in seconds.

This is a little strange: shouldn’t frequency be in Hertz? No, because the dimension along which the complex exponential varies is not time, but frequency, and is specified by an ◊${N \times 1} vector of frequencies ◊${\vec{f}}, in Hertz.◊sidenote['bold]{Bold variables like ◊${\vec{f}} and ◊${\vec{y}} indicate vectors. Also, ◊${\vec{f}^T} indicates the transpose of ◊${\vec{f}}.} The ◊${N} numbers in this frequency vector are an evenly-spaced list of frequencies that the RF hardware actually broadcast. Let ◊${\vec{f} = f_0 + [0,\cdots,N-1]^T \delta_f}, where ◊${f_0} is the start frequency and ◊${\delta_f} the spacing between frequency bins—all in Hertz. 

So while the hardware controls part of the expression in ◊${\eqref{eqn:forwardModel}} by pre-specifying ◊${\vec{f}}, the scene and its reflectors show up in those exponentials’ amplitudes and phases. The ◊${i}th exponential’s amplitude ◊${a_i} represents the size of the reflector,◊sidenote['rcs]{Jargon: its radar cross section.} and its frequency◊sidenote['freq]{I know I’m casually using “frequency” to describe both the radio waves the antenna broadcast, i.e., ◊${\vec{f}}, as well as the rate of oscillation of my data vector ◊${\vec{y}}, i.e., ◊${t_i}. And that it doesn't help that the units of ◊${t_i} are seconds, since it’s actually a round-trip time. The two are totally different, and I'm hoping the context helps keep the two distinct. ?} ◊${t_i} represents the round-trip time between the transmitter antenna and the reflector:

◊$${t_i = \tfrac{2}{c} \norm{\vec{p}_i - \vec{p}_{TX}},}

where ◊${c} is the speed of light in meters per second, and ◊${\vec{p}_i} and  ◊${\vec{p}_{TX}} are the 3D positions of the ◊${i}th reflector and the transmitter respectively, in meters. The transmitter-reflector distance is doubled (hence that 2 there) because its a round-trip.◊sidenote['norm]{◊${\norm{[x, y, z]^T} = \sqrt{x^2 + y^2 + z^2}}.}

◊h2{Resolution}

Having been given these ◊${N} complex numbers, I'd like to see what's actually out there: how many reflectors ◊${N_t} there are, how far away each is, and how big it is (how much energy did it reflect).◊sidenote['one-dim-range]{There are plenty of interesting facts about the scene that I can learn from this limited set of data. It doesn't bother me that this one snapshot from this one radar can only tell me ◊em{radial one-dimensional distance} to reflectors, and that if I had multiple snapshots I could measure their radial velocity; or, that if I had multiple radars I could estimate their 2D or even 3D positions.}

There's this concept of resolution. Clearly, if two reflectors were separated by the tiniest fraction of a meter, their reflections will arrive at nearly exactly the same time, creating two complex exponentials with nearly-identical frequency. Even in the presence of constructive or destructive interference between those two exponentials, it will be extremely hard to tell that there were two different exponentials, rather than just one.

People have proved various theorems that together state that you can reliably separate two equal-amplitude complex exponentials ◊${\expp{-j2\pi\vec{f} t_1}} and  ◊${\expp{-j2\pi\vec{f} t_2}} if their delta-frequencies ◊${|t_1 - t_2| \geq \tfrac{1}{N \delta_f}}. In words, the minimum reasonable separation in oscillation rates is inversely proportional to how many samples of data you have—in appropriately consistent units. The more data I can collect—in my radar example, the larger the bandwidth the antenna broadcasts—the better I can detect closely-spaced targets.

}



(defmodule fourier-approx
  (export all))

(defun opts ()
 #m(title ""
 ))

; # set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400
; # set output 'bivariat.8.png'
; set key fixed right bottom vertical Right noreverse enhanced autotitle nobox
; set style increment default
; set samples 500, 500
; set style data lines
; set title "Finite summation of 10, 100, 1000 fourier coefficients"
; set xrange [ -10.0000 : 10.0000 ] noreverse writeback
; set x2range [ * : * ] noreverse writeback
; set yrange [ -0.400000 : 1.20000 ] noreverse writeback
; set y2range [ * : * ] noreverse writeback
; set zrange [ * : * ] noreverse writeback
; set cbrange [ * : * ] noreverse writeback
; set rrange [ * : * ] noreverse writeback
; integral_f(x) = (x>0)?int1a(x,x/ceil(x/delta)):-int1b(x,-x/ceil(-x/delta))
; int1a(x,d) = (x<=d*.1) ? 0 : (int1a(x-d,d)+(f(x-d)+4*f(x-d*.5)+f(x))*d/6.)
; int1b(x,d) = (x>=-d*.1) ? 0 : (int1b(x+d,d)+(f(x+d)+4*f(x+d*.5)+f(x))*d/6.)
; f(x)=sin(x-1)-.75*sin(2*x-1)+(x**2)/8-5
; integral2_f(x,y) = (x<y)?int2(x,y,(y-x)/ceil((y-x)/delta)):                         -int2(y,x,(x-y)/ceil((x-y)/delta))
; int2(x,y,d) = (x>y-d*.5) ? 0 : (int2(x+d,y,d) + (f(x)+4*f(x+d*.5)+f(x+d))*d/6.)
; ack(m,n) = (m == 0) ? n + 1 : (n == 0) ? ack(m-1,1) : ack(m-1,ack(m,n-1))
; min(x,y) = (x < y) ? x : y
; max(x,y) = (x > y) ? x : y
; gcd(x,y) = gcd1(rnd(max(x,y)),rnd(min(x,y)))
; rnd(x) = int(x+0.5)
; gcd1(x,y) = (y == 0) ? x : gcd1(y, x - x/y * y)
; fourier(k, x) = sin(3./2*k)/k * 2./3*cos(k*x)
; sum10(x)   = 1./2 + sum [k=1:10]   fourier(k, x)
; sum100(x)  = 1./2 + sum [k=1:100]  fourier(k, x)
; sum1000(x) = 1./2 + sum [k=1:1000] fourier(k, x)
; delta = 0.2
; k = 1000
; plot     sum10(x)   title "1./2 + sum [k=1:10]   sin(3./2*k)/k * 2./3*cos(k*x)",     sum100(x)  title "1./2 + sum [k=1:100]  sin(3./2*k)/k * 2./3*cos(k*x)",     sum1000(x) title "1./2 + sum [k=1:1000] sin(3./2*k)/k * 2./3*cos(k*x)"

(defun eqn ()
  ;; TBD
  )

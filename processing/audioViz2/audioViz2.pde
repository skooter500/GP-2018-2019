import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(1024, 1024);
  
  minim = new Minim(this);
  ai = minim.getLineIn(Minim.MONO, width, sampleRate, 16);

  // Use this instead of the above to 
  //ai = minim.loadSample("Gorgon City - All Four Walls ft. Vaults.mp3", width);
  //ai.trigger();
  fft = new FFT(width, sampleRate);
  colorMode(HSB);  
}

Minim minim;
FFT fft; // Fast fourier transform
AudioInput ai;
// Use this to load a file instead
//AudioSample ai;

int sampleRate = 44100;

float[] bands;
        

void draw()
{
  background(0);
  float halfH = height / 2;
  float colorGap = 255 / (float) width;
  for(int i = 0 ; i < ai.bufferSize() ; i ++)
  {
    stroke(i * colorGap, 255, 255);
    line(i, halfH, i, halfH + ai.left.get(i) * halfH);
  }
  
  int count = 0;
  for(int i = 1 ; i < ai.bufferSize() ; i ++)
  {
    if (ai.left.get(i-1) < 0 && ai.left.get(i) >= 0)
    {
      count ++;
    }
  }
  
  text("Frequency: " + count * (sampleRate / width), 10, 50);
  
  fft.window(FFT.HAMMING);
  fft.forward(ai.left);
  
  int highestIndex = 0;
  float highest = 0;
  for (int i = 0 ; i < fft.specSize() ; i ++)
  {
    line(i, 0, i, fft.getBand(i));
    if (fft.getBand(i) > highest)
    {
      highest = fft.getBand(i);
      highestIndex = i;
    }
  }
  
  text("FFT Frequency: " + fft.indexToFreq(highestIndex), 10, 100);
  
}

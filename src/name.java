import com.sun.speech.freetts.VoiceManager;
public class name {
	
	public static void main(String args[])
	{
		new name().fun();
	}
	public void fun(){
	    VoiceManager voiceManager = VoiceManager.getInstance();
	 	String voiceName = "kevin16";
	 	com.sun.speech.freetts.Voice helloVoice = voiceManager.getVoice(voiceName);
        
	 	helloVoice.setRate(100f);
	 	helloVoice.allocate();
        helloVoice.speak("hello sumit");
        helloVoice.deallocate();
  }
}

package messages;
import com.vaadin.ui.Label;

import java.util.Locale;

import javax.swing.JButton;

public class MessTest {
	
	public MessTest() {
		JButton button = new JButton();
		String t=		Messages.ACCOUNT_ACTIONS_CAPTION_RESELLERROLEDELETE;
//		String t2=Messages.Account_Actions_Message_Selfpartnerships;
//		Account_Actions_Message_Selfpartnerships;
		
		Messages messages = new Messages(Locale.GERMAN);
//		Label label = new Label(messages.dealAdminErrorOrdercoultnotbeshippedwitherrormessage("Rote Krawatte", "Nicht mehr verfügbar"));
	}

	public static void main(String[] args) {
		new MessTest();
	}
}

package bbm.model;

public class EmailMessage {

    private String messageSend = "<div style=\"background-color: #e7fffc; padding: 4px;\">\n"
                + "    <div style=\"max-width:600px; margin: 8px auto;\">\n"
                + "        <div style=\"background-color: white; border-radius: 8px; padding: 8px;\">\n"
                + "            <div align=\"center\"><img src=\"http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png\" alt=\"Cart-Commerce\"\n"
                + "                                     style=\"height: 128px; width: 128px;\"></div>\n"
                + "            <h1 align=\"center\"><b>Your-Company-Name</b></h1>\n"
                + "            <hr>\n"
                + "            <h2 align=\"center\" style=\"padding-left: 96px; padding-right: 96px;\">\n"
                + "                <b style=\"color: green\">Welcome!</b><br> Please confirm your email for us.\n"
                + "            </h2>\n"
                + "            <br>\n"
                + "            <div id=\"content\" style=\"padding-left: 24px; padding-right: 24px;\">\n"
                + "                <p>Hello " + ",</p>\n"
                + "                <p>Thank you for registering at \"Company-name\" To verify your e-mail address, please click on the button below.</p>\n"
                + "                <div align=\"center\" style=\"margin: 32px;\">\n"
                + "                    <a href=\"http://http://localhost:8080/BBMProject/Register?email=\" target=\"_blank\" style=\"padding: 16px; background-color: limegreen; border-radius: 8px; text-decoration: none; color: white;\">\n"
                + "                        <b>Verify Address</b>\n"
                + "                    </a>\n"
                + "                </div>\n"
                + "                <br>\n"
                + "                <p>A warm welcome,</p>\n"
                + "                <p>Your company name support team</p>\n"
                + "                <hr>\n"
                + "                <p align=\"center\"><small>You received this email because you requested to register to \"Your website name\".<br>\n"
                + "                        If you didn't request to register, you can safely ignore this e-mail.</small></p>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</div>";;

    public EmailMessage() {
    }

    public String getMessageSend() {
        return this.messageSend;
    }

    public void setMessageSend(String messageSend) {
        this.messageSend = messageSend;
    }

}

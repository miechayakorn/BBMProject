package bbm.model;

public class EmailMessage {

    private String messageSend = "";

    public EmailMessage(String email, String activateKey, String todo) {
        if (todo.equals("Register")) {
            messageSend = SendEmailRegister(email, activateKey);
        }else if (todo.equals("Recovery")){
            messageSend = SendEmailRecovery(email, activateKey);
        }
    }

    public String SendEmailRegister(String email, String activateKey) {
        return "<div style=\"background-color: #333333; padding: 4px;\">\n"
                + "    <div style=\"max-width:600px; margin: 8px auto;\">\n"
                + "        <div style=\"background-color: white; border-radius: 8px; padding: 8px;\">\n"
                + "            <div align=\"center\"><img src=\"http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png\" alt=\"Cart-Commerce\"\n"
                + "                                     style=\"height: 128px; width: 128px;\"></div>\n"
                + "            <h1 align=\"center\"><b>BBM Condominium</b></h1>\n"
                + "            <hr>\n"
                + "            <h2 align=\"center\" style=\"padding-left: 96px; padding-right: 96px;\">\n"
                + "                <b style=\"color: green\">Welcome!</b><br> กรุณากดปุ่ม เพื่อยืนยัน Email ของคุณ.\n"
                + "            </h2>\n"
                + "            <br>\n"
                + "            <div id=\"content\" style=\"padding-left: 24px; padding-right: 24px;\">\n"
                + "                <p>Hello " + ",</p>\n"
                + "                <p>Thank you for registering at \"BBM Condominium\" To verify your e-mail address, please click on the button below.</p>\n"
                + "                <div align=\"center\" style=\"margin: 32px;\">\n"
                + "                    <a href=\"http://localhost:8080/BBMProject/Activate?email=" + email + "&activateKey=" + activateKey + "\" target=\"_blank\" style=\"padding: 16px; background-color: #9ABD97; border-radius: 8px; text-decoration: none; color: white;\">\n"
                + "                        <b>Verify Address</b>\n"
                + "                    </a>\n"
                + "                </div>\n"
                + "                <hr>\n"
                + "                <p align=\"center\"><small>You received this email because you requested to register to \"BBM Condominium\".<br>\n"
                + "                        If you didn't request to register, you can safely ignore this e-mail.</small></p>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</div>";
    }
    public String SendEmailRecovery(String email, String activateKey) {
        return "<div style=\"background-color: #333333; padding: 4px;\">\n"
                + "    <div style=\"max-width:600px; margin: 8px auto;\">\n"
                + "        <div style=\"background-color: white; border-radius: 8px; padding: 8px;\">\n"
                + "            <div align=\"center\"><img src=\"http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png\" alt=\"Cart-Commerce\"\n"
                + "                                     style=\"height: 128px; width: 128px;\"></div>\n"
                + "            <h1 align=\"center\"><b>BBM Condominium</b></h1>\n"
                + "            <hr>\n"
                + "            <h2 align=\"center\" style=\"padding-left: 96px; padding-right: 96px;\">\n"
                + "                <b style=\"color: green\">Welcome!</b><br> กรุณา กดปุ่มเพื่อเปลี่ยน รหัสผ่านของคุณ\n"
                + "            </h2>\n"
                + "            <br>\n"
                + "            <div id=\"content\" style=\"padding-left: 24px; padding-right: 24px;\">\n"
                + "                <div align=\"center\" style=\"margin: 32px;\">\n"
                + "                    <a href=\"http://localhost:8080/BBMProject/Recovery?email=" + email + "&activateKey=" + activateKey + "\" target=\"_blank\" style=\"padding: 16px; background-color: limegreen; border-radius: 8px; text-decoration: none; color: white;\">\n"
                + "                        <b>Change Password</b>\n"
                + "                    </a>\n"
                + "                </div>\n"
                + "                <br>\n"
                + "                <p align=\"right\">BBM support team</p>\n"
                + "                <hr>\n"
                + "                <p align=\"center\"><small>You received this email because you requested to register to \"BBM Condominium\".<br>\n"
                + "                        If you didn't request to register, you can safely ignore this e-mail.</small></p>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</div>";
    }

    public String getMessageSend() {
        return this.messageSend;
    }

    public void setMessageSend(String messageSend) {
        this.messageSend = messageSend;
    }

}

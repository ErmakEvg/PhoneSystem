/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.factory;

import by.phone.system.command.ActionCommand;
import by.phone.system.command.admin.UnBlockUserCommand;
import by.phone.system.command.admin.AddAbonentsCommand;
import by.phone.system.command.admin.AddAdminCommand;
import by.phone.system.command.admin.AddServiceCommand;
import by.phone.system.command.admin.BlockUserCommand;
import by.phone.system.command.admin.DeleteAdminsCommand;
import by.phone.system.command.admin.DeleteServiceCommand;
import by.phone.system.command.admin.DeleteUserCommand;
import by.phone.system.command.admin.DetailServiceCommand;
import by.phone.system.command.admin.DetailUserCommand;
import by.phone.system.command.admin.GetAbonentsCommand;
import by.phone.system.command.admin.GetAdminsCommand;
import by.phone.system.command.admin.GetMainCommand;
import by.phone.system.command.admin.GetServicesCommand;
import by.phone.system.command.admin.LoginCommand;
import by.phone.system.command.admin.LogoutCommand;
import by.phone.system.command.admin.UpdateAbonentsCommand;
import by.phone.system.command.admin.UpdateServiceCommand;
import by.phone.system.command.client.AddServiceForCommand;
import by.phone.system.command.client.GetAboutCommand;
import by.phone.system.command.client.GetContactsCommand;
import by.phone.system.command.client.GetHomePageAbonentCommand;
import by.phone.system.command.client.GetServicesClientCommand;
import by.phone.system.command.client.LoginAbonentCommand;
import by.phone.system.command.client.LogoutAbonentCommand;
import by.phone.system.command.client.PaymentServiceCommand;

/**
 *
 * @author user
 */
public enum CommandEnum {
    LOGIN {
    {
        this.command = new LoginCommand();
    }
    },
    LOGOUT {
    { 
        this.command = new LogoutCommand();
    }
    },
    GETABONENTS {
    { 
        this.command = new GetAbonentsCommand();
    }
    },
    ADDABONENTS {
    { 
        this.command = new AddAbonentsCommand();
    }
    },
    UPDATEUSER {
    { 
        this.command = new UpdateAbonentsCommand();
    }
    },
    DETAILUSER {
    { 
        this.command = new DetailUserCommand();
    }
    },
    BLOCKUSER {
    { 
        this.command = new BlockUserCommand();
    }
    },
    UNBLOCKUSER {
    { 
        this.command = new UnBlockUserCommand();
    }
    },
    DELETEUSER {
    { 
        this.command = new DeleteUserCommand();
    }
    },
    GETSERVICES {
    { 
        this.command = new GetServicesCommand();
    }
    },
    ADDSERVICE{
    { 
        this.command = new AddServiceCommand();
    }
    },
    DETAILSERVICE{
    { 
        this.command = new DetailServiceCommand();
    }
    },
    UPDATESERVICE{
    { 
        this.command = new UpdateServiceCommand();
    }
    },
    DELETESERVICE {
    { 
        this.command = new DeleteServiceCommand();
    }
    },
    GETMAIN {
    { 
        this.command = new GetMainCommand();
    }
    },
    GETADMINS{
    { 
        this.command = new GetAdminsCommand();
    }
    },
    DELETEADMIN {
    { 
        this.command = new DeleteAdminsCommand();
    }
    },
    ADDADMIN {
    { 
        this.command = new AddAdminCommand();
    }
    },
    LOGINABONENT {
    { 
        this.command = new LoginAbonentCommand();
    }
    },
    LOGOUTABONENT {
    { 
        this.command = new LogoutAbonentCommand();
    }
    },
    GETSERVICESCLIENT{
    { 
        this.command = new GetServicesClientCommand();
    }
    },
    ADDSERVICEFOR{
    { 
        this.command = new AddServiceForCommand();
    }
    },
    PAYMENTSERVICE{
    { 
        this.command = new PaymentServiceCommand();
    } 
    },
    GETABOUT{
    { 
        this.command = new GetAboutCommand();
    }
    },
    GETCONTACTS{
    { 
        this.command = new GetContactsCommand();
    }
    },
    GETHOMEPAGEABONENT{
    { 
        this.command = new GetHomePageAbonentCommand();
    }
    
    };
    ActionCommand command;
    public ActionCommand getCurrentCommand() {
        return command;
    }
}

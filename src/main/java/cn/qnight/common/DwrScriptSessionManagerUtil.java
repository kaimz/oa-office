package cn.qnight.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.directwebremoting.Container;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.extend.ScriptSessionManager;
import org.directwebremoting.servlet.DwrServlet;

import cn.qnight.model.entity.Employee;

public class DwrScriptSessionManagerUtil extends DwrServlet {

	private static final long serialVersionUID = -7504612622407420071L;

	public void init()

			throws ServletException {

		Container container = ServerContextFactory.get().getContainer();

		ScriptSessionManager manager = container

				.getBean(ScriptSessionManager.class);

		ScriptSessionListener listener = new ScriptSessionListener() {

			public void sessionCreated(ScriptSessionEvent ev) {

				HttpSession session = WebContextFactory.get().getSession();

				String userId = ((Employee) session.getAttribute("loginuser")).getId();

				ev.getSession().setAttribute("userId", userId);
				System.out.println("创建了session");
			}

			public void sessionDestroyed(ScriptSessionEvent ev) {
				System.out.println("销毁了session");

			}

		};

		manager.addScriptSessionListener(listener);

	}

}

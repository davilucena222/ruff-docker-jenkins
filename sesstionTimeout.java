import org.kohsuke.stapler.Stapler;
println(Stapler.getCurrentRequest().getSession().getMaxInactiveInterval()/60);

import javax.servlet.http.HttpSession;
import org.kohsuke.stapler.Stapler;
HttpSession session = Stapler.getCurrentRequest().getSession();
session.setMaxInactiveInterval(60 * 60);
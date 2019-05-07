package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	void run(HttpServletRequest request, HttpServletResponse response);
}

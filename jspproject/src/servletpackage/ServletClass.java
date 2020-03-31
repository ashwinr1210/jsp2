package servletpackage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.Blob;
import com.mysql.jdbc.Connection;

@MultipartConfig(maxFileSize = 16177215)

public class ServletClass extends HttpServlet {
	private String dbURL = "jdbc:mysql://localhost:3306/aswin?user=root";
	private String dbUser = "root";
	private String dbPass = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");

		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");

		Part filePart = request.getPart("img");
		String fileName = extractFileName(filePart);
		System.out.println("$$$$$$$$$$$$$@@@@@@@@$$$$$");

		String savePath = "D:\\images" + File.separator + fileName;
		System.out.println("savepath%%%%%%%" + savePath);
		File fileSaveDir = new File(savePath);
		filePart.write(fileSaveDir + File.separator);

		Connection conn = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");

			conn = (Connection) DriverManager.getConnection(dbURL);

			String sql = "INSERT INTO students_details (student_id,student_name, student_email,student_address, filename,path) values (?,?, ?,?, ?,?)";
			PreparedStatement statement = ((java.sql.Connection) conn).prepareStatement(sql);
			statement.setInt(1, id);
			statement.setString(2, name);
			statement.setString(3, mobile);
			statement.setString(4, address);
			statement.setString(5, fileName);
			statement.setString(6, savePath);
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			int row = statement.executeUpdate();
			if (row > 0) {
				out.println("<b>File uploaded and saved into database</b>");
//				out.println("<a href='display.jsp?id=" + id + "'><b>Display</b></a>");
				out.println("<a href='display.jsp '><b>Display</b></a>");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	private String extractFileName(final Part filePart) {
		final String partHeader = filePart.getHeader("content-disposition");

		for (String content : partHeader.split(";")) {
			if (content.trim().startsWith("filename")) {
				System.out.println("content" + content);
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}

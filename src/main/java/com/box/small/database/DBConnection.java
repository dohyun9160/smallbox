package com.box.small.database;
	import org.springframework.context.ApplicationContext;
	import org.springframework.context.support.GenericXmlApplicationContext;
	import org.springframework.jdbc.datasource.DriverManagerDataSource;

	import javax.sql.DataSource;
	import java.sql.Connection;

	public class DBConnection {
	    public static void main(String[] args) throws Exception {
	        // ������ ������ ��� �ٲ� �� ���� �̰Ÿ� ��� ��ġ�� �������ϰ� �ݺ��̵�
	        String DB_URL = "jdbc:mysql://localhost:3306/movie?useSSL=false&useUnicode=true&characterEncoding=utf8";
	//						"jdbc:mysql://localhost/movie"
//	        String DB_USER = "root";
//	        String DB_PASSWORD = "12345";
//	        String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	//
	          // setteró���� ������Ƽ�±׷� ó�� -> ���±׷� �ٲ� -> root-context.xml�� ��������
//	        DriverManagerDataSource ds = new DriverManagerDataSource();
//	        ds.setDriverClassName(DB_DRIVER);
//	        ds.setUrl(DB_URL);
//	        ds.setUsername(DB_USER);
//	        ds.setPassword(DB_PASSWORD);

	        ApplicationContext ac = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
	        DataSource ds = ac.getBean(DataSource.class);

	        Connection conn = ds.getConnection(); // �����ͺ��̽��� ������ ��´�.

	        System.out.println("conn = " + conn);
//	        assertTrue(conn!=null);
	    }
}

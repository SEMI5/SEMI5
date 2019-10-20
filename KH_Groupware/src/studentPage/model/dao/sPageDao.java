package studentPage.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import teacherPage.model.dao.tPageDao;

public class sPageDao {

	private Properties prop = new Properties();
	
	public sPageDao() {
		String file = tPageDao.class.getResource("/sql/studentPage/sPage-query.properties").getPath();
		
		try {
			prop.load(new FileReader(file));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	}
	
}

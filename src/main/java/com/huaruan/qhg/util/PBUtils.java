package com.huaruan.qhg.util;

import java.util.List;

import com.huaruan.qhg.bean.PageBean;
import com.huaruan.qhg.bean.User;
import com.huaruan.qhg.dao.UserDao;

/**
 * ��Ҫ����������PageBean
 * @author yangjian
 *@date 2019/3/15
 */
public class PBUtils {

	/**
	 * ����PageBean
	 * @param currPage��ǰҳ
	 * @param userDao
	 * @return
	 */
	public static PageBean generatorPB(int currPage,UserDao userDao) {
		// currPage�ǵ�ǰ��ҳ��
		int pageSize = 10;// ÿҳ��ʾ�ĸ���
		int allCount = userDao.findAllUserCount();
		// ת��double����Math��������allCount
		double allUserCount = allCount;
		// ��ҳ��
		int totalPage = (int) Math.ceil(allUserCount / pageSize);
		// mysql�� ʹ��limit��ѯ�ĵ�һ������Ϊ ��ʼ��¼��; �ڶ���Ϊ ÿҳ������
		int begin = (currPage - 1) * pageSize;// limit�ĵ�һ������
		List<User> userList = userDao.findUsersByPage(begin, pageSize);
		// ��װpageBean
		PageBean pb = new PageBean();
		pb.setAllCount(allCount);
		pb.setCurrPage(currPage);
		pb.setUserList(userList);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
}

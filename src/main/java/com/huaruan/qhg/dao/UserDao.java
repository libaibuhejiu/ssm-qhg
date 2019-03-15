package com.huaruan.qhg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huaruan.qhg.bean.User;

public interface UserDao {
	/**
	 * �����û��������û�
	 * @param username�û���
	 * @return �û�
	 */
	User findByUsername(String username);
	
	/**
	 * ����û�����
	 * @return �û�����
	 */
	int findAllUserCount();
	
	/**
	 * ������ʼ��¼����ÿҳ������ѯ���û��б�
	 * @param begin��ʼ�ļ�¼����Ҳ���Ǵӵڼ�����¼��ʼ
	 * @param pageSizeÿҳ��ʾ���û���
	 * @return
	 */
	List<User> findUsersByPage(@Param("begin") int begin,@Param("pageSize") int pageSize);
	
	/**
	 * �����û���ģ����ѯ
	 * @param usernameCondition
	 * @return �û��б�
	 */
	List<User> findByUsernameCondition(String usernameCondition);
	
	/**
	 * �����û�����id���ҳ�����id֮��������û�
	 * @param map������int id,String username
	 * @return
	 */
	User findExtraExistsByUsername(@Param("id")int id,@Param("username")String username);
	
	/**
	 * ����id�����û�
	 * @param id
	 * @return�û�����
	 */
	User findById(int id);
	
	/**
	 * �������û�
	 * @param user�û�
	 */
	void insertUser(User user);
	
	/**
	 * ���������û�
	 * @return
	 */
	List<User> findAllUser();
	
	/**
	 * ����user��id�޸��û���Ϣ
	 * @param user
	 */
	void updateById(User user);
	
	/**
	 * ����idɾ���û�
	 * @param id
	 */
	int deleteById(int id);

}

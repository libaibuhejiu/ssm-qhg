package com.huaruan.qhg.service;

import com.huaruan.qhg.bean.User;
/**
 * �û��Ľӿ���
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 * ע��
	 * @param user
	 * @return 1ע��ɹ���0ע��ʧ��,2�û��Ѵ���
	 */
	public int register(User user);
	
	/**
	 * ��¼ʱ�����û��������û�
	 * @param ������û���
	 * @return �ɹ����ظ��û�,ʧ�ܷ���null
	 */
	public User login(String unknowusername);

}

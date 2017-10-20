package com.hrrzf.fragment;

import android.support.v4.app.Fragment;
import android.util.Log;
import android.widget.ListView;

/**
 * ʹ������������ viewPager��fragment���ʹ�ã�
 * viewpager��Ԥ���أ���СΪ1������ǰҳ�� ǰ����ҳ���ʱ�����ټ��� ����ҳ�棬�����ǰҳ�洦�����һ��������ǰһ��
 * viewpagerҲ�����ټ�������ҳ�棬�е�ʱ����ض����˷��û������������ӹ�˾�������ĸ�����
 * fragment ����һ�� �����ķ���setUserVisibleHint���� 
 * 
 * @author Administrator
 *
 */
public abstract class LazyLordingBaseFragment extends Fragment {

	public ListView lv_my_room_all;
	/** Fragment��ǰ״̬�Ƿ�ɼ� */
	protected boolean isVisible;

	/**
	 * ���fragment���û��ɼ�����isVisibleToUserΪtrue��
	 * ���fragment���û����ɼ�����isVisibleToUserΪfalse��
	 */
	/**
	 * isVisibleToUser:�ķ��ع���
	 * viewpager ������Լ��� ���Ʒ�Χ������fragment�Ķ��٣������ȼ���fragment�����ص�ʱ��ͻ᷵�� �ȷ���false
	 * �ü��صĶ���������֮���ٸ���ÿ���Ѿ����ص�fragment��������ʾ��� ���ض�Ӧ�� true or false
	 * һ������� ���ȷ��� δչʾ���û���ǰ fragment�� state false ����� ���� չʾ��fragment��state true 
	 * ���û�������Ļ viewpage ����ʱ��viewpager ������ȥ����fragment�����ٺͼ��أ����ٲ����أ������ȷ���false
	 * ��Ϻ��ж� ���� ������state
	 * ���� �Դ�����
	 */
	@Override
	public void setUserVisibleHint(boolean isVisibleToUser) {
		super.setUserVisibleHint(isVisibleToUser);

		if (isVisibleToUser) {
			isVisible = true;
			onVisible();
		} else {
			isVisible = false;
			onInvisible();
		}
		Log.i("isVisiable","cscc isVisiable:"+isVisible);
	}

	/**
	 * �ɼ�
	 */
	protected void onVisible() {
		lazyLoad();
	}

	/**
	 * ���ɼ�
	 */
	protected void onInvisible() {
		hideLayout();
	}

	/**
	 * �ӳټ��� ���������д�˷���
	 */
	protected abstract void lazyLoad();
	
	protected abstract void hideLayout();
}

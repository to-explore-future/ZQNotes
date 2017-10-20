package com.hrrzf.fragment;

import android.support.v4.app.Fragment;
import android.util.Log;
import android.widget.ListView;

/**
 * 使用中往往都是 viewPager和fragment组合使用，
 * viewpager有预加载，最小为1，当当前页面 前后还有页面的时候最少加载 三个页面，如果当前页面处于最后一个或者最前一个
 * viewpager也会最少加载两个页面，有的时候加载多了浪费用户的流量，增加公司服务器的负担，
 * fragment 中有一个 这样的方法setUserVisibleHint（） 
 * 
 * @author Administrator
 *
 */
public abstract class LazyLordingBaseFragment extends Fragment {

	public ListView lv_my_room_all;
	/** Fragment当前状态是否可见 */
	protected boolean isVisible;

	/**
	 * 如果fragment对用户可见，则isVisibleToUser为true；
	 * 如果fragment对用户不可见，则isVisibleToUser为false；
	 */
	/**
	 * isVisibleToUser:的返回规律
	 * viewpager 会根据自己的 控制范围（加载fragment的多少），优先加载fragment，加载的时候就会返回 先返回false
	 * 该加载的都加在完了之后，再根据每个已经加载的fragment的真是显示情况 返回对应的 true or false
	 * 一般情况下 会先返回 未展示在用户面前 fragment的 state false ，最后 才是 展示的fragment的state true 
	 * 当用户滑动屏幕 viewpage 滑动时，viewpager 会优先去处理fragment的销毁和加载，销毁不返回，加载先返回false
	 * 完毕后，判断 返回 真正的state
	 * 后面 以此类推
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
	 * 可见
	 */
	protected void onVisible() {
		lazyLoad();
	}

	/**
	 * 不可见
	 */
	protected void onInvisible() {
		hideLayout();
	}

	/**
	 * 延迟加载 子类必须重写此方法
	 */
	protected abstract void lazyLoad();
	
	protected abstract void hideLayout();
}
